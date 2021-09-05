local M = {module = "headwind"}

M.init = function()
  vim.cmd [[
    nnoremap <c-k><c-s> :lua require("headwind").buf_sort_tailwind_classes()<CR>
    ]]
end

M.config = function()
  require "headwind".setup {}
end

return M
