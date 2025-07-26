return {
    "khalidchawtany/buffertag", -- put a tag on each windo with the file name
    event = "BufEnter",
    keys = {
        { "yoq", "<cmd>BuffertagToggle<cr>", desc = "Buffertag" },
    },
    config = function()
        require("buffertag").setup({
            -- accepts any border options that `nvim_open_win` accepts.
            -- see ":help vim.api.nvim_open_win"
            border = "none",
            -- By default if the buffer name is too wide for the pane it's in, it will
            -- display and overlap the pane. By setting this to true, the buffer name will
            -- be truncated to fit within the pane, ensuring the floating window does not
            -- overlap any other panes.
            limit_width = true,
            -- if `vim.bo.modified` is `true` for the current buffer,
            -- display modified symbol before the buffer name.
            modified_symbol = "[+]", -- other modified symbol: "●"
        })
        -- accepts any border options that `nvim_open_win` accepts.
        -- see ":help vim.api.nvim_open_win"
        -- border = "none",
    end,
}
