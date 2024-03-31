return {
	"Bekaboo/dropbar.nvim",
	event = "VeryLazy",
  enabled = false,

	dependencies = {
		"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
	},
	keys = {
		{
			"s<cr>",
			function()
				require("dropbar.api").pick()
			end,
			desc = "Dropbar pick",
		},
	},
	opts = {
		menu = {
			keymaps = {
				["<LeftMouse>"] = function()
					local api = require("dropbar.api")
					local menu = api.get_current_dropbar_menu()
					if not menu then
						return
					end
					local mouse = vim.fn.getmousepos()
					if mouse.winid ~= menu.win then
						local prev_menu = api.get_dropbar_menu(mouse.winid)
						if prev_menu and prev_menu.sub_menu then
							prev_menu.sub_menu:close()
						end
						if vim.api.nvim_win_is_valid(mouse.winid) then
							vim.api.nvim_set_current_win(mouse.winid)
						end
						return
					end
					menu:click_at({ mouse.line, mouse.column - 1 }, nil, 1, "l")
				end,
				["<CR>"] = function()
					local menu = require("dropbar.api").get_current_dropbar_menu()
					if not menu then
						return
					end
					local cursor = vim.api.nvim_win_get_cursor(menu.win)
					local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
					if component then
						menu:click_on(component, nil, 1, "l")
					end
				end,
				["q"] = function()
					local menu = require("dropbar.api").get_current_dropbar_menu()
					if not menu then
						return
					end
					menu:close()
				end,
			},
		},
	},
}
