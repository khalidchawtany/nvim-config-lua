return {
  "phaazon/hop.nvim",
  name = "hop",
  branch = "v2", -- optional
  cmd = {
    "HopWord",
    "HopLine",
    "HopWordCurrentLine"
  },
  keys = {
    {"<c-s>w", "<cmd>HopWord<cr>", desc = "Hop (Word)"},
    {"<c-s>j", "<cmd>HopLine<cr>", desc = "Hop (Line)"},
    {"<c-s>k", "<cmd>HopLine<cr>", desc = "Hop (Line)"},
    {"<c-s><leader>", "<cmd>HopWordCurrentLine<cr>", desc = "Hop (CurrentLine)"}
  },
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require "hop".setup {keys = "etovxqpdygfblzhckisuran"}
  end
}
