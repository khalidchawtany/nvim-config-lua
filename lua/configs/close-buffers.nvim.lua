local M = {
    module = {'close_buffers'}
}

M.init = function ()

    vim.api.nvim_set_keymap(
    'n',
    '<c-;>wh',
    [[<CMD>lua require('close_buffers').delete({type = 'hidden',  force = true})<CR>]],
    { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
    'n',
    '<c-;>wn',
    [[<CMD>lua require('close_buffers').delete({type = 'nameless',  force = true})<CR>]],
    { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
    'n',
    '<c-;>wt',
    [[<CMD>lua require('close_buffers').delete({type = 'this',  force = true})<CR>]],
    { noremap = true, silent = true }
    )
end

M.config = function ()

    require('close_buffers').setup({
        filetype_ignore = {},  -- Filetype to ignore when running deletions
        file_glob_ignore = {},  -- File name glob pattern to ignore when running deletions (e.g. '*.md')
        file_regex_ignore = {}, -- File name regex pattern to ignore when running deletions (e.g. '.*[.]md')
        preserve_window_layout = { 'this', 'nameless' },  -- Types of deletion that should preserve the window layout
        next_buffer_cmd = nil,  -- Custom function to retrieve the next buffer when preserving window layout
    })

end


return M
