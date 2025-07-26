local Hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd

local hint = [[
_m_: Select Master     _c_: Selct Current
_k_: Swap Up           _j_: Swap Down
_h_: Hold Or Swap
 ^
_<Esc>_                 _q_: Quit
]]

Hydra({
    name = "TreeSitter",
    hint = hint,
    config = {
        color = "red",
        invoke_on_body = true,
        -- foreign_keys =nil ,
        hint = {
            -- position = "middle",
            float_opts = {
                -- row, col, height, width, relative, and anchor should not be
                -- overridden
                -- style = "minimal",
                border = 'rounded',
                focusable = false,
                noautocmd = true,
                title = "TreeSitter",
                title_pos = "center",
            },
        },
    },
    mode = "n",
    body = "<localleader>s",
    heads = {
        { "m", [[<cmd>STSSelectMasterNode<cr>]],  { desc = "TS Select Master", exit_before = true } },
        { "c", [[<cmd>STSSelectCurrentNode<cr>]], { desc = "TS Select Master", exit_before = true } },

        { "k", function()
            vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot"
            return "g@l"
        end, { desc = "TS Swap Up", expr = true, exit = false } },
        { "j", function()
            vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot"
            return "g@l"
        end, { desc = "TS Swap Down", expr = true, exit = false }, },

        { "h",     [[<cmd>STSSwapOrHoldVisual<cr>]], { desc = "TS Swap or Hold", mode = "n", } },
        { "h",     [[<cmd>STSSwapOrHoldVisual<cr>]], { desc = "TS Swap or Hold", mode = "x", } },

        { "<Esc>", nil,                              { exit = true, nowait = true } },
        { "q",     nil,                              { exit = true, nowait = true } },
    },
})
