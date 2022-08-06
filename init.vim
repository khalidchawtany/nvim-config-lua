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


let g:neo_tree_remove_legacy_commands=1

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
lua require('plugins')
" lua require("user.winbar")
lua require("user.autocommands")
lua require('packer_compiled')
lua require('maps')
" lua require('configs/lspconfig')
"lua require('_completion-nvim')
source ~/.config/nvim/lua/maps.vim

au bufnewfile,bufread *.blade.php set filetype=blade

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

highlight Whitespace guifg=#30334B

hi WinSeparator guifg=#3758A6

set laststatus=3
set cmdheight=1





if exists('g:neovide')

  source ~/.config/nvim/ginit.vim

  let g:neovide_input_use_logo=v:true
  let g:neovide_remember_window_size = v:true

  let g:neovide_cursor_trail_length=0
  let g:neovide_cursor_animation_length=0
  set guifont=FiraCode\ Nerd\ Font:h18


  "Map CMD-# to tabs
  for i in [1,2,3,4,5,6,7,8,9]
    execute "nnoremap <silent> <D-" . i . ">            :tabnext " . i . "<cr>"
    execute "vnoremap <silent> <D-" . i . ">       <c-u>:tabnext " . i . "<cr>"
    execute "tnoremap <silent> <D-" . i . "> <c-\\><c-n>:tabnext " . i . "<cr>"
  endfor

  let i = 0
  execute "nnoremap <silent> <D-" . i . ">            :tabnext 10<cr>"
  execute "vnoremap <silent> <D-" . i . ">       <c-u>:tabnext 10<cr>"
  execute "tnoremap <silent> <D-" . i . "> <c-\\><c-n>:tabnext 10<cr>"

  " au WinEnter * if(&ft=='httpResult') | execute "normal gg/^$\n{\zs" | endif
endif

