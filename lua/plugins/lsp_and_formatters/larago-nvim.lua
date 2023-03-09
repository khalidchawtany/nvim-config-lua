-- lazy.nvim
return {
	"ccaglak/larago.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = {
		"Larago",
	},
	keys = {
		{ "<leader>lg", "<cmd>Larago<cr>" },
	},
}
