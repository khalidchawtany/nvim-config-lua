-- main.lua
local snacks = require("snacks")
local _actions = require("telescope._extensions.project.actions")
local _utils = require("telescope._extensions.project.utils")

local M = {}

local mappings = {
	n = {
		["d"] = _actions.delete_project,
		["r"] = _actions.rename_project,
		["c"] = _actions.add_project,
		["C"] = _actions.add_project_cwd,
		["f"] = _actions.find_project_files,
		["b"] = _actions.browse_project_files,
		["s"] = _actions.search_in_project_files,
		["R"] = _actions.recent_project_files,
		["w"] = _actions.change_working_directory,
		["o"] = _actions.next_cd_scope,
	},
	i = {
		["<c-d>"] = _actions.delete_project,
		["<c-v>"] = _actions.rename_project,
		["<c-a>"] = _actions.add_project,
		["<c-A>"] = _actions.add_project_cwd,
		["<c-f>"] = _actions.find_project_files,
		["<c-b>"] = _actions.browse_project_files,
		["<c-s>"] = _actions.search_in_project_files,
		["<c-r>"] = _actions.recent_project_files,
		["<c-l>"] = _actions.change_working_directory,
		["<c-o>"] = _actions.next_cd_scope,
		["<c-w>"] = _actions.change_workspace,
	},
}

M.setup = function(setup_config)
	-- Existing setup logic remains similar
	-- ...
end

M.project = function(opts)
	local projects = _utils.get_projects(opts.order_by)

	snacks.picker
		.pick({
			finder = function()
				local items = {}
				for i, item in ipairs(projects) do
					table.insert(items, {
						idx = i,
						file = item.path,
						text = item.title,
					})
				end
				return items
			end,
			-- prompt = "Select a project",
			--
			win = {

				input = {
					keys = {
						["<c-i>"] = { "delete_project", mode = { "n", "i" } },
						["<c-r>"] = { "rename_project", mode = { "n", "i" } },
					},
				},
				list = {
					keys = {},
				},
			},

			actions = {
				rename_project = function(picker, item)
					local selected_path = item.file
					local selected_title = item.text
					local new_title = vim.fn.input("Rename " .. selected_title .. " to: ", selected_title)

					local file = io.open(_utils.telescope_projects_file, "w")
					for _, project in pairs(projects) do
						if project.path == selected_path then
							project.title = new_title
						end
						_utils.store_project(file, project)
					end
					item.text = new_title
					projects = _utils.get_project_objects()
					picker.list.win:redraw()

					io.close(file)
				end,
				delete_project = function(picker, item) end,
			},

			-- format = function(item, _)
			-- 	local file = item.file
			-- 	local ret = {}
			-- 	local a = snacks.picker.util.align
			-- 	local icon, icon_hl = snacks.util.icon(file.ft, "directory")
			-- 	ret[#ret + 1] = { a(icon, 3), icon_hl }
			-- 	ret[#ret + 1] = { " " }
			-- 	ret[#ret + 1] = { a(file, 20) }
			--
			-- 	return ret
			-- end,

			confirm = function(picker, item)
				picker:close()
				-- :lua snacks.picker.grep()
				-- mySearchTerm -- -g=**/example-dir/**
				-- snacks.picker.pick("files", {
				--   dirs = { item.file },
				-- })

				snacks.picker.pick("files", {
					dirs = { item.file },
				})
			end,

			layout = {
				layout = {
					box = "horizontal",
					width = 0.5,
					height = 0.5,
					{
						box = "vertical",
						border = "none",
						title = opts.prompt_title,
						{ win = "input", height = 1, border = "none" },
						{ win = "list", border = "none" },
					},
				},
			},
		})
		:find()
end

-- M.project({})

return M
