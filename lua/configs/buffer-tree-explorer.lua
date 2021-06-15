local M = {cmd = {'Tree'}}

M.init = function()
    vim.g.buffer_tree_explorer_compress = 1
    vim.cmd [[ nnoremap <c-p>o <cmd>Tree<cr> ]]
end

return M
