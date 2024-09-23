return {
    "aliqyan-21/runTA.nvim",
    cmd = { "RunCode", "ReopenLastOutput", "Output" },
    config = function()
        require("runTA.commands").setup({
            output_window_type = "floating", -- floating, pane, tab, split
            output_window_configs = {
                width = 80,         -- Width of the floating window
                height = 20,        -- Height of the floating window
                position = "center", -- Position of the floating window ("center", "top", "bottom", "left", "right", "custom")
                custom_col = nil,   -- Custom column position (optional)
                custom_row = nil,   -- Custom row position (optional)

                transparent = false, -- Set to true for a transparent background
            },
        })
    end,
}
