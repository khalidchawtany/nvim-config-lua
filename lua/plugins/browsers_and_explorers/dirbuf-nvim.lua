return {
	"elihunter173/dirbuf.nvim",
	cmd = { "Dirbuf" },
	keys = {
		{ "<leader>_", "<cmd>Dirbuf<cr>", desc = "Dirbuf" },
		{ "-d",        "<cmd>Dirbuf<cr>", desc = "Dirbuf" }
	},
	config = function()
		require("dirbuf").setup { hash_padding = 2, show_hidden = true }
	end
}
