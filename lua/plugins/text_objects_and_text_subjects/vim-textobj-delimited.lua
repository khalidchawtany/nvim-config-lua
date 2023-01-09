return {
 "machakann/vim-textobj-delimited",
  dependencies = {"kana/vim-textobj-user"},
  keys = {
    {"id", "<Plug>(textobj-delimited-forward-i)", desc = "TxetObj (Delimited-forward-i)", mode = {"v", "o"}},
    {"ad", "<Plug>(textobj-delimited-forward-a)", desc = "TxetObj (Delimited-forward-a)", mode = {"v", "o"}},
    {"iD", "<Plug>(textobj-delimited-backward-i)", desc = "TxetObj (Delimited-backward-i)", mode = {"v", "o"}},
    {"aD", "<Plug>(textobj-delimited-backward-a)", desc = "TxetObj (Delimited-backward-a)", mode = {"v", "o"}}
  },
  config = function()
    vim.g.textobj_delimited_no_default_key_mappings = true
  end
}
