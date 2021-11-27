local M = {
  requires = {"kyazdani42/nvim-web-devicons"}
}

M.config = function()
  -- require "alpha".setup(require "alpha.themes.startify".opts)
  require "alpha".setup(require "alpha.themes.dashboard".opts)
end

return M
