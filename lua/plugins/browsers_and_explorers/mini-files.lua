return {
    "echasnovski/mini.files",
    version = false,
    event = "VimEnter",
    keys = {
        {
            "--",
            function()
                require("mini.files").open(vim.api.nvim_buf_get_name(0))
            end,
            desc = "Mini files",
        },
    },
    config = function()
        require("mini.files").setup(
        -- No need to copy this inside `setup()`. Will be used automatically.
            {
                -- Customization of shown content
                content = {
                    -- Predicate for which file system entries to show
                    filter = nil,
                    -- What prefix to show to the left of file system entry
                    prefix = nil,
                    -- In which order to show file system entries
                    sort = nil,
                },

                -- Module mappings created only inside explorer.
                -- Use `''` (empty string) to not create one.
                mappings = {
                    close = "q",
                    go_in = "l",
                    go_in_plus = "L",
                    go_out = "h",
                    go_out_plus = "H",
                    reset = "<BS>",
                    reveal_cwd = "@",
                    show_help = "g?",
                    synchronize = "=",
                    trim_left = "<",
                    trim_right = ">",
                },

                -- General options
                options = {
                    -- Whether to delete permanently or move into module-specific trash
                    permanent_delete = true,
                    -- Whether to use for editing directories
                    use_as_default_explorer = true,
                },

                -- Customization of explorer windows
                windows = {
                    -- Maximum number of windows to show side by side
                    max_number = math.huge,
                    -- Whether to show preview of file/directory under cursor
                    preview = true,
                    -- Width of focused window
                    width_focus = 35,
                    -- Width of non-focused window
                    width_nofocus = 35,
                    -- Width of preview window
                    width_preview = 120,
                },
            }
        )

        local show_dotfiles = true

        local filter_show = function(fs_entry)
            return true
        end

        local filter_hide = function(fs_entry)
            return not vim.startswith(fs_entry.name, ".")
        end

        local toggle_dotfiles = function()
            show_dotfiles = not show_dotfiles
            local new_filter = show_dotfiles and filter_show or filter_hide
            require("mini.files").refresh({ content = { filter = new_filter } })
        end

        local map_split = function(buf_id, lhs, direction)
            local rhs = function()
                -- Make new window and set it as target
                local new_target_window
                vim.api.nvim_win_call(require("mini.files").get_target_window(), function()
                    vim.cmd(direction .. " split")
                    new_target_window = vim.api.nvim_get_current_win()
                end)

                require("mini.files").set_target_window(new_target_window)
            end

            -- Adding `desc` will result into `show_help` entries
            local desc = "Split " .. direction
            vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
        end

        vim.api.nvim_create_autocmd({ "User" }, {
            pattern = "MiniFilesBufferCreate",
            callback = function(args)
                -- -- Customize window-local settings
                -- vim.wo[win_id].winblend = 50
                -- vim.api.nvim_win_set_config(win_id, { border = "double" })

                ---------------------------------------------------------------------------------

                local buf_id = args.data.buf_id
                -- Tweak left-hand side of mapping to your liking
                vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id })
                vim.keymap.set("n", "<cr>", function()
                    require("mini.files").go_in({ close_on_file = true })
                end, { buffer = buf_id, nowait = true })

                vim.keymap.set("n", "-", function()
                    require("mini.files").go_out()
                end, { buffer = buf_id, nowait = true })

                -- Tweak keys to your liking
                map_split(buf_id, "gs", "belowright horizontal")
                map_split(buf_id, "gv", "belowright vertical")
            end,
        })
    end,
}
