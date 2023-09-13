return {
	"piersolenski/telescope-import.nvim",
	requires = "nvim-telescope/telescope.nvim",
	ft = { "lua", "javascript", "python", "typescript" },
	config = function()
		require("telescope").load_extension("import")
		require("telescope").setup({
			extensions = {
				import = {
					-- Add imports to the top of the file keeping the cursor in place
					insert_at_top = true,
				},
			},
		})
	end,
}
