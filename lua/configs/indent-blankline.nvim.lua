local M = {
    -- branch = 'lua',
    event = "BufRead",
    init = function()
        vim.g.indent_blankline_enabled = false
    end,
    config = function()
        vim.g.indent_blankline_use_treesitter = true
        vim.g.indent_blankline_show_first_indent_level = false
        vim.g.indent_blankline_char = '│'

        vim.g.indent_blankline_show_current_context = true
        -- vim.cmd [[ let g:indent_blankline_show_current_context=v:true ]]
        vim.g.indent_blankline_context_highlight_list = {'Identifier'}
    end
}

return M
