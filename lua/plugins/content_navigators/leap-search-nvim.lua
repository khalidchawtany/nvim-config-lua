return {
	"atusy/leap-search.nvim",
	dependencies = { "ggandor/leap.nvim" },
	keys = {
		{
			"<leader>n",
			function()
				local pat = vim.fn.getreg("/")
				local leapable = require("leap-search").leap(pat)
				if not leapable then
					return vim.fn.search(pat)
				end
			end,
			desc = "Leap next match",
		},
		{
			"<leader>N",
			function()
				local pat = vim.fn.getreg("/")
				local leapable = require("leap-search").leap(pat, {}, { backward = true })
				if not leapable then
					return vim.fn.search(pat, "b")
				end
			end,
			desc = "Leap prev match",
		},
		{
			"<leader>/",
			function()
				require("leap-search").leap(nil, {
					engines = {
						{ name = "string.find", plain = true, ignorecase = true },
						-- { name = "kensaku.query" }, -- to search Japanese string with romaji with https://github.com/lambdalisue/kensaku.vim
					},
				}, { target_windows = { vim.api.nvim_get_current_win() } })
			end,
			desc = "Search with leap",
		},
		{
			"<leader>?",
			function()
				require("leap-search").leap(vim.fn.getreg("/"))
			end,
			desc = "Search with leap",
		},
	},
}

-- Leap with last search pattern
-- require("leap-search").leap(vim.fn.getreg("/"))
