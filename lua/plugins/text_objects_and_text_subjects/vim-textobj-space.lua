return {
  "saihoooooooo/vim-textobj-space",
  dependencies = {"kana/vim-textobj-user"},
  keys = {
    {"i<space>", "<Plug>(textobj-space-i)", desc = "TxetObj (Space-i)", mode = {"v", "o"}},
    {"a<space>", "<Plug>(textobj-space-a)", desc = "TxetObj (Space-a)", mode = {"v", "o"}}
  },
  config = function()
    vim.g.textobj_space_no_default_key_mappings = true
  end
}
