local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
        "LinArcX/telescope-command-palette.nvim",
        "natecraddock/telescope-zf-native.nvim",
    },
    cmd = { "Telescope" },
    keys = {
        {
            "<c-s><leader>p",
            function()
                require("telescope.builtin").pickers()
            end,
            desc = "Telescope: pickers",
        },
        {
            "<c-s><leader>s",
            function()
                require("telescope.builtin").lsp_workspace_symbols()
            end,
            desc = "Telescope: lsp_workspace_symbols",
        },
        {
            "<c-s><leader>t",
            function()
                require("telescope.builtin").lsp_type_definitions()
            end,
            desc = "Telescope: lsp_type_definitions",
        },
        {
            "<c-s><leader>e",
            function()
                require("telescope.builtin").diagnostics()
            end,
            desc = "Telescope: diagnostics",
        },
        {
            "<c-s><leader>i",
            function()
                require("telescope.builtin").lsp_incoming_calls()
            end,
            desc = "Telescope: lsp_incoming_calls",
        },
        {
            "<c-s><leader>o",
            function()
                require("telescope.builtin").lsp_outgoing_calls()
            end,
            desc = "Telescope: lsp_outgoing_calls",
        },
        {
            "<c-s><leader>r",
            function()
                require("telescope.builtin").lsp_references()
            end,
            desc = "Telescope: lsp_references",
        },
        {
            "<leader><c-s>s",
            function()
                require("telescope.builtin").lsp_workspace_symbols()
            end,
            desc = "Telescope: lsp_workspace_symbols",
        },
        {
            "<leader><c-s>t",
            function()
                require("telescope.builtin").lsp_type_definitions()
            end,
            desc = "Telescope: lsp_type_definitions",
        },
        {
            "<leader><c-s>e",
            function()
                require("telescope.builtin").diagnostics()
            end,
            desc = "Telescope: diagnostics",
        },
        {
            "<leader><c-s>i",
            function()
                require("telescope.builtin").lsp_incoming_calls()
            end,
            desc = "Telescope: lsp_incoming_calls",
        },
        {
            "<leader><c-s>o",
            function()
                require("telescope.builtin").lsp_outgoing_calls()
            end,
            desc = "Telescope: lsp_outgoing_calls",
        },
        {
            "<leader><c-s>r",
            function()
                require("telescope.builtin").lsp_references()
            end,
            desc = "Telescope: lsp_references",
        },
        {
            "<c-s>r",
            function()
                require("telescope.builtin").reloader()
            end,
            desc = "Telescope: reloader",
        },
        {
            "<c-s>end",
            function()
                require("telescope.builtin").resume()
            end,
            desc = "Telescope: resume",
        },
        {
            "<c-s><c-cr>",
            function()
                require("telescope.builtin").resume()
            end,
            desc = "Telescope: resume",
        },
        -- { "<c-s><c-p>",     function() require('telescope.builtin').find_files()end,            desc = "Telescope: Find files" },
        {
            "<c-s>p",
            function()
                require("telescope.builtin").find_files({ find_command = { "fd", vim.fn.expand("<cword>") } })
            end,
            desc = "Telescope: file under cursor",
        },
        -- { "<c-s><c-a>", function() require('telescope.builtin').live_grep()end,   desc = "Telescope: live_grep" },
        {
            "<c-s><c-k>",
            function()
                require("telescope.builtin").live_grep({ grep_open_files = true })
            end,
            desc = "Telescope: live_grep open files",
        },
        -- { "<c-s>a",     function() require('telescope.builtin').grep_string()end, desc = "Telescope: grep_string" },
        {
            "<c-s><c-o>",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "Telescope: buffers",
        },
        {
            "<c-s><c-h>",
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "Telescope: help",
        },
        {
            "<c-s>-",
            function()
                require("telescope.builtin").lsp_document_symbols()
            end,
            desc = "Telescope: lsp_document_symbols",
        },
        {
            "<c-s><c-->",
            function()
                require("telescope.builtin").lsp_document_symbols({ default_text = "method " })
            end,
            desc = "Telescope:  methods in document",
        },
        {
            "<c-s><c-l>",
            function()
                require("telescope.builtin").current_buffer_fuzzy_find()
            end,
            desc = "Telescope: fuzzy find in buffer",
        },
        {
            "<c-s>l",
            function()
                require("telescope.builtin").current_buffer_fuzzy_find({ default_text = vim.fn.expand("<cword>") })
            end,
            desc = "Telescope: fuzzy find in buffer",
        },
        {
            "<c-s><c-u>",
            function()
                require("telescope.builtin").oldfiles()
            end,
            desc = "Telescope: old files",
        },
        {
            "<c-s>u",
            function()
                require("telescope.builtin").oldfiles()
            end,
            desc = "Telescope: old files",
        },
        {
            "<c-s><c-g>",
            function()
                require("telescope.builtin").git_status()
            end,
            desc = "Telescope: git_status",
        },
        {
            "<c-s>gs",
            function()
                require("telescope.builtin").git_stash()
            end,
            desc = "Telescope: git_stash",
        },
        {
            "<c-s>gb",
            function()
                require("telescope.builtin").git_branches()
            end,
            desc = "Telescope: git_branches",
        },
        {
            "<c-s>gC",
            function()
                require("telescope.builtin").git_commits()
            end,
            desc = "Telescope: git_commits",
        },
        {
            "<c-s>gc",
            function()
                require("telescope.builtin").git_bcommits()
            end,
            desc = "Telescope: git_bcommits",
        },
        {
            "<c-s>gf",
            function()
                require("telescope.builtin").git_files()
            end,
            desc = "Telescope: git_files",
        },
        {
            "<C-s><c-d>",
            function()
                require("telescope.builtin").lsp_definitions()
            end,
            desc = "Telescope: lsp_definitions",
        },
    },
}

M.init = function()
    vim.keymap.set("n", "<leader>hoo", function()
        require("telescope.builtin").live_grep({
            cwd = "~/Development/Libraries/october",
            prompt_title = "OctoberCMS Docs",
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--glob",
                "!*lang",
                "--glob",
                "!*.min.js",
                "--glob",
                "!*/ru/*",
            },
        })
    end, { desc = "Telescope (OctoberCMS Docs)" })

    vim.keymap.set("n", "<leader>hot", function()
        require("telescope.builtin").live_grep({
            cwd = "~/Projects/PHP/tic/plugins/lox/tic/",
            prompt_title = "OctoberCMS TIC",
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--glob",
                "!*lang",
                "--glob",
                "!*.min.js",
            },
        })
    end, { desc = "Telescope (OctoberCMS TIC)" })

    -- vim.api.nvim_set_keymap('n', '<c-p>p', ":lua require('telescope.builtin').find_files{search = vim.fn.expand(\"<cword>\") }<CR>",
    --                        {noremap = true, silent = true})
end

M.config = function()
    local open_in_nvim_tree = function(prompt_bufnr)
        local action_state = require("telescope.actions.state")
        local Path = require("plenary.path")
        local actions = require("telescope.actions")

        local entry = action_state.get_selected_entry()[1]
        local entry_path = Path:new(entry):parent():absolute()
        actions._close(prompt_bufnr, true)
        entry_path = Path:new(entry):parent():absolute()
        entry_path = entry_path:gsub("\\", "\\\\")
        -- dump(entry_path)

        -- vim.cmd("e " .. entry_path)
        -- vim.cmd("NvimTreeFindFile " .. entry_path)

        -- file_name = nil
        -- for s in string.gmatch(entry, "[^/]+") do
        --   file_name = s
        -- end
        --
        -- dump("file_name: " .. file_name)
        --
        -- vim.cmd("/" .. file_name)
    end

    -- in find files avoid normal mode

    local actions = require("telescope.actions")
    require("telescope").setup({
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown({
                    -- even more opts
                }),
                -- pseudo code / specification for writing custom displays, like the one
                -- for "codeactions"
                -- specific_opts = {
                --   [kind] = {
                --     make_indexed = function(items) -> indexed_items, width,
                --     make_displayer = function(widths) -> displayer
                --     make_display = function(displayer) -> function(e)
                --     make_ordinal = function(e) -> string
                --   },
                --   -- for example to disable the custom builtin "codeactions" display
                --      do the following
                --   codeactions = false,
                -- }
            },
            file_browser = {
                --theme = "ivy",
                mappings = {
                    ["i"] = {},
                    ["n"] = {},
                },
            },
        },
        defaults = {
            mappings = {
                i = {
                    -- To disable a keymap, put [map] = false
                    -- So, to not map "<C-n>", just put
                    ["<c-x>"] = false,
                    -- ["<esc>"] = actions.close,
                    ["<c-s>"] = open_in_nvim_tree,
                    -- Otherwise, just set the mapping to the function that you want it to be.
                    ["<C-i>"] = actions.select_horizontal,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<c-space>"] = actions.toggle_selection + actions.move_selection_better,
                    ["<C-'>"] = actions.which_key,
                    ["<C-CR>"] = actions.select_default + actions.center,
                    ["<C-c>"] = actions.close,
                    ["<C-p>"] = require("telescope.actions.layout").toggle_preview,

                    -- Add up multiple actions
                    -- ["<CR>"] = actions.select_default + actions.center

                    -- You can perform as many actions in a row as you like
                    -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
                },
                n = {
                    ["<esc>"] = actions.close,
                    ["<c-s>"] = open_in_nvim_tree,
                    ["<C-c>"] = actions.close,
                    -- ["<C-i>"] = my_cool_custom_action,
                },
            },
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
            },
            prompt_prefix = "> ",
            selection_caret = "> ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            -- show results from top to bottom
            sorting_strategy = "ascending", -- "descending",
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            file_ignore_patterns = {},
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            -- path_display = {},
            winblend = 0,
            layout_strategy = "flex",
            -- layout_defaults = {horizontal = {mirror = false}, vertical = {mirror = false}},
            layout_config = {
                horizontal = {
                    mirror = false,
                    preview_width = 0.5,
                },
                vertical = {
                    mirror = false,
                    preview_height = 0.3,
                },
                width = 0.8,
                height = 0.95,
                -- preview_width = 0.4,
                prompt_position = "top",
                preview_cutoff = 10,
            },
            border = {},
            borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            color_devicons = true,
            use_less = true,
            set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
            -- Developer configurations: Not meant for general override
            buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        },
    })

    require("telescope").load_extension("ui-select")
end

return M
