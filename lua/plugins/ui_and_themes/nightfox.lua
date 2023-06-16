return {
	"EdenEast/nightfox.nvim",
	lazy = true,
	setup = function()
		require("nightfox").setup({
			options = {
				styles = {
					comments = "italic",
					keywords = "bold",
					types = "italic,bold",
				},
			},
		})
	end,
}
