local M = {
  requires = "nvim-treesitter/nvim-treesitter"
}

M.config = function()
  require("nvim-gps").setup()
end

return M
