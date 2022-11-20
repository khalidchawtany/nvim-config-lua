local M = {
    module = "ssr",
}

M.init = function()
    vim.keymap.set({ "n", "x" }, "<leader>sr", function() require("ssr").open() end)
end

M.config = function()
    require("ssr").setup {
        min_width = 50,
        min_height = 5,
        keymaps = {
            close = "q",
            next_match = "n",
            prev_match = "N",
            replace_all = "<leader><cr>",
        },
    }
end

return M
