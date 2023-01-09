return {
  "junegunn/vim-easy-align",
  cmd = {"EasyAlign"},
  keys = {
    {"<Enter>", ":EasyAlign<cr>", desc = "Align", mode = {"v"}},
    {"g<Enter>", ":EasyAlign */[(,)]\\+/<left><left><left><left>", desc = "Align", mode = {"v"}},
    {"g<cr>", "<Plug>(EasyAlign)", desc = "Align"}
  },
  config = function()
    vim.g.easy_align_ignore_comment = 0 -- align comments
  end
}
