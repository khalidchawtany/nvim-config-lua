return {
    "mcookly/bidi.nvim",

    keys = {
        { "<leader>bi", "<cmd>BidiEnable LR RL<cr>", desc = "BidiEnable" },
    },
    config = function()
        require("bidi").setup({
            create_user_commands = true, -- Generate user commands to enable and disable bidi-mode
            default_base_direction = "LR", -- Options: 'LR' and 'RL'
            intuitive_delete = true, -- Swap <DEL> and <BS> when using a keymap contra base direction
        }
        )
    end,
}

-- %!luaeval('require("bidi").buf_get_bidi_mode(vim.api.nvim_win_get_buf(0))')
--
-- -- For example (if ALL you want is the Bidi-Mode status)
-- vim.o.statusline = [[%!luaeval('require("bidi").buf_get_bidi_mode(vim.api.nvim_win_get_buf(0))')]]
