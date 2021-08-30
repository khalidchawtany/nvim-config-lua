local M = {}

M.init = function()
  vim.cmd [[ autocmd VimEnter * call after_object#enable([']', '['], '=', ':', '-', '#', ' ', '>', '<') ]]
end

return M
