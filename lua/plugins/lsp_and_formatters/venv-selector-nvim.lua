return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim",
        -- "mfussenegger/nvim-dap-python"
    },
    cmd = {
        "VenvSelect",
    },
    opts = {
        -- Your options go here
        -- name = "venv",
        -- auto_refresh = false
    },
    -- event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
        {
            -- Keymap to open VenvSelector to pick a venv.
            "<c-s><c-v>",
            "<cmd>:VenvSelect<cr>",
            -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
            "<c-s>v",
            "<cmd>:VenvSelectCached<cr>",
        },
    },
}
