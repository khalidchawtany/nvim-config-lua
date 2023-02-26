return {
	"bennypowers/splitjoin.nvim",
	lazy = true,
	keys = {
		{
			"g<leader>S",
			function()
				require("splitjoin").join()
			end,
			desc = "Join the object under cursor",
		},
		{
			"g<leader>J,",
			function()
				require("splitjoin").split()
			end,
			desc = "Split the object under cursor",
		},
	},
}
