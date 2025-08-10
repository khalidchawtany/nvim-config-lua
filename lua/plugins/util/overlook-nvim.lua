return
{
    "WilliamHsieh/overlook.nvim",
    opts = {},

    -- Optional: set up common keybindings
    keys = {
        -- { "gk", function() require("overlook.api").peek_definition() end, desc = "Overlook: Peek definition" },
        -- { "gkc", function() require("overlook.api").close_all() end,       desc = "Overlook: Close all popup" },
        -- { "gku", function() require("overlook.api").restore_popup() end,   desc = "Overlook: Restore popup" },

        -- vim.keymap.set("n", "gkd", require("overlook.api").peek_definition, { desc = "Peek definition" })
        -- vim.keymap.set("n", "gkp", require("overlook.api").peek_cursor, { desc = "Peek cursor" })
        -- vim.keymap.set("n", "gku", require("overlook.api").restore_popup, { desc = "Restore last popup" })
        -- vim.keymap.set("n", "gkU", require("overlook.api").restore_all_popups, { desc = "Restore all popups" })
        -- vim.keymap.set("n", "gkc", require("overlook.api").close_all, { desc = "Close all popups" })
        -- vim.keymap.set("n", "gkf", require("overlook.api").switch_focus, { desc = "Switch focus" })
        -- vim.keymap.set("n", "gks", require("overlook.api").open_in_split, { desc = "Open popup in split" })
        -- vim.keymap.set("n", "gkv", require("overlook.api").open_in_vsplit, { desc = "Open popup in vsplit" })
        -- vim.keymap.set("n", "gkt", require("overlook.api").open_in_tab, { desc = "Open popup in tab" })
        -- vim.keymap.set("n", "gko", require("overlook.api").open_in_original_window, { desc = "Open popup in current window" })

    },
    config = function()
        require("overlook").setup({
            -- UI settings for popup windows
            ui = {
                border = "rounded",   -- Border style: "none", "single", "double", "rounded", etc.
                z_index_base = 30,    -- Base z-index for first popup
                row_offset = 2,       -- Initial row offset from cursor
                col_offset = 5,       -- Initial column offset from cursor
                stack_row_offset = 1, -- Vertical offset for stacked popups
                stack_col_offset = 2, -- Horizontal offset for stacked popups
                width_decrement = 2,  -- Width reduction for each stacked popup
                height_decrement = 1, -- Height reduction for each stacked popup
                min_width = 10,       -- Minimum popup width
                min_height = 3,       -- Minimum popup height
                size_ratio = 0.65,    -- Default size ratio (0.0 to 1.0)
                keys = {
                    close = "q",      -- Key to close the topmost popup
                },
            },

            -- Optional callback when all popups are closed
            on_stack_empty = function()
                -- Your custom logic here
            end,
        })
    end
}
