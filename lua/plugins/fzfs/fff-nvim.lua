return {
    "dmtrKovalenko/fff.nvim",
    build = "cargo build --release",
    opts = {
        -- pass here all the options
        -- UI dimensions and appearance
        width = 0.8, -- Window width as fraction of screen
        height = 0.8, -- Window height as fraction of screen
        preview_width = 0.5, -- Preview pane width as fraction of picker
        prompt = '🪿 ', -- Input prompt symbol
        title = 'FFF Files', -- Window title
        max_results = 60, -- Maximum search results to display
        max_threads = 4, -- Maximum threads for fuzzy search

        -- Key mappings (supports both single keys and arrays for multiple bindings)
        keymaps = {
            close = { '<Esc>', '<C-c>' },
            select = '<CR>',
            select_split = '<C-s>',
            select_vsplit = '<C-v>',
            select_tab = '<C-t>',
            move_up = { '<Up>', '<C-p>' },     -- Multiple bindings supported
            move_down = { '<Down>', '<C-n>' }, -- Multiple bindings supported
            preview_scroll_up = '<C-u>',
            preview_scroll_down = '<C-d>',
        },

        -- Highlight groups
        hl = {
            border = 'FloatBorder',
            normal = 'Normal',
            cursor = 'CursorLine',
            matched = 'IncSearch',
            title = 'Title',
            prompt = 'Question',
            active_file = 'Visual',
            frecency = 'Number',
            debug = 'Comment',
        },

        -- Debug options
        debug = {
            show_scores = false, -- Toggle with F2 or :FFFDebug
        },
    },
    keys = {
        {
            "-p", -- try it if you didn't it is a banger keybinding for a picker
            function()
                -- require("fff").toggle()
                local cwd = vim.fn.getcwd()
                require('fff.main').find_files_in_dir(cwd)
            end,
            desc = "Toggle FFF",
        },
    },
}
