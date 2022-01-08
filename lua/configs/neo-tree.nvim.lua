local M = {
  branch = "v1.x",
  requires = {"MunifTanjim/nui.nvim"},
  module = "neo-tree",
  cmd = {"NeoTreeReveal", "NeoTreeFocus", "NeoTreeFloat", "NeoTreeShow"}
}

M.mapKeys = function()
  -- vim.cmd([[nnoremap \- :lua require("neo-tree").show()<cr>]])
  vim.cmd([[nnoremap \- <cmd>NeoTreeFloat<cr>]])
end

M.init = M.mapKeys

M.config = function()
  require("neo-tree").setup()
  M.mapKeys()
end

return M
