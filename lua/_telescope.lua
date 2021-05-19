local vim = vim
vim.cmd [[
	nnoremap <c-p><c-p> <cmd>Telescope find_files<cr>
	nnoremap <c-p><c-a> <cmd>Telescope live_grep<cr>
	nnoremap <c-p><c-o> <cmd>Telescope buffers<cr>
	nnoremap <c-p><c-h> <cmd>Telescope help_tags<cr>

	noremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
	noremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
	noremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
	noremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
]]

vim.api.nvim_set_keymap('n', '<C-p><c-\\>', ":lua require'telescope'.extensions.project.project{}<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 'gd', ":lua require('telescope.builtin').lsp_definitions()<CR>", {noremap = true, silent = true})

local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                -- To disable a keymap, put [map] = false
                -- So, to not map "<C-n>", just put
                ["<c-x>"] = false,

                -- Otherwise, just set the mapping to the function that you want it to be.
                ["<C-i>"] = actions.select_horizontal,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<c-space>"] = actions.toggle_selection + actions.move_selection_better,

                -- Add up multiple actions
                ["<CR>"] = actions.select_default + actions.center

                -- You can perform as many actions in a row as you like
                -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
            },
            n = {
                ["<esc>"] = actions.close
                -- ["<C-i>"] = my_cool_custom_action,
            }
        },

        vimgrep_arguments = {'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
        prompt_position = "bottom",
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_defaults = {horizontal = {mirror = false}, vertical = {mirror = false}},
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        width = 0.75,
        preview_cutoff = 120,
        results_height = 1,
        results_width = 0.8,
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

require('telescope').setup {extensions = {fzy_native = {override_generic_sorter = false, override_file_sorter = true}}}
require('telescope').load_extension('fzy_native')
