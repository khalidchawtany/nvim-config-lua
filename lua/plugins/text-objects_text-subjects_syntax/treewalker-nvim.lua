return {
    'aaronik/treewalker.nvim',
    keys = {
        { '<D-k>',   '<cmd>Treewalker Up<cr>',        mode = { 'n', 'v' }, silent = true },
        { '<D-j>',   '<cmd>Treewalker Down<cr>',      mode = { 'n', 'v' }, silent = true },
        { '<D-h>',   '<cmd>Treewalker Left<cr>',      mode = { 'n', 'v' }, silent = true },
        { '<D-l>',  '<cmd>Treewalker Right<cr>',     mode = { 'n', 'v' }, silent = true },

        { 'gsu',  '<cmd>Treewalker SwapUp<cr>',    mode = { 'n', },     silent = true },
        { 'gsd',  '<cmd>Treewalker SwapDown<cr>',  mode = { 'n', },     silent = true },
        { 'gs;',  '<cmd>Treewalker SwapLeft<cr>',  mode = { 'n', },     silent = true },
        { 'gs\'', '<cmd>Treewalker SwapRight<cr>', mode = { 'n', },     silent = true },
    },

    -- The following options are the defaults.
    -- Treewalker aims for sane defaults, so these are each individually optional,
    -- and setup() does not need to be called, so the whole opts block is optional as well.
    opts = {
        -- Whether to briefly highlight the node after jumping to it
        highlight = true,

        -- How long should above highlight last (in ms)
        highlight_duration = 250,

        -- The color of the above highlight. Must be a valid vim highlight group.
        -- (see :h highlight-group for options)
        highlight_group = 'CursorLine',

        -- Whether the plugin adds movements to the jumplist -- true | false | 'left'
        --  true: All movements more than 1 line are added to the jumplist. This is the default,
        --        and is meant to cover most use cases. It's modeled on how { and } natively add
        --        to the jumplist.
        --  false: Treewalker does not add to the jumplist at all
        --  "left": Treewalker only adds :Treewalker Left to the jumplist. This is usually the most
        --          likely one to be confusing, so it has its own mode.
        jumplist = true,
    }
}
