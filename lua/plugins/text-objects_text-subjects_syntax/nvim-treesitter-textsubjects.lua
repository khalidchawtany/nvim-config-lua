return {
	"RRethy/nvim-treesitter-textsubjects",
	dependencies = "nvim-treesitter/nvim-treesitter",
	enabled = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			textsubjects = {
				enable = true,
				prev_selection = "g;;",
				keymaps = {
					["."] = "textsubjects-smart",
					[","] = "textsubjects-container-outer",
					-- [".,"] = { 'textsubjects-container-inner', desc = "Select inside containers (classes, functions, etc.)" },
				},
			},
		})
		vim.api.nvim_set_keymap("v", ";", ":", { noremap = true, silent = true })
	end,
}
