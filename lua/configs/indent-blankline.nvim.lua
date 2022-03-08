local M = {
  -- branch = 'lua',
  event = "BufRead"
}

M.init = function()
  vim.g.indent_blankline_enabled = false
end

M.config = function()
  require("indent_blankline").setup {
    char = "│",
    use_treesitter = true,
    show_first_indent_level = false,
    show_end_of_line = true,
    show_current_context = true,
    show_current_context_start = true,
    show_trailing_blankline_indent = false,
    -- for blank lines use space as list char
    space_char_blankline = " ",
    highlight_list = {"Identifier"},
    space_char_highlight_list = {},
    indent_level = 5,
    -- max_indent_increase = 1
  }
end

return M
