" set stc=%C%s%=%{v:redraw_wrap?'':v:redraw_lnum}⎥\ \
" set stc=%{&nu?v:redraw_lnum:''}%=%{&rnu?'\ '.v:redraw_relnum:''}│
" let &stc='%{v:redraw_wrap?"":v:redraw_lnum}%=⎥  '
" set statuscolumn=%@SignCb@%s%C%=%T%@NumCb@%r⎥%T\ \
" set stc=%C%s%=%{v:redraw_wrap?'':v:redraw_lnum}⎥\ \
" set stc="\ %=%{v:wrap?'':v:relnum}\ ⎥%s%C\ \ \ "
let &stc="\ %=%{v:wrap?'X':v:relnum}\ ⎥%s%C\ \ \ "
set foldcolumn="yes:1"
set signcolumn="yes:1"
set virtualedit=all

set background=dark

scriptencoding utf-8
set encoding=utf-8 nobomb
set termencoding=utf-8

lua require('impatient')
lua require('opts')
source ~/.config/nvim/func.vim
lua require('packerPlugins')
lua require("user.winbar")
lua require("user.autocommands")
lua require('packer_compiled')
lua require('maps')
" lua require('configs/lspconfig')
"lua require('_completion-nvim')
source ~/.config/nvim/lua/maps.vim

au bufnewfile,bufread *.blade.php set filetype=blade

let g:indent_blankline_filetype_exclude = ['alpha', 'help']

let g:dashboard_default_executive ='telescope'



" au BufNew * if stridx(bufname(), 'term://') >=0 | set ft=term  | endif

" highlight text after 100 characters
highlight! WarnColor ctermbg=darkblue guibg=#E1340F guifg=#111111
let w:my_colorcol_hi_id = matchadd('WarnColor', '\%101v', 100)

highlight Whitespace guifg=#30334B

hi WinSeparator guifg=#3758A6


" config for differnt guis
for gui in ['nvui', 'goneovim', 'neovide']
  if exists('g:' . gui)
    execute "source ~/.config/nvim/guis/" . gui . ".vim"
  endif
endfor

