local M = {
  module = "ts-unit"
}

local mapKeys = function()
  vim.cmd [[
  nnoremap viu :lua require"ts-unit".select()<cr>
  nnoremap ciu :lua require"ts-unit".change()<cr>
  nnoremap diu :lua require"ts-unit".delete()<cr>
  nnoremap yiu :lua require"ts-unit".yank()<cr>
  ]]
end

M.init = mapKeys

M.config = function()
  require "ts-unit".setup {keymaps = false}
  mapKeys()
end

return M
