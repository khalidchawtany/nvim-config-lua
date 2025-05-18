return {
    "EvWilson/spelunk.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",         -- For window drawing utilities
        "nvim-telescope/telescope.nvim", -- Optional: for fuzzy search capabilities
    },

    keys = {
        "<leader>hh",
        "<leader>ha",
        "<leader>hj",
        "<leader>hk",
        "<leader>hs",
        "<leader>hf",
    },

    config = function()
        local function width_portion()
            return math.floor(vim.o.columns / 20)
        end

        local function height_portion()
            return math.floor(vim.o.lines / 10)
        end

        local dims = {
            width = width_portion() * 10,
            height = height_portion() * 10,
        }

        require("spelunk").setup({

            -- Here's an example of leaving the preview UI pane un-rendered, with a sample `lazy.nvim` spec:
            orientation = {
                bookmark_dimensions = function()
                    return {
                        base = dims,
                        line = math.floor(vim.o.lines / 2) - math.floor(dims.height / 2),
                        col = width_portion(),
                    }
                end,
                preview_dimensions = function()
                    return {
                        base = dims,
                        line = math.floor(vim.o.lines / 2) - math.floor(dims.height / 2),
                        col = width_portion() * 11,
                    }
                end,
                help_dimensions = function()
                    return {
                        base = dims,
                        line = math.floor(vim.o.lines / 2) - math.floor(dims.height / 2) - 2,
                        col = width_portion() * 6,
                    }
                end,
            },
            -- display_function = function(mark)
            -- 	local ctx = require("spelunk.util").get_treesitter_context(mark)
            -- 	ctx = (ctx == "" and ctx) or (" - " .. ctx)
            -- 	local filename = spelunk.filename_formatter(mark.file)
            -- 	return string.format("%s:%d%s", filename, mark.line, ctx)
            -- end,
            -- Flag to enable directory-scoped bookmark persistence
            enable_persist = true,

            -- Prefix for the Lualine integration
            -- (Change this if your terminal emulator lacks emoji support)
            statusline_prefix = "🔖",

            base_mappings = {
                -- Toggle the UI open/closed
                toggle = "<leader>hh",
                -- Add a bookmark to the current stack
                add = "<leader>ha",
                -- Move to the next bookmark in the stack
                next_bookmark = "<leader>hj",
                -- Move to the previous bookmark in the stack
                prev_bookmark = "<leader>hk",
                -- Fuzzy-find all bookmarks
                search_bookmarks = "<leader>hs",
                -- Fuzzy-find bookmarks in current stack
                search_current_bookmarks = "<leader>hf",
            },
            window_mappings = {
                -- Move the UI cursor down
                cursor_down = "j",
                -- Move the UI cursor up
                cursor_up = "k",
                -- Move the current bookmark down in the stack
                bookmark_down = "<C-j>",
                -- Move the current bookmark up in the stack
                bookmark_up = "<C-k",
                -- Jump to the selected bookmark
                goto_bookmark = "<CR>",
                -- Jump to the selected bookmark in a new vertical split
                goto_bookmark_hsplit = "x",
                -- Jump to the selected bookmark in a new horizontal split
                goto_bookmark_vsplit = "v",
                -- Delete the selected bookmark
                delete_bookmark = "d",
                -- Navigate to the next stack
                next_stack = "<Tab>",
                -- Navigate to the previous stack
                previous_stack = "<S-Tab>",
                -- Create a new stack
                new_stack = "n",
                -- Delete the current stack
                delete_stack = "D",
                -- Rename the current stack
                edit_stack = "E",
                -- Close the UI
                close = "q",
                -- Open the help menu
                help = "h", -- Not rebindable
            },
        })
    end,
}
