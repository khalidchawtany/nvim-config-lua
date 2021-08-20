local M = {
    requires = {
        'nvim-lua/plenary.nvim',
        'nvim-lua/popup.nvim',
        'nvim-telescope/telescope-fzy-native.nvim'
    },
    module={'telescope'},
    -- cmd = {'Telescope'},
}

M.init = function()
    vim.cmd [[
            nnoremap <c-s><c-p>  <cmd>lua require('telescope.builtin').find_files()<cr>
            nnoremap <c-s>p      <cmd>lua require('telescope.builtin').find_files({find_command = {"fd", vim.fn.expand("<cword>")}})<cr>
            nnoremap <c-s><c-a>  <cmd>lua require('telescope.builtin').live_grep()<cr>
            nnoremap <c-s>a      <cmd>lua require('telescope.builtin').grep_string()<cr>
            nnoremap <c-s><c-o>  <cmd>lua require('telescope.builtin').buffers()<cr>
            nnoremap <c-s><c-h>  <cmd>lua require('telescope.builtin').help_tags()<cr>
            nnoremap <c-s><c-->  <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>
            nnoremap <c-s><c-->  <cmd>lua require('telescope.builtin').lsp_document_symbols({search = ":methods:"})<cr>
            nnoremap <c-s><c-l>  <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
    ]]

    vim.api.nvim_set_keymap('n', '<C-p><c-\\>', ":lua require'telescope'.extensions.project.project{}<CR>", {noremap = true, silent = true})

    vim.api.nvim_set_keymap('n', '<c-s><c-d>', ":lua require('telescope.builtin').lsp_definitions()<CR>", {noremap = true, silent = true})

    -- vim.api.nvim_set_keymap('n', '<c-p>p', ":lua require('telescope.builtin').find_files{search = vim.fn.expand(\"<cword>\") }<CR>",
    --                        {noremap = true, silent = true})

end

M.config = function()
    -- in find files avoid normal mode

    local actions = require('telescope.actions')
    require('telescope').setup {
        defaults = {
            mappings = {
                i = {
                    -- To disable a keymap, put [map] = false
                    -- So, to not map "<C-n>", just put
                    ["<c-x>"] = false,
                    -- ["<esc>"] = actions.close,

                    -- Otherwise, just set the mapping to the function that you want it to be.
                    ["<C-i>"] = actions.select_horizontal,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<c-space>"] = actions.toggle_selection + actions.move_selection_better

                    -- Add up multiple actions
                    -- ["<CR>"] = actions.select_default + actions.center

                    -- You can perform as many actions in a row as you like
                    -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
                },
                n = {
                    ["<esc>"] = actions.close
                    -- ["<C-i>"] = my_cool_custom_action,
                }
            },

            vimgrep_arguments = {'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
            prompt_prefix = "> ",
            selection_caret = "> ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "descending",
            file_sorter = require'telescope.sorters'.get_fuzzy_file,
            file_ignore_patterns = {},
            generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
            -- path_display = {},
            winblend = 0,
            layout_strategy = "horizontal",
            -- layout_defaults = {horizontal = {mirror = false}, vertical = {mirror = false}},
            layout_config = {
                horizontal = {mirror = false},
                vertical = {mirror = false},
                width = 0.8,
                height = 0.8,
                preview_width = 0.5,
                prompt_position = "bottom",
                preview_cutoff = 120
            },
            border = {},
            borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
            color_devicons = true,
            use_less = true,
            set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
            file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
            grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
            qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

            -- Developer configurations: Not meant for general override
            buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
        }
    }

    require('telescope').setup {
        extensions = {
            fzy_native = {override_generic_sorter = false, override_file_sorter = true},

            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = false, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case" -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }
    }
    require('telescope').load_extension('fzy_native')
    require('telescope').load_extension('fzf')

end

return M

