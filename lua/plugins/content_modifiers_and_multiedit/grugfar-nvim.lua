return {
	"MagicDuck/grug-far.nvim",
	cmd = { "GrugFar" },

	keys = {
		{
			"<leader>rf",
			function()
				require("grug-far").grug_far({ prefills = { search = vim.fn.expand("<cword>") } })
			end,
			desc = "GrugFar (CWord)",
		},
		{
			"<leader>rF",
			function()
				require("grug-far").grug_far({
					prefills = { search = vim.fn.expand("<cword>"), flags = vim.fn.expand("%") },
				})
			end,
			desc = "GrugFar (%)",
		},
		{
			"<leader>rd",
			function()
				local files = {}
				local cmd = string.format("git status -s | cut -c4-")
				local handle = io.popen(cmd)
				for line in handle:lines() do
					table.insert(files, line)
				end

				local paths = table.concat(files, "\n")

				local prefills = { paths = paths }
				-- {search=, replacement=, filesFilter=, flags=, paths=}

				local grug_far = require("grug-far")

				-- instance check
				if not grug_far.has_instance("gitfiles") then
					grug_far.open({
						instanceName = "gitfiles",
						prefills = prefills,
						staticTitle = "Find and Replace from Git Staus",
					})
				else
					grug_far.open_instance("gitfiles")
					-- updating the prefills without clearing the search and other fields
					grug_far.update_instance_prefills("gitfiles", prefills, false)
				end
			end,
			desc = "GrugFar (Git Staus)",
		},
	},

	-- require('grug-far').grug_far({ prefills = { search = vim.fn.expand("<cword>") } })
	-- require('grug-far').grug_far({ prefills = { flags = vim.fn.expand("%") } })
	config = function()
		require("grug-far").setup({
			--- options, see Configuration section below ...
			--- there are no required options atm...
		})
	end,
}
