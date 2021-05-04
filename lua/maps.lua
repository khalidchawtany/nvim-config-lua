-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.cmd([[
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <silent> <c-space> <Plug>(completion_trigger)
imap <silent> <c-j> <c-n>
imap <silent> <c-k> <c-p>
]])
