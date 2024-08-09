local M = {
    "folke/which-key.nvim",
}

M.config = function()
    require("which-key").setup({})

    local wk = require("which-key")
    -- As an example, we will the following mappings:
    --  1. <leader>fn new file
    --  2. <leader>fr show recent files
    --  2. <leader>ff find files
    --
    wk.add({

        { "<leader>f",  group = "file" }, -- group
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
        {
            "<leader>fb",
            function()
                print("hello")
            end,
            desc = "Foobar",
        },
        { "<leader>fn", desc = "New File" },
        { "<leader>f1", hidden = true },               -- hide this keymap
        { "<leader>w",  proxy = "<c-w>",  group = "windows" }, -- proxy to window mappings
        {
            "<leader>b",
            group = "buffers",
            expand = function()
                return require("which-key.extras").expand.buf()
            end,
        },
        {
            -- Nested mappings are allowed and can be added in any order
            -- Most attributes can be inherited or overridden on any level
            -- There's no limit to the depth of nesting
            mode = { "n", "v" },                 -- NORMAL and VISUAL mode
            { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
            { "<leader>w", "<cmd>w<cr>", desc = "Write" },
        },
    })

    wk.add({ "<D-p>", group = "fzf-lua" })
    wk.add({ "<C-p>", group = "fzf" })
    wk.add({ "<C-s>", group = "telescope" })
end

return M
