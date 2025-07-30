return {
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup({
            plugins = {
                marks = true,     -- shows a list of your marks on ' and `
                registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                -- No actual key bindings are created
                spelling = {
                    enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                    suggestions = 20, -- how many suggestions should be shown in the list?
                },
                presets = {
                    operators = true,    -- adds help for operators like d, y, ...
                    motions = true,      -- adds help for motions
                    text_objects = true, -- help for text objects triggered after entering an operator
                    windows = false,     -- default bindings on <c-w>
                    nav = true,          -- misc bindings to work with windows
                    z = true,            -- bindings for folds, spelling and others prefixed with z
                    g = true,            -- bindings for prefixed with g
                },
            },
        })

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
            { "<leader>f1", hidden = true }, -- hide this keymap

            { "<c-w>",      hidden = true }, -- proxy to window mappings
            -- { "<leader>w",  proxy = "<c-w>",  group = "windows" }, -- proxy to window mappings
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
                mode = { "n", "v" },                          -- NORMAL and VISUAL mode
                { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
                -- { "<leader>w", "<cmd>w<cr>", desc = "Write" },
            },
        })

        wk.add({ "s", group = "Seek | Swap" })
        vim.keymap.set("n", "s",
            function()
                require("which-key").show({
                    keys = "s",
                    loop = true, -- this will keep the popup open until you hit <esc>
                })
            end
            , { noremap = true, silent = true, desc = "WK: Seek | Swap" })
        wk.add({ "<D-p>", group = "fzf-lua" })
        wk.add({ "<C-p>", group = "fzf" })
        wk.add({ "<C-s>", group = "telescope" })
        wk.add({ "<leader>p", group = "Snacks Picker" })
    end

}
