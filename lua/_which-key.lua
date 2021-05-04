require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}

local wk = require("which-key")
-- As an example, we will the following mappings:
--  1. <leader>fn new file
--  2. <leader>fr show recent files
--  2. <leader>ff find files
-- 
wk.register({
    f = {
        name = "file", -- optional group name
        f = {"<cmd>Telescope find_files<cr>", "Find File"}, -- create a binding with label
        -- r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
        n = {"New File"}, -- just a label. don't create any mapping
        e = "Edit File", -- same as above
        ["1"] = "which_key_ignore" -- special label to hide it in the popup
        -- b = {
        --     function()
        --         print("bar")
        --     end, "Foobar"
        -- } -- you can also pass functions!
    }
}, {prefix = "<leader>"})
