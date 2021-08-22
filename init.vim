



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
