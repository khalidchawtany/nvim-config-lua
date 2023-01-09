return {
  "rlane/pounce.nvim",
  cmd = {"Pounce"},
  keys = {
    {"<c-s>F", "<cmd>PounceRepeat<cr>", desc = "Pounce (Repeat)"},
    {"<c-s>f", "<cmd>Pounce<cr>", desc = "Pounce", mode = {"n", "v", "o"}}
  },
  config = function()
    require "pounce".setup {
      accept_keys = "JFKDLSAHGNUVRBYTMICEOXWPQZ",
      accept_best_key = "<enter>",
      multi_window = true,
      debug = false
    }
  end
}
