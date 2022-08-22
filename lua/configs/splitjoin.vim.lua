local M = {
  cmd = {"SplitjoinSplit", "SplitjoinJoin"}
}

M.init = function()
  vim.g.splitjoin_php_method_chain_full = 1
  vim.cmd [[
        nnoremap <leader>gS :let g:splitjoin_php_method_chain_full = !g:splitjoin_php_method_chain_full<cr>
        nnoremap gS :call Preserve('SplitjoinSplit')<cr>
        nnoremap gJ :call Preserve('SplitjoinJoin')<cr>
    ]]
end

return M
