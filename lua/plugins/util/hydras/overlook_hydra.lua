local Hydra = require("hydra")

local window_hint = [[
 Overlook Peek
 --------------
 _d_: Definition
 _c_: Cursor
 _m_: Mark
 _u_: Restore Popup
 _U_: Restore All Popups
 _x_: Close
 _f_: Switch Focus
 _s_: Open in Split
 _v_: Open in VSplit
 _t_: Open in Tab
 _o_: Open in Window

 _<BS>_: quit
]]

local pk = function(functionName, args)
    return function()
        require("overlook.api")[functionName](args)
    end
end

Hydra({
    name = "Overlook Peek",
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
                title = "Overlook Peek",
                title_pos = "center",
            },
        },
    },
    mode = { "n" },
    body = "gk",
    heads = {
        { "d",    pk('peek_definition', nil),         { nowait = true, mode = { "n" } } },
        { "c",    pk('peek_cursor', nil),             { nowait = true, mode = { "n" } } },
        { "m",    pk('peek_mark', nil),               { nowait = true, mode = { "n" } } },
        { "u",    pk('restore_popup', nil),           { nowait = true, mode = { "n" } } },
        { "U",    pk('restore_all_popups', nil),      { nowait = true, mode = { "n" } } },
        { "x",    pk('close_all', nil),               { nowait = true, mode = { "n" }, exit = true } },
        { "f",    pk('switch_focus', nil),            { nowait = true, mode = { "n" } } },
        { "s",    pk('open_in_split', nil),           { nowait = true, mode = { "n" }, exit = true } },
        { "v",    pk('open_in_vsplit', nil),          { nowait = true, mode = { "n" }, exit = true } },
        { "t",    pk('open_in_tab', nil),             { nowait = true, mode = { "n" }, exit = true } },
        { "o",    pk('open_in_original_window', nil), { nowait = true, mode = { "n" }, exit = true } },


        -- exit this Hydra
        { "<BS>", nil,                                { exit = true, nowait = true } },
    },
})
