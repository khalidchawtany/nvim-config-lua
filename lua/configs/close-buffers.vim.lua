local M = {cmd = {'Bdelete'}}

M.init = function()
    vim.cmd [[
     nnoremap <c-;>wh <cmd>Bdelete hidden<cr>
     nnoremap <c-;><c-w><c-h> <cmd>Bdelete hidden<cr>
    ]]
end

return M
