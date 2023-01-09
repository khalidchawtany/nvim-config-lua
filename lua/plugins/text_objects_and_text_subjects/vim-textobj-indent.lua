return {
  "kana/vim-textobj-indent",
  dependencies = {"kana/vim-textobj-user"},
  keys = {
    {"ii", "<Plug>(textobj-indent-i)", desc = "TxetObj (Indent-i)", mode = {"v", "o"}},
    {"ai", "<Plug>(textobj-indent-a)", desc = "TxetObj (Indent-a)", mode = {"v", "o"}},
    {"iI", "<Plug>(textobj-indent-same-i)", desc = "TxetObj (Indent-i)", mode = {"v", "o"}},
    {"aI", "<Plug>(textobj-indent-same-a)", desc = "TxetObj (Indent-a)", mode = {"v", "o"}}
  },
  config = function()
    vim.g.textobj_indent_no_default_key_mappings = true
  end
}
