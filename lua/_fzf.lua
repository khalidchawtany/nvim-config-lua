vim.cmd [[

 nnoremap <silent> <c-p>p :silent! call fzf#vim#files(getcwd(), {'options': '--reverse -q '.shellescape(expand('<cword>'))}, 1)<cr>

]]
