return {
  "rlane/pounce.nvim",
  cmd = {"Pounce"},
  keys = {
    {"<leader>P", "<cmd>PounceRepeat<cr>", desc = "Pounce (Repeat)"},
    {"<leader>p", "<cmd>Pounce<cr>", desc = "Pounce", mode = {"n", "v", "o"}}
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
