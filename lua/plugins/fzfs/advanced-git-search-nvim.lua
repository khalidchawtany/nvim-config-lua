return {
    "aaronhallaert/advanced-git-search.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "tpope/vim-fugitive",
    },
    cmd = { "AdvancedGitSearch" },
    keys = {
        {
            "<c-s>gj",
            function()
                require("telescope").extensions.git_file_history.git_file_history()
            end,
            desc = "Telescope Git Advaned Search",
        },
    },
    config = function()

        vim.cmd([[cab ags Telescope advanced_git_search ]])

        local gfh_actions = require("telescope").extensions.git_file_history.actions
        require("telescope").setup({
            extensions = {
                advanced_git_search = {
                    -- Browse command to open commits in browser. Default fugitive GBrowse.
                    -- {commit_hash} is the placeholder for the commit hash.
                    browse_command = "GBrowse {commit_hash}",
                    -- when {commit_hash} is not provided, the commit will be appended to the specified command seperated by a space
                    -- browse_command = "GBrowse",
                    -- => both will result in calling `:GBrowse commit`

                    -- fugitive or diffview
                    diff_plugin = "fugitive",
                    -- customize git in previewer
                    -- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
                    git_flags = {},
                    -- customize git diff in previewer
                    -- e.g. flags such as { "--raw" }
                    git_diff_flags = {},
                    git_log_flags = {},
                    -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
                    show_builtin_git_pickers = false,
                    entry_default_author_or_date = "author", -- one of "author" or "date"
                    keymaps = {
                        -- following keymaps can be overridden
                        toggle_date_author = "<C-w>",
                        open_commit_in_browser = "<C-o>",
                        copy_commit_hash = "<C-y>",
                        show_entire_commit = "<C-e>",
                    },

                    -- Telescope layout setup
                    telescope_theme = {
                        function_name_1 = {
                            -- Theme options
                        },
                        function_name_2 = "dropdown",
                        -- e.g. realistic example
                        show_custom_functions = {
                            layout_config = { width = 0.4, height = 0.4 },
                        },

                    }
                },
            },
        })
        require("telescope").load_extension("advanced_git_search")
    end,
}
