local M = {
    cmd={'ExpandExpr'}
}

M.init = function ()
    vim.cmd [[
    command! ExpandExpr lua require("expand_expr").expand()<cr>
    inoremap <c-;>e <cmd>ExpandExpr<cr>
    ]]
end

return M
