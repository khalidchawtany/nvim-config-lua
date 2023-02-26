return {
	-- lazy
	"ccaglak/namespace.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>na", "<cmd>GetAllClasses<CR>", desc= "PHP - Import all classes" },
		{ "<leader>no", "<cmd>GetClass<CR>", desc  = "PHP - Impirt Class" },
		{ "<leader>ns", "<cmd>SortClass<CR>",desc = "PHP - sort imports" },
	},
}
