return {
  "vimtaku/vim-textobj-keyvalue",
  dependencies = {"kana/vim-textobj-user"},
  keys = {
    {"ik", "<Plug>(textobj-key-a)", desc = "TxetObj (KeyValue-i)", mode = {"v", "o"}},
    {"ak", "<Plug>(textobj-key-i)", desc = "TxetObj (KeyValue-a)", mode = {"v", "o"}},
    {"iK", "<Plug>(textobj-value-a)", desc = "TxetObj (KeyValue-i)", mode = {"v", "o"}},
    {"aK", "<Plug>(textobj-value-i)", desc = "TxetObj (KeyValue-a)", mode = {"v", "o"}}
  },
  config = function()
    vim.g.textobj_key_no_default_key_mappings = true
  end
}
