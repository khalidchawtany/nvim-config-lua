return {
 "ripxorip/aerojump.nvim",
  build = ":UpdateRemotePlugins",
  keys = {
    {"<leader>as", "<Plug>(AerojumpSpace)", desc = "Aeorojump (Space)"},
    {"<leader>ab", "<Plug>(AerojumpBolt)", desc = "Aeorojump (Bolt)"},
    {"<leader>aa", "<Plug>(AerojumpFromCursorBolt)", desc = "Aeorojump (Cursor Bolt)"},
    {"<leader>ad", "<Plug>(AerojumpDefault)", desc = "Aeorojump"}
  }
}
