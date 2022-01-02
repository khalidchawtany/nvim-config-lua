local M = {
  branch = "main",
  requires = {"MunifTanjim/nui.nvim"},
  module = "neo-tree"
}

M.mapKeys = function()
  vim.cmd([[nnoremap \- :lua require("neo-tree").show()<cr>]])
end

M.init = M.mapKeys

M.config = function()
  require("neo-tree").setup()
  M.mapKeys()
end

return M
