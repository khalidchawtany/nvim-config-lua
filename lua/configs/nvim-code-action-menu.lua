local M = {
  cmd = {"CodeActionMenu"}
}

local mapKeys = function()
  vim.cmd [[ nnoremap <D-CR> :CodeActionMenu<cr>  ]]
end

M.init = mapKeys

M.config = mapKeys

return M
