local M = {}

M.init = function()

    vim.cmd [[
        omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
        vnoremap <silent> m :lua require('tsht').nodes()<CR>
        ]]

end

return M
