local M = {}

M.config = function()
  -- require("windline").setup({tabline = {}})
  require("wlsample.evil_line")
  require("wlfloatline").setup(
    {
      interval = 300,
      ui = {
        active_char = "?",
        active_color = "blue",
        active_hl = nil
      },
      skip_filetypes = {
        "NvimTree",
        "lir"
      }
    }
  )
end

return M
