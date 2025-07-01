local Hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd

local hint = [[
                 _s_: launch OSV     _e_: stop
                 _a_: attach         _A_: attach to remote
   🭇🬭🬭🬭🬭🬭🬭🬭🬭🬼    _c_: continue       _t_: toggle_breakpoint
  🭉🭁🭠🭘    🭣🭕🭌🬾   _j_: step_over
  🭅█ ▁     █🭐   _l_: step_into      _h_: step_out
  ██🬿      🭊██   _u_: up             _d_: down
 🭋█🬝🮄🮄🮄🮄🮄🮄🮄🮄🬆█🭀
 🭤🭒🬺🬹🬱🬭🬭🬭🬭🬵🬹🬹🭝🭙  _o_: repl open      _r_: run last
                 _h_: hover          _w_: widget
                 _H_: hover var      _S_: scope

                 _f_: frames         _c_: commands
                 _b_: breakpoints
 ^
                 _<Enter>_: UI Toggle           _<Esc>_
]]

Hydra({
    name = "Telescope",
    hint = hint,
    config = {
        color = "teal",
        invoke_on_body = true,
        hint = {
            position = "middle",
            border = "rounded",
        },
    },
    mode = "n",
    body = "<leader>dd",
    heads = {
        { "s",       cmd([[:lua require"osv".launch({port = 8086})<CR>]]),                     { desc = "DAP Launch" } },
        { "e",       cmd([[:lua require"dap".stop()<CR>]]),                                    { desc = "DAP Stop" } },
        { "a",       cmd([[:lua require"debugHelper".attach()<CR>]]),                          { desc = "DAP attach" } },
        { "A",       cmd([[:lua require"debugHelper".attachToRemote()<CR>]]),                  { desc = "DAP attach remote" } },
        { "c",       cmd([[:lua require"dap".continue()<CR>]]),                                { desc = "DAP continue" } },
        { "t",       cmd([[:lua require"dap".toggle_breakpoint()<CR>]]),                       { desc = "DAP toggle breakpoint" } },
        { "j",       cmd([[:lua require"dap".step_over()<CR>]]),                               { desc = "DAP step over" } },
        { "l",       cmd([[:lua require"dap".step_into()<CR>]]),                               { desc = "DAP step into" } },
        { "h",       cmd([[:lua require"dap".step_out()<CR>]]),                                { desc = "DAP step out" } },
        { "u",       cmd([[:lua require"dap".up()<CR>]]),                                      { desc = "DAP up" } },
        { "d",       cmd([[:lua require"dap".down()<CR>]]),                                    { desc = "DAP down" } },
        { "o",       cmd([[:lua require"dap".repl.open()<CR>]]),                               { desc = "DAP repl open" } },
        { "r",       cmd([[:lua require"dap".run_last()<CR>]]),                                { desc = "DAP run last" } },
        { "h",       cmd([[:lua require"dap.ui.widgets".hover()<CR>]]),                        { desc = "DAP hover" } },
        { "w",       cmd([[:lua require"dap.ui.widgets".centered_float(widgets.scopes)<CR>]]), { desc = "DAP widget" } },
        { "H",       cmd([[:lua require"dap.ui.variables".hover()<CR>]]),                      { desc = "DAP vars hover" } },
        { "S",       cmd([[:lua require"dap.ui.variables".scopes()<CR>]]),                     { desc = "DAP vars scopes" } },
        { "f",       cmd([[:Telescope dap frames<CR>]]),                                       { desc = "DAP frames" } },
        { "c",       cmd([[:Telescope dap commands<CR>]]),                                     { desc = "DAP commands" } },
        { "b",       cmd([[:Telescope dap list_breakpoints<CR>]]),                             { desc = "DAP breakpoints" } },
        { "<Enter>", cmd([[:lua require("dapui").toggle()<CR>]]),                              { exit = true, desc = "DAP UI toggle" } },
        { "<Esc>",   nil,                                                                      { exit = true, nowait = true } },
    },
})
