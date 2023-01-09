local M = {
  "SmiteshP/nvim-gps", -- allow to get context and put in winbar to the left or virtual text
  dependencies = "nvim-treesitter/nvim-treesitter"
}

M.config = function()
  require("nvim-gps").setup()
end

return M
