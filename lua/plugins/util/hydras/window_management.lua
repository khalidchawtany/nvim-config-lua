local Hydra = require("hydra")

Hydra({
	name = "Change / Resize Window",
	mode = { "n" },
	body = "<C-w>",
	config = {
		-- color = "pink",
	},
	heads = {
		-- focus windows
		{ "h", "<C-w>h" },
		{ "j", "<C-w>j" },
		{ "k", "<C-w>k" },
		{ "l", "<C-w>l" },

		-- move windows
		{ "H", "<C-w>H" },
		{ "J", "<C-w>J" },
		{ "K", "<C-w>K" },
		{ "L", "<C-w>L" },

		-- resizing window
		{ "<C-h>",     "<C-w>3<" },
		{ "<C-l>",     "<C-w>3>" },
		{ "<C-k>",     "<C-w>2+" },
		{ "<C-j>",     "<C-w>2-" },


		-- only
		{ "o",     "<C-w>o" },

		 -- move to tab
		{ "t",     "<C-w>t" },

		-- equalize window sizes
		{ "e",     "<C-w>=" },

		-- close active window
		{ "Q",     ":q<cr>" },
		{ "<C-q>", ":q<cr>" },

		-- exit this Hydra
		{ "q",     nil,      { exit = true, nowait = true } },
		{ ";",     nil,      { exit = true, nowait = true } },
		{ "<Esc>", nil,      { exit = true, nowait = true } },
	},
})
