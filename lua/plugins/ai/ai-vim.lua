return {
  "aduros/ai.vim",
  cmd = {"AI"},
  keys = {
    {"<D-a>", ":AI ", desc = "Ai", mode = {"n", "v"}},
    {"<D-a>", "<Esc>:AI<CR>a", desc = "Ai", mode = {"i"}}
  }
}
