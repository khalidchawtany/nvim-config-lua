return {
 "pechorin/any-jump.vim",
  cmd = {"AnyJump", "AnyJumpArg", "AnyJumpVisual", "AnyJumpBack", "AnyJumpLastResults"},

  keys = {
    {"<leader>aj", ":AnyJump<cr>", desc = "Anyjump"},
    {"<leader>aj", ":AnyJumpVisual<cr>", desc = "Anyjump", mode = "x"},
    {"<leader>ak", ":AnyJumpBack<cr>", desc = "Anyjump (Back)"},
    {"<leader>al", ":AnyJumpLastResults<cr>", desc = "Anyjump (Last)"},
  }
}

