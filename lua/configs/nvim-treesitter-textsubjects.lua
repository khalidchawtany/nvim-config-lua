local M = {}

M.setup = function()
  require "nvim-treesitter.configs".setup {
    textsubjects = {
      enable = true,
      keymaps = {
        ["."] = "textsubjects-smart",
        [","] = "textsubjects-container-outer"
      }
    }
  }
end

return M

