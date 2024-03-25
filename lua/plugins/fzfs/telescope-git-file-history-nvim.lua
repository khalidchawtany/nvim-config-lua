return {

    "isak102/telescope-git-file-history.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "tpope/vim-fugitive"
    },
    keys = {
        {
            "<c-s>gh",
            function()
                require("telescope").extensions.git_file_history.git_file_history()
            end,
            desc = "Telescope git_file_history"
        }
    },
    config = function()
        local gfh_actions = require("telescope").extensions.git_file_history.actions
        require("telescope").setup {
            extensions = {
                git_file_history = {
                    mappings = {
                        i = {
                            ["<C-g>"] = gfh_actions.open_in_browser,
                        },
                        n = {
                            ["<C-g>"] = gfh_actions.open_in_browser,
                        },
                    },
                },
            },
        }
        require("telescope").load_extension("git_file_history")
    end
}
