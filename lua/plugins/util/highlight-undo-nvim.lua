return {
    "tzachar/highlight-undo.nvim",
    enabled = false,
    config = function()
        require("highlight-undo").setup({
            keymaps = {
                Paste = {
                    disabled = true,
                },
            },
        })
    end,
}
