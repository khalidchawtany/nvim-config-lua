return {
  "p00f/nvim-ts-rainbow", -- make parenthese pairs distinguishable
  dependencies = "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  config = function()
    require "nvim-treesitter.configs".setup {
      rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
      }
    }
  end
}
