local Hydra = require("hydra")

local hint = [[
 ^^Multi Cursor ^ ^
 ^
 _gj_: aDD ↓
 _gk_: aDD ↑
 _sj_: Skip ↓
 _sk_: Skip ↑
 ^
 ^
 _gn_: Add ↓
 _sn_: Skip ↓
 _gp_: Add ↑
 _sp_: Skip ↑
 ^
 ^
 _g/_: Add Search
 _g*_: Add All
 _gc_: Clear All
 _ga_: Add Op
 ^
 _<Esc>_,_q_, _<BS>_: quit
]]


local mc = function(functionName, args)
    return function()
        require("multicursor-nvim")[functionName](args)
    end
end
Hydra({
    name = "MC",
    hint = hint,
    config = {
        color = "red",
        invoke_on_body = true,
        hint = {
            position = "middle-right",
        },
    },
    mode = { "n", "x" },
    body = "<leader>cm",
    heads = {

        -- add/skip cursor
        { "gj",    mc('lineAddCursor', 1),         { nowait = true, mode = { "n", "v" } } },
        { "gk",    mc('lineAddCursor', -1),        { nowait = true, mode = { "n", "v" } } },
        { "sj",    mc('lineSkipCursor', 1),        { nowait = true, mode = { "n", "v" } } },
        { "sk",    mc('lineSkipCursor', -1),       { nowait = true, mode = { "n", "v" } } },

        { "gn",    mc('matchAddCursor', 1),        { nowait = true, mode = { "n", "v" } } },
        { "gp",    mc('matchAddCursor', -1),       { nowait = true, mode = { "n", "v" } } },
        { "sn",    mc('matchSkipCursor', 1),       { nowait = true, mode = { "n", "v" } } },
        { "sp",    mc('matchSkipCursor', -1),      { nowait = true, mode = { "n", "v" } } },

        { "g/",    mc('searchAllAddCursors', nil), { nowait = true, mode = { "n" } } },
        { "ga",    mc('addCursorOperator', nil),   { nowait = true, mode = { "n" } } },

        { "g*",    mc('addCursor', "*"),           { nowait = true, mode = { "n", "v" } } },
        { "gc",    mc('clearCursors', nil),        { nowait = true, mode = { "n", "v" }, exit = true } },

        { "<BS>",  nil,                            { exit = true, nowait = true } },
        { "q",     nil,                            { exit = true, nowait = true } },
        { "<Esc>", nil,                            { exit = true } },
    },
})
