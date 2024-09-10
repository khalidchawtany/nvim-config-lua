return {
    "KaitlynEthylia/TreePin",
    cmd = {
        "TPPin",
        "TPRoot",
        "TPGrow",
        "TPShrink",
        "TPClear",
        "TPGo",
        "TPShow",
        "TPHide",
        "TPToggle",
    },
    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = {
        { "<leader>tpp",    "<cmd>TPPin<CR>",    desc = "TreePin Pin" },
        { "<leader>tpc",    "<cmd>TPClear<CR>",  desc = "TreePin Clear" },
        { "<leader>tp<bs>", "<cmd>TPClear<CR>",  desc = "TreePin Clear" },
        { "<leader>tpt",    "<cmd>TPToggle<CR>", desc = "TreePin Toggle" },
        { "<leader>tpr",    "<cmd>TPRoot<CR>",   desc = "TreePin Root" },
        { "<leader>tp<cr>", "<cmd>TPRoot<CR>",   desc = "TreePin Root" },
        { "<leader>tp=",    "<cmd>TPGrow<CR>",   desc = "TreePin Grow" },
        { "<leader>tp-",    "<cmd>TPShrink<CR>", desc = "TreePin Shrink" },
        {
            "<leader>tpg",
            function()
                vim.cmd("normal! m'")
                vim.cmd("TPGo")
            end,
            desc = "TreePin Go",
        },
        { "<leader>tps", "<cmd>TPShow<CR>", desc = "TreePin Show" },
        { "<leader>tph", "<cmd>TPHide<CR>", desc = "TreePin Hide" },
    },
    init = function()
        local wk = require("which-key")
        wk.add({
            { "<leader>tp", group = "TreePin" },
        })
    end,
    config = function()
        require("treepin").setup({
            hide_onscreen = true, -- Hide's the pin buffer when the text of the pin is visible.
            max_height = 30, -- Prevents the pin buffer from displaying when the pin is larger than x lines.
            position = "relative", -- May be 'relative', 'top', or 'bottom'. Determines the position of the pin buffer within the window.
            icon = ">>",   -- The icon to display in the sign column at the top of the pin. Set to nil to prevent the sign column being used.
            zindex = 50,  -- The Z-index of the pin buffer.
            seperator = nil, -- A single character that may be used as a seperator between the editing buffer and the pin buffer.
        })
    end,
}
