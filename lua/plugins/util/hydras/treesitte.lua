local Hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd

local hint = [[
_sm_: Select Master     _sc_: Selct Current
_sk_: Swap Up           _sj_: Swap Down
_hh_: Hold Or Swap
 ^
_<Esc>_                 _q_: Quit
]]

Hydra({
    name = "TreeSitter",
    hint = hint,
    config = {
        color = "blue",
        invoke_on_body = true,
        hint = { type = "cmdline", },
    },
    mode = "n",
    body = "<localleader>s",
    heads = {
        { "sm", [[<cmd>STSSelectMasterNode<cr>]],  { desc = "TS Select Master", exit_before = true } },
        { "sc", [[<cmd>STSSelectCurrentNode<cr>]], { desc = "TS Select Master", exit_before = true } },

        { "sk", function() vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot" return "g@l" end, { desc = "TS Swap Up", expr = true, exit = false } },
        { "sj", function() vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot" return "g@l" end, { desc = "TS Swap Down", expr = true, exit = false }, },

        { "hh", [[<cmd>STSSwapOrHoldVisual<cr>]], { desc = "TS Swap or Hold", mode = "n", } },
        { "hh", [[<cmd>STSSwapOrHoldVisual<cr>]], { desc = "TS Swap or Hold", mode = "x", } },

        { "<Esc>", nil,                                   { exit = true, nowait = true } },
        { "q",     nil,                                   { exit = true, nowait = true } },
    },
})
