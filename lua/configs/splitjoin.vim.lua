local M = {
    cmd={'SplitjoinSplit', 'SplitjoinJoin'}
}

M.init = function ()
    vim.cmd[[
        nnoremap gS :call Preserve('SplitjoinSplit')<cr>
        nnoremap gJ :call Preserve('SplitjoinJoin')<cr>
    ]]
end

return M
