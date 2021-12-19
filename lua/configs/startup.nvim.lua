local M = {
  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  config = function()
    require("startup").setup({theme = "dashboard"})
  end
}
return M
