local M = {
  branch = "v2.x",
  requires = {
    "MunifTanjim/nui.nvim",
    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim"
  },
  module = "neo-tree",
  cmd = {"Neotree"}
}

M.mapKeys = function()
  -- vim.cmd([[nnoremap \- :lua require("neo-tree").show()<cr>]])
  vim.cmd [[nnoremap \- <cmd>Neotree position=float<cr>]]
end

M.init = M.mapKeys

M.config = function()
  vim.g.neo_tree_remove_legacy_commands = 1

  require("neo-tree").setup()
  M.mapKeys()
end

return M
