local M = {cmd = {'GV'}}

M.init = function()
    vim.cmd [[ nnoremap  <leader>gl :GV<cr>]]
end

return M
