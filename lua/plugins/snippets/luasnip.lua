local M = {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets", "molleweide/LuaSnip-snippets.nvim" },
	event = "InsertEnter",
	keys = { { "<c-cr>", mode = "v" } },
	-- config = function()
	--   vim.cmd [[
	-- " press <Tab> to expand or jump in a snippet. These can also be mapped separately
	-- " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
	-- imap <silent><expr> <c-cr> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-cr>'
	-- " -1 for jumping backwards.
	-- inoremap <silent> <M-cr> <cmd>lua require'luasnip'.jump(-1)<Cr>
	--
	-- snoremap <silent> <c-cr> <cmd>lua require('luasnip').jump(1)<Cr>
	-- snoremap <silent> <M-cr> <cmd>lua require('luasnip').jump(-1)<Cr>
	--
	-- " For changing choices in choiceNodes (not strictly necessary for a basic setup).
	-- imap <silent><expr> <C-J> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-J>'
	-- smap <silent><expr> <C-J> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-J>'
	-- ]]
	-- end
}

M.config = function()
	local ls = require("luasnip") -- {{{
	ls.filetype_extend("blade", { "html", "php", "javascript" })
	ls.filetype_extend("php", { "html", "javascript" })
	ls.filetype_extend("javascript", { "html" })
	ls.filetype_extend("javascriptreact", { "html" })
	ls.filetype_extend("typescriptreact", { "html" })

	-- require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_lua").lazy_load({
		paths = {
			vim.fn.stdpath("config") .. "/luasnip_snippets/",
			vim.fn.stdpath("data") .. "/lazy/LuaSnip-snippets.nvim/",
		},
	})

	require("luasnip.loaders.from_snipmate").lazy_load({
		paths = { vim.fn.stdpath("config") .. "/snipmate_snippets/" },
	})

	require("luasnip.loaders.from_vscode").lazy_load({
		paths = {
			vim.fn.stdpath("config") .. "/vscode_snippets/",
			vim.fn.stdpath("config") .. "/lazy/friendly-snippets/",
		},
	})

	require("luasnip").config.setup({ store_selection_keys = "<c-cr>" })

	vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]) -- }}}

	-- Virtual Text{{{
	local types = require("luasnip.util.types")
	ls.config.set_config({
		history = true,                      -- keep around last snippet local to jump back
		updateevents = "TextChanged,TextChangedI", -- update changes as you type
		enable_autosnippets = true,
		ext_opts = {
				[types.choiceNode] = {
				active = { virt_text = { { "●", "GruvboxOrange" } } },
			},
			-- [types.insertNode] = {
			-- 	active = {
			-- 		virt_text = { { "●", "GruvboxBlue" } },
			-- 	},
			-- },
		},
	}) -- }}}

	-- Key Mapping --{{{

	vim.keymap.set({ "i", "s" }, "<c-s>", "<Esc>:w<cr>")
	vim.keymap.set({ "i", "s" }, "<c-u>", '<cmd>lua require("luasnip.extras.select_choice")()<cr><C-c><C-c>')

	vim.keymap.set({ "i", "s" }, "<c-cr>", function()
		if ls.expand_or_jumpable() then
			ls.expand()
		end
	end, { silent = true })
	-- vim.keymap.set({ "i", "s" }, "<C-k>", function()
	-- 	if ls.expand_or_jumpable() then
	-- 		ls.expand_or_jump()
	-- 	end
	-- end, { silent = true })
	-- vim.keymap.set({ "i", "s" }, "<C-j>", function()
	-- 	if ls.jumpable() then
	-- 		ls.jump(-1)
	-- 	end
	-- end, { silent = true })

	-- vim.keymap.set({ "i", "s" }, "<c-k>",
	-- 	function() if ls.jumpable(1) then ls.jump(1) end end,
	-- 	{ silent = true })
	-- vim.keymap.set({ "i", "s" }, "<c-j>",
	-- 	function() if ls.jumpable(-1) then ls.jump(-1) end end,
	-- 	{ silent = true })
	--
	--
	-- vim.keymap.set({ "i", "s" }, "<c-l>", function()
	-- 	if ls.choice_active() then
	-- 		ls.change_choice(1)
	-- 	else
	-- 		-- print current time
	-- 		local t = os.date("*t")
	-- 		local time = string.format("%02d:%02d:%02d", t.hour, t.min, t.sec)
	-- 		print(time)
	-- 	end
	-- end)
	-- vim.keymap.set(
	--   {"i", "s"},
	--   "<c-h>",
	--   function()
	--     if ls.choice_active() then
	--       ls.change_choice(-1)
	--     end
	--   end
	-- ) --}}}

	-- More Settings --

	-- vim.keymap.set("n", "<Leader><CR>", "<cmd>LuaSnipEdit<cr>", {silent = true, noremap = true})
	vim.cmd(
		[[autocmd BufEnter */luasnip_snippets/*.lua nnoremap <silent> <buffer> <CR> /-- End Refactoring --<CR>O<Esc>O]]
	)
end

return M
