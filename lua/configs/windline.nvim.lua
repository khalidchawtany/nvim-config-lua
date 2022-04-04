local M = {}

M.config = function()
  -- require("windline").setup({tabline = {}})
  require("wlsample.evil_line")
  -- require("wlfloatline").setup(
  --   {
  --     skip_filetypes = {
  --       "TelescopePrompt",
  --       "NvimTree",
  --       "term",
  --       ""
  --     }
  --   }
  -- )
end

return M
