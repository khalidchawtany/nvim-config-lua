if empty($TMUX)
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif



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


lua <<EOF
 local async
 async = vim.loop.new_async(
    vim.schedule_wrap(
        function()
            require('plugins')

            async:close()
        end
    )
)
async:send()
EOF
lua require('configs/lspconfig')
"lua require('_completion-nvim')
source ~/.config/nvim/lua/maps.vim

let g:indent_blankline_filetype_exclude = ['dashboard', 'help']

let g:dashboard_default_executive ='telescope'

set virtualedit=all


autocmd User fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif
