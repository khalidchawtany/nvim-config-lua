return {
    "MagicDuck/grug-far.nvim",
    cmd = { "GrugFar" },

	-- keys = {
	-- 	{
	-- 		"<leader>so",
	-- 		function() require("spectre").open() end,
	-- 		desc = "Spectre (Open)"
	-- 	}, {
	-- 		"<leader>sw",
	-- 		function()
	-- 			require("spectre").open_visual({ select_word = true })
	-- 		end,
	-- 		desc = "Spectre (Open CWord)"
	-- 	}, {
	-- 		"<leader>ss",
	-- 		function() require("spectre").open_visual() end,
	-- 		mode = "v",
	-- 		desc = "Spectre (Open Visual)"
	-- 	}, {
	-- 		"<leader>s<leader>",
	-- 		function() require("spectre").open_file_search() end,
	-- 		mode = "n",
	-- 		desc = "Spectre (Current File)"
	-- 	}
	-- }


-- require('grug-far').grug_far({ prefills = { search = vim.fn.expand("<cword>") } })
-- require('grug-far').grug_far({ prefills = { flags = vim.fn.expand("%") } })
     config = function()
      require('grug-far').setup({
        --- options, see Configuration section below ...
        --- there are no required options atm...
      });
    end
}
