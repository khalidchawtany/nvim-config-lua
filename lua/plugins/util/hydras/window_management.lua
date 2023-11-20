local Hydra = require("hydra")

local window_hint = [[
                   Move            Size               Split
              -------------    -----------       ---------------
      _k_          _K_           _<C-k>_       _s_: horizontally
  _h_     _l_  _H_     _L_   _<C-h>_ _<C-l>_   _v_: vertically
      _j_          _J_           _<C-j>_       _q_, _c_: close
  focus        window         _=_: equalize    _z_: maximize
                                               _o_: remain only
  _b_: choose buffer
]]

Hydra({
    name = "Change / Resize Window",
    hint = window_hint,
    config = {
        -- color = "pink",
        hint = {
            position = "middle",
            border = "rounded",
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
        { "z",     "<C-w>c" },

        -- only
        { "o",     "<C-w>o" },

        -- move to tab
        { "t",     "<C-w>t" },

        -- equalize window sizes
        { "e",     "<C-w>=" },
        { "=",     "<C-w>=" },

        -- close active window
        { "Q",     ":q<cr>" },
        { "<C-q>", ":q<cr>" },

        { "b",     ":Telescope buffers<cr>", { exit = true, nowait = true } },

        -- exit this Hydra
        { "q",     nil,      { exit = true, nowait = true } },
        { ";",     nil,      { exit = true, nowait = true } },
        { "<Esc>", nil,      { exit = true, nowait = true } },
    },
})
