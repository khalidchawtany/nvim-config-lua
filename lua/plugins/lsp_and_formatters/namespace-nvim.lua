return {
	"ccaglak/namespace.nvim",
	ft = { "php" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = "php",
			callback = function()
				vim.keymap.set(
					"n",
					"<leader>na",
					"<cmd>GetAllClasses<CR>",
					{ silent = true, buffer = true, desc = "PHP - Import all" }
				)
				vim.keymap.set(
					"n",
					"<leader>no",
					"<cmd>GetClass<CR>",
					{ silent = true, buffer = true, desc = "PHP - Import" }
				)
				vim.keymap.set(
					"n",
					"<leader>ns",
					"<cmd>SortClass<CR>",
					{ silent = true, buffer = true, desc = "PHP - Sort imports" }
				)
			end,
		})
	end,
	-- keys = {
	-- 	{ "<leader>na", "<cmd>GetAllClasses<CR>", desc= "PHP - Import all classes", { buffer=true } },
	-- 	{ "<leader>no", "<cmd>GetClass<CR>", desc  = "PHP - Impirt Class" , { buffer=true } },
	-- 	{ "<leader>ns", "<cmd>SortClass<CR>",desc = "PHP - sort imports" , { buffer=true } },
	-- },
}
