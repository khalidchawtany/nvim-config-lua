local M = {
  module = "alpha",
  requires = {"kyazdani42/nvim-web-devicons"}
}

M.config = function()
  require "alpha".setup(require "alpha.themes.startify".opts)
end

return M
