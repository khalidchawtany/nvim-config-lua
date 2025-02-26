local M = {}
M.has_value = function(tbl, value)
	for _, v in pairs(tbl) do
		if v == value then
			return true
		end
	end
	return false
end

-- Custom comparison function to sort strings with "/" at the end first
M.sort_with_slash_first = function(a, b)
	local a_ends_with_slash = a:sub(-1) == "/"
	local b_ends_with_slash = b:sub(-1) == "/"

	-- If one ends with "/" and the other doesn't, prioritize the one with "/"
	if a_ends_with_slash and not b_ends_with_slash then
		return true
	elseif not a_ends_with_slash and b_ends_with_slash then
		return false
	else
		-- If both end with "/" or neither does, sort alphabetically
		return a < b
	end
end

M.get_subs_methods = function()
	local case = require("textcase")
	local methods = {}
	for _, value in pairs(case.api) do
		local method = value.apply
		table.insert(methods, method)
	end

	table.insert(methods, function(str)
		case.api["to_snake_case"].apply(str)
		return string.gsub(str, "_", "")
	end)

	return methods
end

M.run_subs_fn = function(filepath, from, to)
	vim.fn.setreg("s", "%S/" .. from .. "/" .. to .. "/g")
	local uv = vim.loop
	local methods = M.get_subs_methods()
	uv.fs_open(filepath, "r", 438, function(err, fd)
		assert(not err, err)
		uv.fs_fstat(fd, function(err, stat)
			assert(not err, err)
			uv.fs_read(fd, stat.size, 0, function(err, data)
				assert(not err, err)
				local tried = {}
				for _, method in ipairs(methods) do
					local pattern = method(from)
					local replacement = method(to)

					if M.has_value(tried, pattern) == false then
						table.insert(tried, pattern)
						data = data:gsub(pattern, replacement)
					end
				end

				uv.fs_close(fd, function(err)
					assert(not err, err)

					uv.fs_open(filepath, "w", 438, function(err, fd2)
						assert(not err, err)
						uv.fs_write(fd2, data, -1, function(err, bytes)
							assert(not err, err)
							uv.fs_close(fd2, function(err)
								assert(not err, err)
							end)
						end)
					end)
				end)
			end)
		end)
	end)
end

-- M.run_subs_fn("/Users/juju/Projects/PHP/ltcoc/ltcoc/plugins/lox/coc/models/Proceeding.php", "proceeding", "matter")

M.rename = function(path, from, to, run_subs)
	local methods = M.get_subs_methods()
	local pwd = vim.loop.cwd()

	local tried = {}
	for _, method in ipairs(methods) do
		local pattern = method(from)
		local to_pattern = method(to)

		if M.has_value(tried, pattern) == false then
			if string.match(path, pattern) then
				local new_path = string.gsub(path, pattern, to_pattern)

				vim.fn.system({ "cp", "-r", path, new_path })

				if run_subs and path:sub(-1) ~= "/" then
					M.run_subs_fn(pwd .. "/" .. new_path, from, to)
					-- TODO: run subs on the files copied
				else
					-- remove duplicate with the old name eg:
					--                  Copy file: controllers/XXX/XXX_columns.yaml to controllers/YYY/YYY_columns.yaml
				end
				-- if has_slash_after_pattern(path, pattern) then
				-- end
			end
		end
		table.insert(tried, pattern)
	end
end

M.fze = function()
	require("fzf-lua").files({
		as_complete = true,
		previewer = false,
		path_shorten = false, -- 'true' or number, shorten path?
		prompt = "Files❯ ",
		multiprocess = true, -- run command in a separate process
		git_icons = false, -- show git icons?
		file_icons = false, -- show file icons (true|"devicons"|"mini")?
		color_icons = false, -- colorize file|git icons
		fd_opts = [[--color=never --hidden --type d --type f --type l --exclude .git]],
		fzf_opts = {
			-- options are sent as `<left>=<right>`
			-- set to `false` to remove a flag
			-- set to `true` for a no-value flag
			-- for raw args use `fzf_args` instead
			["--ansi"] = true,
			["--info"] = "inline-right", -- fzf < v0.42 = "inline"
			["--height"] = "100%",
			["--layout"] = "reverse",
			["--border"] = "none",
			["--highlight-line"] = true, -- fzf >= v0.53
		},
		actions = {
			["ctrl-x"] = function(selected, o)
				local fzf_path = require("fzf-lua.path")

				local paths = {}
				for _, path in ipairs(selected) do
					table.insert(paths, fzf_path.entry_to_file(path, o).path)
				end

				vim.ui.input({ prompt = "Old name: ", default = string.gsub(o.last_query, "'", "") }, function(old_name)
					if old_name == nil then
						return
					end
					vim.ui.input({ prompt = "New name: " }, function(new_name)
						if new_name == nil then
							return
						end
						vim.ui.select({ "Yes", "No" }, {
							prompt = "Run substitutions:",
							format_item = function(item)
								return item
							end,
						}, function(choice)
							if choice == nil then
								return
							end
							table.sort(paths, sort_with_slash_first)
							for _, path in ipairs(paths) do
								M.rename(path, old_name, new_name, choice == "Yes")
							end
						end)
					end)
				end)
			end,
		},
	})
end

return M
