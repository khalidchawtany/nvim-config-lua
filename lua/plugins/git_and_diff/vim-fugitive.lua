return {
	"tpope/vim-fugitive",
	event = "BufReadPost fugitive://*",

	keys = {
		{ "<leader>gs",        '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Git"<cr>', desc = "Git" },
		{ "<leader>gc",        '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Git commit"<cr>', desc = "Git commit" },
		{ "<leader>gp",        '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Git pull"<cr>', desc = "Git pull" },
		{ "<leader>gu",        '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Git push | echo \'Pushed :)\'"<cr>', desc = "Git push" },
		{ "<leader>gU",        '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Git push --force | echo \'Pushed :)\'"<cr>', desc = "Git push force" },
		{ "<leader>gr",        '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Gread"<cr>', desc = "Git read" },
		{ "<leader>gw",        '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Gwrite"<cr>', desc = "Git write" },
		{ "<leader>gdv",       '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Gvdiff"<cr>', desc = "Git diff-V" },
		{ "<leader>gds",       '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Gdiff"<cr>', desc = "Git diff-S" },
		{ "<leader>g<leader>", '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Gtabedit"<cr>', desc = "Git tab" },
		{ "<leader>g<bs>",     '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Gread | Gwrite"<cr>', desc = "Git Read|Write" },
	},
	init = function()
		vim.cmd [[ autocmd BufReadPost fugitive://* set bufhidden=delete ]]
   -- Fugitive Conflict Resolution
   -- nnoremap gdh :diffget //2<CR>
   -- nnoremap gdl :diffget //3<CR>
	end
}
