local Hydra = require("hydra")

local window_hint = [[
               Move          Size             Split                 other
            ---------      ---------     ----------------      ----------------
   _k_            _K_           _<C-k>_          _s_: horizontally     _c_: close window
_h_     _l_      _H_     _L_     _<C-h>_ _<C-l>_       _v_: vertically       _q_, _;_, _<Esc>_: close
   _j_            _J_           _<C-j>_           _o_: remain only
            _t_: to tab     _e_, _=_: equalize   
]]

Hydra({
    name = "Change / Resize Window",
    hint = window_hint,
    config = {
        color = "pink",
        invoke_on_body = true,
        hint = {
            position = "middle",
            float_opts = {
                -- row, col, height, width, relative, and anchor should not be overridden
                -- style = "minimal",
                border = 'rounded',
                focusable = false,
                noautocmd = true,
                title = "Window Management",
                title_pos = "center",
            },
        },
    },
    mode = { "n" },
    body = "<C-w>",
    heads = {
        -- focus windows
        { "h",     "<C-w>h" },
        { "j",     "<C-w>j" },
        { "k",     "<C-w>k" },
        { "l",     "<C-w>l" },

        -- move windows
        { "H",     "<C-w>H" },
        { "J",     "<C-w>J" },
        { "K",     "<C-w>K" },
        { "L",     "<C-w>L" },

        -- resizing window
        { "<C-h>", "<C-w>3<" },
        { "<C-l>", "<C-w>3>" },
        { "<C-k>", "<C-w>2+" },
        { "<C-j>", "<C-w>2-" },

        -- splits
        { "s",     "<C-w>s" },
        { "v",     "<C-w>v" },
        { "c",     "<C-w>c" },
        -- { "z",     "<C-w>c" },

        -- only
        { "o",     "<C-w>o", { nowait = true, exit = true } },

        -- move to tab
        { "t",     "<C-w>T", { nowait = true, exit = true } },

        -- equalize window sizes
        { "e",     "<C-w>=" },
        { "=",     "<C-w>=" },

        -- exit this Hydra
        { "q",     nil,      { exit = true, nowait = true } },
        { ";",     nil,      { exit = true, nowait = true } },
        { "<Esc>", nil,      { exit = true, nowait = true } },
    },
})
