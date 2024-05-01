return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{
			"<leader>hh",
			":lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>",
			desc = "Harpoon (Toggle)",
		},
		{
			"<leader>ha",
			":lua require('harpoon'):list():add()<cr>",
			desc = "Harpoon (Add)",
		},
		{
			"<leader>h1",
			":lua require('harpoon'):list():select(1)<cr>",
			desc = "Harpoon (1)",
		},
		{
			"<leader>h2",
			":lua require('harpoon'):list():select(2)<cr>",
			desc = "Harpoon (2)",
		},
		{
			"<leader>h3",
			":lua require('harpoon'):list():select(3)<cr>",
			desc = "Harpoon (3)",
		},
		{
			"<leader>h4",
			":lua require('harpoon'):list():select(4)<cr>",
			desc = "Harpoon (4)",
		},
		{
			"<leader>h5",
			":lua require('harpoon'):list():select(5)<cr>",
			desc = "Harpoon (5)",
		},
		{
			"<leader>h6",
			":lua require('harpoon'):list():select(6)<cr>",
			desc = "Harpoon (6)",
		},
		{
			"<leader>h7",
			":lua require('harpoon'):list():select(7)<cr>",
			desc = "Harpoon (7)",
		},
		{
			"<leader>h8",
			":lua require('harpoon'):list():select(8)<cr>",
			desc = "Harpoon (8)",
		},
		{
			"<leader>h9",
			":lua require('harpoon'):list():select(9)<cr>",
			desc = "Harpoon (9)",
		},
		{
			"<leader>h0",
			":lua require('harpoon'):list():select(10)<cr>",
			desc = "Harpoon (10)",
		},
		{
			"<leader>hj",
			"lua require('harpoon'):list():next()<cr>",
			desc = "Harpoon (Next)",
		},
		{
			"<leader>hk",
			"lua require('harpoon'):list():prev()<cr>",
			desc = "Harpoon (Prev)",
		},
		{
			"<c-space><c-space>",
			":Telescope harpoon marks<cr>",
			desc = "Harpoon (Telescope)",
		},
	},
	config = function()
		local harpoon = require("harpoon")
 local extensions = require("harpoon.extensions");

		harpoon:setup({
			-- Setting up custom behavior for a list named "cmd"
			cmd = {

				-- When you call list:append() this function is called and the return
				-- value will be put in the list at the end.
				--
				-- which means same behavior for prepend except where in the list the
				-- return value is added
				--
				-- @param possible_value string only passed in when you alter the ui manual
				add = function(possible_value)
					-- get the current line idx
					local idx = vim.fn.line(".")

					-- read the current line
					local cmd = vim.api.nvim_buf_get_lines(0, idx - 1, idx, false)[1]
					if cmd == nil then
						return nil
					end

					return {
						value = cmd,
						-- context = { ... any data you want ... },
					}
				end,

				--- This function gets invoked with the options being passed in from
				--- list:select(index, <...options...>)
				--- @param list_item {value: any, context: any}
				--- @param list { ... }
				--- @param option any
				select = function(list_item, list, option)
					-- WOAH, IS THIS HTMX LEVEL XSS ATTACK??
					vim.cmd(list_item.value)
				end,
			},
		})
		harpoon:extend({
			UI_CREATE = function(cx)
				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-s>", function()
					harpoon.ui:select_menu_item({ split = true })
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-t>", function()
					harpoon.ui:select_menu_item({ tabedit = true })
				end, { buffer = cx.bufnr })
			end,
		})

        -- harpoon:extend(extensions.builtins.command_on_nav('echo "Hello" '));
        harpoon:extend(extensions.builtins.navigate_with_number());

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end
		vim.keymap.set("n", "<C-space><C-space>", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
	end,
}
