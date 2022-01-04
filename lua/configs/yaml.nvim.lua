local M = {
  ft = {"yaml"}, -- optional
  requires = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim" -- optional
  }
}

M.config = function()
  require("yaml_nvim").init()
end

return M
