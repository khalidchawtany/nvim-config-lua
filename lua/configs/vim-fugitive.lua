local M = {}
M.init = function()

    vim.cmd [[
   autocmd BufReadPost fugitive://* set bufhidden=delete

   " autocmd BufEnter * if &ft=="fugitive" | call feedkeys("o") | endif

   autocmd BufNewFile  fugitive://* call PM_SOURCE('vim-fugitive') | let g:NewFugitiveFile=1 | call feedkeys(';<BS>')

   " set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
    nnoremap <leader>gs :call FugitiveDetect(expand('%:p')) \| :Git<cr>
    nnoremap <leader>g<leader> :call FugitiveDetect(getcwd()) \| :Gtabedit :<cr>
    nnoremap <leader>gc  :call FugitiveDetect(getcwd()) \| execute ":Git commit"<cr>
    nnoremap <leader>gp  :call FugitiveDetect(getcwd()) \| execute ":Git pull"<cr>
    nnoremap <leader>gu  :call FugitiveDetect(getcwd()) \| execute ":Git push" \| echo "Pushed :)"<cr>
    nnoremap <leader>gU  :call FugitiveDetect(getcwd()) \| execute ":Git push --force" \| echo "Pushed :)"<cr>
    nnoremap <leader>gr  :call FugitiveDetect(getcwd()) \| execute ":Gread"<cr>
    nnoremap <leader>gw  :call FugitiveDetect(getcwd()) \| execute ":Gwrite"<cr>
    nnoremap <leader>gdv :call FugitiveDetect(getcwd()) \| execute ":Gvdiff"<cr>
    nnoremap <leader>gds :call FugitiveDetect(getcwd()) \| execute ":Gdiff"<cr>

    nnoremap <leader>g<cr> :call FugitiveDetect(getcwd()) \| execute ":Gread\|Gwrite"<cr>
   " Fugitive Conflict Resolution
   " nnoremap gdh :diffget //2<CR>
   " nnoremap gdl :diffget //3<CR>
]]

end

return M
