return {
    "simonmclean/triptych.nvim",
    event = "VeryLazy",
    cmd = { "Triptych" },
    keys = {
        { "-tt", "<cmd>Triptych<cr>", desc = "Triptych File Browser", { silent = true, nowait = true } },
    },
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "nvim-tree/nvim-web-devicons", -- optional
    },
    config = function()
        require("triptych").setup({
            mappings = {
                -- Everything below is buffer-local, meaning it will only apply to Triptych windows
                show_help = "g?",
                jump_to_cwd = ".", -- Pressing again will toggle back
                nav_left = "h",
                nav_right = { "l", "<CR>" },
                delete = "d",
                add = "a",
                copy = "c",
                rename = "r",
                cut = "x",
                paste = "p",
                quit = "q",
                toggle_hidden = "<leader>.",
                extension_mappings = {
                    ["<c-f>"] = {
                        mode = "n",
                        fn = function(target)
                            --  traget is the following table
                            --  {
                            --     basename, -- e.g. bar.js
                            --     children, -- table containing directory contents (if applicable)
                            --     dirname, -- e.g. /User/Name/foo
                            --     display_name -- same as basename (redundant field)
                            --     filetype, -- e.g. 'javascript'
                            --     is_dir, -- boolean indicating whether this is a directory
                            --     path, -- e.g. /User/Name/foo/bar.js
                            -- }

                            require("telescope.builtin").live_grep({
                                search_dirs = { target.path },
                            })
                        end,
                    },
                },
            },
            options = {
                dirs_first = true,
                show_hidden = false,
                line_numbers = {
                    enabled = true,
                    relative = false,
                },
                file_icons = {
                    enabled = true,
                    directory_icon = "",
                    fallback_file_icon = "",
                },
            },
            git_signs = {
                enabled = true,
                signs = {
                    add = "+",
                    modify = "~",
                    rename = "r",
                    untracked = "?",
                },
            },
            diagnostic_signs = {
                enabled = true,
            },
        })
    end,
}
