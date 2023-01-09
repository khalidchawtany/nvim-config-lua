return {
  "kana/vim-textobj-entire",
  dependencies = {"kana/vim-textobj-user"},
  keys = {
    {"iG", "<Plug>(textobj-entire-i)", desc = "TxetObj (Entire-i)", mode = {"v", "o"}},
    {"aG", "<Plug>(textobj-entire-a)", desc = "TxetObj (Entire-a)", mode = {"v", "o"}}
  },
  config = function()
    vim.g.textobj_entire_no_default_key_mappings = true
  end
}
