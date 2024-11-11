return {
    "EvWilson/spelunk.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",   -- For window drawing utilities
        "nvim-telescope/telescope.nvim", -- Optional: for fuzzy search capabilities
    },

    -- keys = {
    -- 	{
    -- 		"<leader>hh",
    -- 		":lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>",
    -- 		desc = "Harpoon (Toggle)",
    -- 	},
    -- 	{
    -- 		"<leader>ha",
    -- 		":lua require('harpoon'):list():add()<cr>",
    -- 		desc = "Harpoon (Add)",
    -- 	},
    -- 	{
    -- 		"<leader>h1",
    -- 		":lua require('harpoon'):list():select(1)<cr>",
    -- 		desc = "Harpoon (1)",
    -- 	},
    -- 	{
    -- 		"<leader>h2",
    -- 		":lua require('harpoon'):list():select(2)<cr>",
    -- 		desc = "Harpoon (2)",
    -- 	},
    -- 	{
    -- 		"<leader>h3",
    -- 		":lua require('harpoon'):list():select(3)<cr>",
    -- 		desc = "Harpoon (3)",
    -- 	},
    -- 	{
    -- 		"<leader>h4",
    -- 		":lua require('harpoon'):list():select(4)<cr>",
    -- 		desc = "Harpoon (4)",
    -- 	},
    -- 	{
    -- 		"<leader>h5",
    -- 		":lua require('harpoon'):list():select(5)<cr>",
    -- 		desc = "Harpoon (5)",
    -- 	},
    -- 	{
    -- 		"<leader>h6",
    -- 		":lua require('harpoon'):list():select(6)<cr>",
    -- 		desc = "Harpoon (6)",
    -- 	},
    -- 	{
    -- 		"<leader>h7",
    -- 		":lua require('harpoon'):list():select(7)<cr>",
    -- 		desc = "Harpoon (7)",
    -- 	},
    -- 	{
    -- 		"<leader>h8",
    -- 		":lua require('harpoon'):list():select(8)<cr>",
    -- 		desc = "Harpoon (8)",
    -- 	},
    -- 	{
    -- 		"<leader>h9",
    -- 		":lua require('harpoon'):list():select(9)<cr>",
    -- 		desc = "Harpoon (9)",
    -- 	},
    -- 	{
    -- 		"<leader>h0",
    -- 		":lua require('harpoon'):list():select(10)<cr>",
    -- 		desc = "Harpoon (10)",
    -- 	},
    -- 	{
    -- 		"<leader>hj",
    -- 		"lua require('harpoon'):list():next()<cr>",
    -- 		desc = "Harpoon (Next)",
    -- 	},
    -- 	{
    -- 		"<leader>hk",
    -- 		"lua require('harpoon'):list():prev()<cr>",
    -- 		desc = "Harpoon (Prev)",
    -- 	},
    -- 	{
    -- 		"<c-space><c-space>",
    -- 		":Telescope harpoon marks<cr>",
    -- 		desc = "Harpoon (Telescope)",
    -- 	},
    -- },
    config = function()
        require("spelunk").setup({
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
