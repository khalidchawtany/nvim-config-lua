if empty($TMUX)
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

" let $NNN_FIFO="/tmp/nnn.fifo"

" let $NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'


let g:did_load_filetypes = 1


scriptencoding utf-8
set encoding=utf-8 nobomb
set termencoding=utf-8

" let mapleader = "\<space>"
" let g:mapleader = "\<space>"
" let localleader = "\\"
" let g:loaclleader = "\\"
"
lua require('impatient')
lua require('opts')
source ~/.config/nvim/func.vim
source ~/.config/nvim/lua/laravel.vim
lua require('plugins')
lua require('packer_compiled')
" lua require('configs/lspconfig')
"lua require('_completion-nvim')
source ~/.config/nvim/lua/maps.vim

let g:indent_blankline_filetype_exclude = ['alpha', 'help']

let g:dashboard_default_executive ='telescope'

set virtualedit=all


autocmd User fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif


" au BufNew * if stridx(bufname(), 'term://') >=0 | set ft=term  | endif

" highlight text after 100 characters
highlight! WarnColor ctermbg=darkblue guibg=#E1340F guifg=#111111
let w:my_colorcol_hi_id = matchadd('WarnColor', '\%101v', 100)



" au WinEnter * if(&ft=='httpResult') | execute "normal gg/^$\n{\zs" | endif
