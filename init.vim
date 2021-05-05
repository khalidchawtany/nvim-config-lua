
scriptencoding utf-8
set encoding=utf-8 nobomb
set termencoding=utf-8

" let mapleader = "\<space>"
" let g:mapleader = "\<space>"
" let localleader = "\\"
" let g:loaclleader = "\\"
" 
lua require('opts')
lua require('plugins')
lua require('_lsp')
lua require('_completion-nvim')
lua require('_snippets-nvim')
lua require('_nvim-autopair')
lua require('_lir')
lua require('_nvim-tree')
lua require('_telescope')
lua require('_which-key')
lua require('_lualine')
source ~/.config/nvim/lua/maps.vim

let g:indent_blankline_filetype_exclude = ['dashboard', 'help']

let g:dashboard_default_executive ='telescope'

