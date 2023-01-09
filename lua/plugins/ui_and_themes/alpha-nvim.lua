local M = {
 "goolord/alpha-nvim",
  dependencies = {"kyazdani42/nvim-web-devicons"},
  lazy = false
}

M.config = function()
  -- require "alpha".setup(require "alpha.themes.startify".opts)
  require "alpha".setup(require "alpha.themes.dashboard".opts)
end

return M
