return {
    "khalidchawtany/vim-submode",

    init = function()
        vim.g.submode_timeout = false
    end,

    config = function()
        vim.cmd [[

            " Undo / Redo
            call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
            call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
            call submode#leave_with('undo/redo', 'n', '', '<Esc>')
            call submode#map('undo/redo', 'n', '', '-', 'g-')
            call submode#map('undo/redo', 'n', '', '+', 'g+')

            " TS
            call submode#enter_with('Select/Swap', 'n', '', 'gs')
            call submode#leave_with('Select/Swap', 'n', '', '<Esc>')
            call submode#map('Select/Swap', 'n', '', '<space>', 'gsc')
            call submode#map('Select/Swap', 'n', '', 'm', 'gsm')

            call submode#enter_with('Jump', 'n', '', 'gj')
            call submode#leave_with('Jump', 'n', '', '<Esc>')
            call submode#map('Jump', 'n', '', 'j', 'gjj')
            call submode#map('Jump', 'n', '', 'v', 'gjv')

       ]]
    end

}
