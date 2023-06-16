return {
  "junegunn/gv.vim",
  cmd = {"GV"},
  dependencies = {"tpope/vim-fugitive"},
  keys = {
    {"<leader>gl", ":GV<cr>", desc = "Git (GV)"}
  }
}
