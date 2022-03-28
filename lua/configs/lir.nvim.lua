local M = {requires = {'kyazdani42/nvim-web-devicons', 'nvim-lua/plenary.nvim'}, module = {'lir'}}

M.config = function()
    local actions = require 'lir.actions'
    local mark_actions = require 'lir.mark.actions'
    local clipboard_actions = require 'lir.clipboard.actions'

    -- vim.cmd [[nnoremap - :lua require 'lir.float'.toggle()<CR>]]

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

            ['<C-d>'] = function ()
                mark_actions.toggle_mark()
                clipboard_actions.copy()
                clipboard_actions.paste()
            end,

            ['<c-space>'] = function()
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
            winblend = 0,

            -- You can define a function that returns a table to be passed as the third
            -- argument of nvim_open_win().
            win_opts = function()
                local width = math.floor(vim.o.columns * 0.8)
                local height = math.floor(vim.o.lines * 0.8)
                return {
                    border = require("lir.float.helper").make_border_opts({"+", "─", "+", "│", "+", "─", "+", "│"}, "Normal"),
                    -- border = require("lir.float.helper").make_border_opts({"", "", "", "", "", "", "", ""}, "Normal"),
                    width = width,
                    height = height,
                    row = 1,
                    col = math.floor((vim.o.columns - width) / 2)
                }
            end
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
            ['q'] = b_actions.open_lir,
            ['<C-Space>'] = function()
                mark_actions.toggle_mark()
                vim.cmd('normal! j')
            end
        }

    }

end

-- use visual mode
function _G.LirSettings()
    vim.api.nvim_buf_set_keymap(0, 'x', 'J', ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>', {noremap = true, silent = true})

    -- echo cwd
    vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
end

M.init = function()
    vim.cmd [[augroup lir-settings]]
    vim.cmd [[  autocmd!]]
    vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
    vim.cmd [[augroup END]]

    vim.cmd [[nnoremap - :lua require 'lir.float'.toggle()<CR>]]
    -- vim.api.nvim_set_keymap("n", '-', ":lua require 'lir.float'.toggle()<CR>", {noremap = true, silent = true})

end

return M
