return {
    "tzachar/highlight-undo.nvim",
    enabled = true,
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
