
map ¡ <M-1>
map ™ <M-2>
map £ <M-3>
map ¢ <M-4>
map ∞ <M-5>
map § <M-6>
map ¶ <M-7>
map • <M-8>
map ª <M-9>

map ∆ <M-j>
map ˚ <M-k>
map ¬ <M-l>
map ˙ <M-h>

map – <M-->
map ≠ <M-+>

map ‘ <M-]>
map “ <M-[>



scriptencoding utf-8
set encoding=utf-8 nobomb
set termencoding=utf-8

" let mapleader = "\<space>"
" let g:mapleader = "\<space>"
" let localleader = "\\"
" let g:loaclleader = "\\"
" 
lua require('opts')
source ~/.config/nvim/func.vim
lua require('plugins')
lua require('_lsp')
"lua require('_completion-nvim')
source ~/.config/nvim/lua/maps.vim

let g:indent_blankline_filetype_exclude = ['dashboard', 'help']

let g:dashboard_default_executive ='telescope'


autocmd User fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif
