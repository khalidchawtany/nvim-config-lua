local M = {
  module = "leap-ast",
  require = { "ggandor/leap.nvim", "nvim-treesitter/nvim-treesitter" }
}

M.init = function()
  vim.keymap.set(
    { "n", "x", "o" },
    "<c-s>s",
    function()
      require "leap-ast".leap()
    end,
    {}
  )
end

M.config = function()
end

return M
