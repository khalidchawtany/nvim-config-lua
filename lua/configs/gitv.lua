local M = {cmd = {'Gitv'}}

M.init = function()
    vim.cmd [[nnoremap <leader>gv :Gitv<cr>]]
end

return M
