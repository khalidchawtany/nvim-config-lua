return {
	"Norlock/nvim-traveller-buffers",
	dependencies = {
		"ThePrimeagen/harpoon",
		"nvim-telescope/telescope.nvim",
	},

	keys = {
		{
			"<c-s>o",
			function()
				require("nvim-traveller-buffers").buffers()
			end,
			desc = "Telescope (Project Buffers)"
		},
	},

	config = function()
		local traveller_buffers = require("nvim-traveller-buffers")

		traveller_buffers.setup({
			mappings = {
				next_tab = "<Tab>",
				previous_tab = "<S-Tab>",
				harpoon_buffer = "<C-h>",
				delete_buffer = "<C-d>",
				preview_scrolling_up = "<C-b>",
				preview_scrolling_down = "<C-f>",
				delete_all = "<C-z>",
			},
		})
	end,
}
