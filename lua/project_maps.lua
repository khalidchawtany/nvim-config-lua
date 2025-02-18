local path = require("plenary.path")
local os_sep = path.path.sep

vim.keymap.set("n", "<leader>l;", require("user.missing_locale_finder").fzf_missing_translations)

_G.APPLIED_PROJECT_MAPS = nil

_G.PROJECTS_MAPS = {
	october = {
		{
			description = "M-Lang (OCT)",
			keys = "<leader>ll",
			paths = { { "plugins" } },
			prompt = "lang",
			fd_opts = { "--full-path", "-g", "**/lox/**/lang/**/*.php" },
		},
		{
			description = "M-Yaml (OCT)",
			keys = "<leader>lyy",
			paths = { { "plugins" } },
			prompt = "yaml",
			fd_opts = { "--full-path", "-g", "**/lox/**/*.yaml" },
		},
		{
			description = "M-Yaml - Controller (OCT)",
			keys = "<leader>lyc",
			paths = { { "plugins" } },
			prompt = "yaml",
			fd_opts = { "--full-path", "-g", "**/lox/**/controllers/*/*.yaml" },
		},
		{
			description = "M-Yaml - Models (OCT)",
			keys = "<leader>lya",
			paths = { { "plugins" } },
			prompt = "yaml",
			fd_opts = { "--full-path", "-g", "**/lox/**/models/*/*.yaml" },
		},

		{
			description = "M-Routes (OCT)",
			keys = "<leader>lw",
			paths = { { "plugins" } },
			prompt = "routes",
			fd_opts = { "--full-path", "-g", "**/lox/**/routes/*" },
		},

		{
			description = "M-Classes (OCT)",
			keys = "<leader>ls",
			paths = { { "plugins" } },
			prompt = "classes",
			fd_opts = { "--full-path", "-g", "**/lox/**/classes/**" },
		},
		{
			description = "M-Migrations (OCT)",
			keys = "<leader>lm",
			paths = { { "plugins" } },
			prompt = "migrations",
			fd_opts = { "--full-path", "-g", "**/lox/**/updates/*" },
		},
		{
			description = "M-Factories (OCT)",
			keys = "<leader>lf",
			paths = { { "plugins" } },
			prompt = "factories",
			fd_opts = { "--full-path", "-g", "**/lox/**/classes/factories/*" },
		},

		{
			description = "M-Fetchers (OCT)",
			keys = "<leader>lF",
			paths = { { "plugins" } },
			prompt = "fetchers",
			fd_opts = { "--full-path", "-g", "**/lox/**/classes/fetchers/*" },
		},
		{
			description = "M-Componenets (OCT)",
			keys = "<leader>loo",
			paths = { { "plugins" } },
			prompt = "components",
			fd_opts = { "--full-path", "-g", "**/lox/**/components/*.php" },
		},
		{
			description = "M-Componenets (OCT)",
			keys = "<leader>lo",
			paths = { { "plugins" } },
			prompt = "components",
			fd_opts = { "--full-path", "-g", "**/lox/**/components/**" },
		},
		{
			description = "M-Pages (OCT)",
			keys = "<leader>lp",
			paths = { { "themes" } },
			prompt = "pages",
			fd_opts = { "--full-path", "-g", "**/pages/**" },
		},
		{
			description = "Controllers PHP (OCT)",
			keys = "<leader>lC",
			paths = { { "plugins" } },
			prompt = "controllers",
			fd_opts = { "--full-path", "-g", "**/controllers/*.php" },
		},
		{
			description = "M-Controllers PHP (OCT)",
			keys = "<leader>lc",
			paths = { { "plugins" } },
			prompt = "controllers",
			fd_opts = { "--full-path", "-g", "**/lox/**/controllers/*.php" },
		},
		{
			description = "Controllers (OCT)",
			keys = "<leader>lC",
			paths = { { "plugins" } },
			prompt = "controllers",
			fd_opts = { "--full-path", "-g", "**/controllers/**" },
		},
		{
			description = "M-Controllers (OCT)",
			keys = "<leader>lk",
			paths = { { "plugins" } },
			prompt = "controllers",
			fd_opts = { "--full-path", "-g", "**/lox/**/controllers/**" },
		},
		{
			description = "M-Classes (OCT)",
			keys = "<leader>lu",
			paths = { { "plugins" } },
			prompt = "Classes (Util)",
			fd_opts = { "--full-path", "-g", "**/lox/**/classes/**" },
		},
		{
			description = "M-Models (OCT)",
			keys = "<leader>la",
			paths = { { "plugins" } },
			prompt = "models",
			fd_opts = { "--full-path", "-g", "**/lox/**/models/*.php" },
		},
		{
			description = "M-Models (OCT)",
			keys = "<leader>ln",
			paths = { { "plugins" } },
			prompt = "models",
			fd_opts = { "--full-path", "-g", "**/lox/**/models/*/*" },
		},
		{
			description = "Models (OCT)",
			keys = "<leader>lA",
			paths = { { "plugins" } },
			prompt = "models",
			fd_opts = { "--full-path", "-g", "**/models/*.php" },
		},
		{
			description = "lox (OCT)",
			keys = "<leader>l<leader>",
			paths = { { "plugins" } },
			prompt = "all",
			fd_opts = { "--full-path", "-g", "**/lox/**/*" },
		},
		{
			description = "Themes (IGN)",
			keys = "<leader>lt",
			paths = { { "themes" } },
		},
	},
	laravel = {
		{
			description = "Components (LRVL-JS)",
			keys = "<leader>ljc",
			paths = { { "resources", "js", "components" } },
		},
		{
			description = "Pages (LRVL-JS)",
			keys = "<leader>ljp",
			paths = { { "resources", "js", "pages" } },
		},
		{
			description = "Layout (LRVL-JS)",
			keys = "<leader>ljl",
			paths = { { "resources", "js", "layouts" } },
		},
		{
			description = "Types (LRVL-JS)",
			keys = "<leader>ljl",
			paths = { { "resources", "js", "types" } },
		},
		{
			description = "JS (LRVL-JS)",
			keys = "<leader>ljj",
			paths = { { "resources", "js" } },
		},
		{
			description = "Controllers (LRVL)",
			keys = "<leader>lc",
			paths = { { "app", "Http", "Controllers" } },
		},
		{
			description = "Models (LRVL)",
			keys = "<leader>la",
			paths = { { "app" }, { "app", "Models" } },
			fd_opts = { "-d", "1", "-g", "*.php" },
		},
		{
			description = "Factories (LRVL)",
			keys = "<leader>lfa",
			paths = { { "database", "factories" } },
			fd_opts = { "-d", "1", "-g", "*.php" },
		},

		{
			description = "Filament Resources (LRVL)",
			keys = "<leader>lfr",
			paths = { { "app", "Filament" } },
			fd_opts = { "--full-path", "-g", "**/**/*" },
		},

		{
			description = "Filament Providers (LRVL)",
			keys = "<leader>lfp",
			paths = { { "app", "Providers", "Filament" } },
			fd_opts = { "-d", "1", "-g", "*.php" },
		},
		{
			description = "Seeders (LRVL)",
			keys = "<leader>ls",
			paths = { { "database", "seeders" } },
			fd_opts = { "-d", "1", "-g", "*.php" },
		},
		{
			description = "Traits (LRVL)",
			keys = "<leader>lt",
			paths = { { "app", "Traits" } },
			fd_opts = { "-d", "1", "-g", "*.php" },
		},
		{
			description = "App (LRVL)",
			keys = "<leader>lA",
			paths = { { "app" } },
			fd_opts = { "-g", "*.php" },
		},
		{
			description = "Migrations (LRVL)",
			keys = "<leader>lm",
			paths = { { "database", "migrations" } },
			fd_opts = { "-d", "1", "-g", "*.php" },
		},
		{
			description = "Views (LRVL)",
			keys = "<leader>lv",
			paths = { { "resources", "views" } },
		},
		{
			description = "Breads (LRVL)",
			keys = "<leader>lb",
			paths = { { "resources", "bread" } },
		},
		{
			description = "Routes (LRVL)",
			keys = "<leader>lw",
			paths = { { "routes" } },
		},
		{
			description = "Requests (LRVL)",
			keys = "<leader>lr",
			paths = { { "app", "Http", "Requests" } },
		},
	},
	ignite = {
		{
			description = "Components (IGN)",
			keys = "<leader>lc",
			paths = { { "app", "components" } },
		},
		{
			description = "Screens (IGN)",
			keys = "<leader>ls",
			paths = { { "app", "screens" } },
		},
		{
			description = "Models (IGN)",
			keys = "<leader>lm",
			paths = { { "app", "models" } },
		},
		{
			description = "API (IGN)",
			keys = "<leader>la",
			paths = { { "app", "services", "api" } },
		},
		{
			description = "DB (IGN)",
			keys = "<leader>ld",
			paths = { { "app", "services", "database" } },
		},
		{
			description = "Navigator (IGN)",
			keys = "<leader>ln",
			paths = { { "app", "navigators" } },
		},
	},
}

local function get_items(opts)
	local items = {}

	local base_dir = '--base-directory="' .. opts.cwd .. '"'
	local find_command = opts.find_command
	find_command = table.copy_except_key(find_command, "--strip-cwd-prefix")
	find_command = table.concat(find_command, " ") .. " " .. base_dir

	local handle = io.popen(find_command)
	if handle then
		for line in handle:lines() do
			table.insert(items, line)
		end
		handle:close()
	else
		print("Failed to execute fd command")
	end

	return items
end

function snackItTemp(opts)
	local Snacks = require("snacks")
	local args = opts.find_command
	args = table.copy_except_key(args, "fd")
	args = table.copy_except_key(args, "--type")
	args = table.copy_except_key(args, "f")
	args = table.copy_except_key(args, "--strip-cwd-prefix")

	Snacks.picker.pick("files", {
		dirs = { opts.cwd },
		cmd = "fd",
		args = args,
		paths = opts.search_dirs,
	})
end

function snackIt(opts)
	local Snacks = require("snacks")
	local items_list = get_items(opts)

	return Snacks.picker({
		finder = function()
			local items = {}
			for i, item in ipairs(items_list) do
				table.insert(items, {
					idx = i,
					file = item,
					text = item,
				})
			end
			return items
		end,
		layout = {
			layout = {
				box = "horizontal",
				width = 0.5,
				height = 0.5,
				{
					box = "vertical",
					border = "rounded",
					title = opts.prompt_title,
					{ win = "input", height = 1, border = "bottom" },
					{ win = "list", border = "none" },
				},
			},
		},
		format = function(item, _)
			local file = item.file
			local ret = {}
			local a = Snacks.picker.util.align
			local icon, icon_hl = Snacks.util.icon(file.ft, "directory")
			ret[#ret + 1] = { a(icon, 3), icon_hl }
			ret[#ret + 1] = { " " }
			ret[#ret + 1] = { a(file, 20) }

			return ret
		end,
		confirm = function(picker, item)
			picker:close()
			-- :lua Snacks.picker.grep()
			-- mySearchTerm -- -g=**/example-dir/**
			-- Snacks.picker.pick("files", {
			--   dirs = { item.file },
			-- })

			-- Snacks.picker.pick("files", {
			-- 	dirs = { item.file },
			-- })
		end,
	})
end

function MapProjectKeys()
	local project_type = ""
	local pwd = vim.loop.cwd()
	-- dump(pwd)

	project_type = path:new(pwd .. os_sep .. "ignite"):exists() and "ignite" or project_type
	project_type = path:new(pwd .. os_sep .. "composer.json"):exists() and "laravel" or project_type
	project_type = (
		path:new(pwd .. os_sep .. "composer.json"):exists() and path:new(pwd .. os_sep .. "plugins"):exists()
	)
			and "october"
		or project_type

	-- get the project_type specific maps
	local project_maps = PROJECTS_MAPS[project_type]

	if project_maps == nil then
		return ""
	end

	-- if APPLIED_PROJECT_MAPS == project_type then
	--   return nil
	-- else
	--   APPLIED_PROJECT_MAPS = project_type
	-- end

	local developer = "lox"
	if project_type == "october" then
		if path:new(pwd .. os_sep .. "plugins" .. os_sep .. "khalid"):exists() then
			developer = "khalid"
		end
		if path:new(pwd .. os_sep .. "plugins" .. os_sep .. "lox"):exists() then
			developer = "lox"
		end
	end

	for _, i in pairs(project_maps) do
		-- get the paths for each map entry
		local i_paths = {}
		for _, ip in pairs(i.paths) do
			local i_path = path:new(vim.loop.cwd() .. os_sep .. table.concat(ip, os_sep)):absolute()
			table.insert(i_paths, i_path)
		end

		local opts = {
			-- search_dirs = i_paths, -- moved downwards to allow --strip-cwd-prefix
			find_command = { "fd", "--type", "f" },
			-- opts["cwd"] = i_paths
		}

		-- if search paths is a single entry then strip cwd prefix unless strictly prohibbited
		if table.length(i_paths) < 2 then
			opts["cwd"] = i_paths[1]
			table.insert(opts.find_command, "--strip-cwd-prefix")
		else
			opts["search_dirs"] = i_paths
		end

		if i["description"] ~= nil then
			opts["prompt_title"] = i.description
		end

		if i["fd_opts"] ~= nil then
			for _, v in ipairs(i["fd_opts"]) do
				v = string.gsub(v, "lox", developer)
				table.insert(opts.find_command, v)
			end
		end

		-- dump(opts)

		-- map the entry
		vim.keymap.set("n", i.keys, function()
			-- dump(opts)
			-- snackIt(opts)
			-- snackItTemp(opts)
			require("telescope.builtin").find_files(table.copy(opts))
		end)
	end
end

-- MapProjectKeys()
vim.cmd([[ au DirChanged * lua MapProjectKeys() ]])
