return {
 "ggandor/leap-ast.nvim",
  dependencies = {"ggandor/leap.nvim", "nvim-treesitter/nvim-treesitter"},
  keys = {
    {
      "<c-s>s",
      function()
        require "leap-ast".leap()
      end,
      desc = "Buffer tree",
      mode = {"n", "x", "o"}
    }
  }
}
