return {
	"roobert/tailwindcss-colorizer-cmp.nvim",
	lazy = true,
	config = function()
		require("tailwindcss-colorizer-cmp").setup({
			color_square_width = 2,
		})
	end,
}
