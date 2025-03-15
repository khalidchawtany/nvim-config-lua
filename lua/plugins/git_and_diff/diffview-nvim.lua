--[[
    :DiffviewOpen
    :DiffviewOpen HEAD~2
    :DiffviewOpen HEAD~4..HEAD~2
    :DiffviewOpen d4a7b0d
    :DiffviewOpen d4a7b0d..519b30e

    **** You can also provide additional paths to narrow down what files are shown:
    :DiffviewOpen HEAD~2 -- lua/diffview plugin

    :DiffviewClose: Close the current diffview. You can also use :tabclose.
    :DiffviewToggleFiles: Toggle the files panel.
    :DiffviewFocusFiles: Bring focus to the files panel.
    :DiffviewRefresh: Update stats and entries in the file list of the current Diffview.

    **** Hide untracked files:
    DiffviewOpen -uno
    **** Exclude certain paths:
    DiffviewOpen -- :!exclude/this :!and/this
    **** Run as if git was started in a specific directory:
    DiffviewOpen -C/foo/bar/baz
    **** Diff the index against a git rev:
    DiffviewOpen HEAD~2 --cached
    **** Defaults to HEAD if no rev is given.

--]]
--
--
--
return {
	"sindrets/diffview.nvim",
	cmd = {
		"DiffviewOpen",
		"DiffviewToggleFiles",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
	},

	keys = {
		{ "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "DiffviewOpen" },
		{ "<leader>gdd", "<cmd>DiffviewOpen HEAD<cr>", desc = "DiffviewOpen HEAD" },
		{ "<leader>gd1", "<cmd>DiffviewOpen HEAD~1<cr>", desc = "DiffviewOpen HEAD~1" },
	},

	config = function()
		local cb = require("diffview.config").diffview_callback
		require("diffview").setup({
			diff_binaries = false, -- Show diffs for binaries
			file_panel = {
				width = 35,
				use_icons = true, -- Requires nvim-web-devicons
			},
			key_bindings = {
				disable_defaults = false, -- Disable the default key bindings
				-- The `view` bindings are active in the diff buffers, only when the current
				-- tabpage is a Diffview.
				view = {
					["<tab>"] = cb("select_next_entry"), -- Open the diff for the next file
					["<s-tab>"] = cb("select_prev_entry"), -- Open the diff for the previous file
					["<leader>e"] = cb("focus_files"), -- Bring focus to the files panel
					["<leader>b"] = cb("toggle_files"), -- Toggle the files panel.
				},
				file_panel = {
					["j"] = cb("next_entry"), -- Bring the cursor to the next file entry
					["<down>"] = cb("next_entry"),
					["k"] = cb("prev_entry"), -- Bring the cursor to the previous file entry.
					["<up>"] = cb("prev_entry"),
					["<cr>"] = cb("select_entry"), -- Open the diff for the selected entry.
					["o"] = cb("select_entry"),
					["<2-LeftMouse>"] = cb("select_entry"),
					["-"] = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
					["S"] = cb("stage_all"), -- Stage all entries.
					["U"] = cb("unstage_all"), -- Unstage all entries.
					["R"] = cb("refresh_files"), -- Update stats and entries in the file list.
					["<tab>"] = cb("select_next_entry"),
					["<s-tab>"] = cb("select_prev_entry"),
					["<leader>e"] = cb("focus_files"),
					["<leader>b"] = cb("toggle_files"),
				},
			},
		})
	end,
}
