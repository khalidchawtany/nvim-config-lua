return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<c-s>f",
			"<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<cr>",
			desc = "Telescope: file_browser",
		},
	},
	config = function()
		local fb_actions = require("telescope._extensions.file_browser.actions")
		-- You don't need to set any of these options.
		-- IMPORTANT!: this is only a showcase of how you can set default options!
		require("telescope").setup({
			extensions = {
				file_browser = {
					-- path
					-- cwd
					cwd_to_path = false,
					grouped = false,
					files = true,
					add_dirs = true,
					depth = 1,
					auto_depth = false,
					select_buffer = false,
					hidden = false,
					-- respect_gitignore
					-- browse_files
					-- browse_folders
					hide_parent_dir = false,
					collapse_dirs = false,
					quiet = false,
					dir_icon = "",
					dir_icon_hl = "Default",
					display_stat = { date = true, size = true },
					hijack_netrw = false,
					use_fd = true,
					git_status = true,
					mappings = {
						["i"] = {
							["<D-c>"] = fb_actions.create,
							["<S-CR>"] = fb_actions.create_from_prompt,
							["<D-r>"] = fb_actions.rename,
							["<D-m>"] = fb_actions.move,
							["<D-y>"] = fb_actions.copy,
							["<D-d>"] = fb_actions.remove,
							["<C-o>"] = fb_actions.open,
							["<C-g>"] = fb_actions.goto_parent_dir,
							["<C-e>"] = fb_actions.goto_home_dir,
							["<C-w>"] = fb_actions.goto_cwd,
							["<C-t>"] = fb_actions.change_cwd,
							["<C-f>"] = fb_actions.toggle_browser,
							["<C-h>"] = fb_actions.toggle_hidden,
							["<C-s>"] = fb_actions.toggle_all,
						},
						["n"] = {
							["c"] = fb_actions.create,
							["r"] = fb_actions.rename,
							["m"] = fb_actions.move,
							["y"] = fb_actions.copy,
							["d"] = fb_actions.remove,
							["o"] = fb_actions.open,
							["g"] = fb_actions.goto_parent_dir,
							["e"] = fb_actions.goto_home_dir,
							["w"] = fb_actions.goto_cwd,
							["t"] = fb_actions.change_cwd,
							["f"] = fb_actions.toggle_browser,
							["h"] = fb_actions.toggle_hidden,
							["s"] = fb_actions.toggle_all,
						},
					},
				},
			},
		})
		-- To get telescope-file-browser loaded and working with telescope,
		-- you need to call load_extension, somewhere after setup function:
		require("telescope").load_extension("file_browser")
	end,
}
