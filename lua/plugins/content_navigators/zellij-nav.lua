-- Seamless vim <-> zellij pane navigation; pairs with the
-- vim-zellij-navigator zellij plugin (~/.config/zellij/config.kdl).
return {
    "swaits/zellij-nav.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
        { "<c-h>", "<cmd>ZellijNavigateLeft<cr>",  silent = true, desc = "navigate left (zellij aware)" },
        { "<c-j>", "<cmd>ZellijNavigateDown<cr>",  silent = true, desc = "navigate down (zellij aware)" },
        { "<c-k>", "<cmd>ZellijNavigateUp<cr>",    silent = true, desc = "navigate up (zellij aware)" },
        { "<c-l>", "<cmd>ZellijNavigateRight<cr>", silent = true, desc = "navigate right (zellij aware)" },
    },
    opts = {},
}
