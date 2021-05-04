local actions = require 'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require 'lir.clipboard.actions'

require'lir'.setup {
    show_hidden_files = false,
    devicons_enable = true,
    mappings = {
        ['<cr>'] = actions.edit,
        ['<C-s>'] = actions.split,
        ['<C-v>'] = actions.vsplit,
        ['<C-t>'] = actions.tabedit,

        ['-'] = actions.up,
        ['q'] = actions.quit,

        ['K'] = actions.mkdir,
        ['N'] = actions.newfile,
        ['R'] = actions.rename,
        ['@'] = actions.cd,
        ['Y'] = actions.yank_path,
        ['.'] = actions.toggle_show_hidden,
        ['D'] = actions.delete,

        ['J'] = function()
            mark_actions.toggle_mark()
            vim.cmd('normal! j')
        end,
        ['C'] = clipboard_actions.copy,
        ['X'] = clipboard_actions.cut,
        ['P'] = clipboard_actions.paste,

        -- Bookmarks
        ['B'] = require'lir.bookmark.actions'.list,
        ['bb'] = require'lir.bookmark.actions'.add
    },
    float = {
        size_percentage = 0.5,
        winblend = 15,
        border = true,
        borderchars = {"╔", "═", "╗", "║", "╝", "═", "╚", "║"}

        -- -- If you want to use `shadow`, set `shadow` to `true`.
        -- -- Also, if you set shadow to true, the value of `borderchars` will be ignored.
        -- shadow = false,
    },
    hide_cursor = true
}

-- custom folder icon
require'nvim-web-devicons'.setup({override = {lir_folder_icon = {icon = "", color = "#7ebae4", name = "LirFolderNode"}}})

-- Bookmarks
local b_actions = require 'lir.bookmark.actions'
require'lir.bookmark'.setup {
    bookmark_path = '~/.local/share/nvim/lir_bookmark',
    mappings = {
        ['<cr>'] = b_actions.edit,
        ['<C-s>'] = b_actions.split,
        ['<C-v>'] = b_actions.vsplit,
        ['<C-t>'] = b_actions.tabedit,
        ['<C-e>'] = b_actions.open_lir,
        ['B'] = b_actions.open_lir,
        ['q'] = b_actions.open_lir
    }
}

-- use visual mode
function _G.LirSettings()
    vim.api.nvim_buf_set_keymap(0, 'x', 'J', ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>', {noremap = true, silent = true})

    -- echo cwd
    vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
end

vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]

vim.api.nvim_set_keymap("n", '-', ":lua require 'lir.float'.toggle()<CR>", {noremap = true, silent = true})
