local M = {
  "phaazon/mind.nvim",
  branch = "v2.2",
  requires = {"nvim-lua/plenary.nvim"},
  lazy = true
}

M.config = function()
  require "mind".setup()
end

return M
