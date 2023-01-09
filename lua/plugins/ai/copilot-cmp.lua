local M = {
  "zbirenbaum/copilot-cmp",
  lazy = true,
  -- cmd = {"Copilot"},
  dependencies = {
    "copilot.lua"
    -- "copilot.vim",
    -- "nvim-cmp"
  },
  config = function()
    require("copilot_cmp").setup(
      {
        method = "getCompletionsCycling",
        formatters = {
          label = require("copilot_cmp.format").format_label_text,
          insert_text = require("copilot_cmp.format").format_insert_text,
          preview = require("copilot_cmp.format").deindent
        }
      }
    )
  end
}

return M
