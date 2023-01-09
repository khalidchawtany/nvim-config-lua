return {
  "AndrewRadev/splitjoin.vim",
  cmd = {"SplitjoinSplit", "SplitjoinJoin"},
  keys = {
    {
      "<leader>gS",
      ":let g:splitjoin_php_method_chain_full = !g:splitjoin_php_method_chain_full<cr>",
      desc = "Pounce (Repeat)"
    },
    {"gS", ":call Preserve('SplitjoinSplit')<cr>", desc = "SplitJoin (Split)"},
    {"gJ", ":call Preserve('SplitjoinJoin')<cr>", desc = "SplitJoin (Join)"}
  },
  config = function()
    vim.g.splitjoin_php_method_chain_full = 1
  end

}
