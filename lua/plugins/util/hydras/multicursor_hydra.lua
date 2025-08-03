local Hydra = require("hydra")

local window_hint = [[
 Add/Skip Line
 --------------
 _j_: Add ↓
 _k_: Add ↑
 _J_: Skip ↓
 _K_: Skip ↑


 Add/Skip Match
 --------------
 _n_: Add ↓
 _N_: Skip ↓
 _p_: Add ↑
 _P_: Skip ↑


 Other
 -------------
 _/_: Add Search
 _*_: Add All
 _c_: Clear All
 _a_: Add Op
 _<BS>_: quit
]]

local mc = function(functionName, args)
    return function()
        require("multicursor-nvim")[functionName](args)
    end
end

Hydra({
    name = "Multi Cursor",
    hint = window_hint,
    config = {
        color = "pink",
        invoke_on_body = true,
        hint = {
            position = "bottom-right",
            float_opts = {
                -- row, col, height, width, relative, and anchor should not be overridden
                -- style = "minimal",
                -- border = 'rounded',
                focusable = false,
                noautocmd = true,
                title = "Multi Cursor",
                title_pos = "center",
            },
        },
    },
    mode = { "n", "v" },
    body = "cm",
    heads = {
        -- add/skip cursor
        { "j",    mc('lineAddCursor', 1),         { nowait = true, mode = { "n", "v" } } },
        { "k",    mc('lineAddCursor', -1),        { nowait = true, mode = { "n", "v" } } },
        { "J",    mc('lineSkipCursor', 1),        { nowait = true, mode = { "n", "v" } } },
        { "K",    mc('lineSkipCursor', -1),       { nowait = true, mode = { "n", "v" } } },
        { "o",    mc('lineAddCursor', 0),         { nowait = true, mode = { "n", "v" } } },

        { "n",    mc('matchAddCursor', 1),        { nowait = true, mode = { "n", "v" } } },
        { "p",    mc('matchAddCursor', -1),       { nowait = true, mode = { "n", "v" } } },
        { "N",    mc('matchSkipCursor', 1),       { nowait = true, mode = { "n", "v" } } },
        { "P",    mc('matchSkipCursor', -1),      { nowait = true, mode = { "n", "v" } } },

        { "/",    mc('searchAllAddCursors', nil), { nowait = true, mode = { "n" } } },
        { "a",    mc('addCursorOperator', nil),   { nowait = true, mode = { "n" } } },

        { "*",    mc('addCursor', "*"),           { nowait = true, mode = { "n", "v" } } },
        { "c",    mc('clearCursors', nil),        { nowait = true, mode = { "n", "v" }, exit = true } },

        -- exit this Hydra
        { "<BS>", nil,                            { exit = true, nowait = true } },
        -- { "q",     nil,                            { exit = true, nowait = true } },
        -- { ";",     nil,                            { exit = true, nowait = true } },
        -- { "<Esc>", nil,                            { exit = true, nowait = true } },
    },
})
