return {
  "rhysd/vim-textobj-anyblock",
  dependencies = {"kana/vim-textobj-user"},
  keys = {
    {"i<cr>", "<Plug>(textobj-anyblock-i)", desc = "TxetObj (Block-i)", mode={"v", "o"}},
    {"a<cr>", "<Plug>(textobj-anyblock-a)", desc = "TxetObj (Block-a)", mode={"v", "o"}},
  },
  config = function()
    vim.g.textobj_anyblock_no_default_key_mappings = true
  end
}
