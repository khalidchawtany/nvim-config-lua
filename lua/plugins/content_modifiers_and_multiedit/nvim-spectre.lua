return {
	"nvim-pack/nvim-spectre",
	cmd = { "Spectre", "SpectreReplace", "SpectreOpen", "SpectreClose" },
	keys = {
		{
			"<leader>so",
			function() require("spectre").open() end,
			desc = "Spectre (Open)"
		}, {
			"<leader>sw",
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			desc = "Spectre (Open CWord)"
		}, {
			"<leader>ss",
			function() require("spectre").open_visual() end,
			mode = "v",
			desc = "Spectre (Open Visual)"
		}, {
			"<leader>s<leader>",
			function() require("spectre").open_file_search() end,
			mode = "n",
			desc = "Spectre (Current File)"
		}
	}
}
