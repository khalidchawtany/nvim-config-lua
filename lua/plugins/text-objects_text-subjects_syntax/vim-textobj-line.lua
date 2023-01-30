return {
  "kana/vim-textobj-line",
  dependencies = {"kana/vim-textobj-user"},
  keys = {
    {"il", "<Plug>(textobj-line-i)", desc = "TxetObj (Line-i)", mode = {"v", "o"}},
    {"al", "<Plug>(textobj-line-a)", desc = "TxetObj (Line-a)", mode = {"v", "o"}}
  },
  config = function()
    vim.g.textobj_line_no_default_key_mappings = true
  end
}
