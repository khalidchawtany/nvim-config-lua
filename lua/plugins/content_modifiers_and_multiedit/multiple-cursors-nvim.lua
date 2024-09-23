return {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*", -- Use the latest tagged version
    opts = {
        pre_hook = function()
            require("cmp").setup({enabled=false})
        end,
        post_hook = function()
            require("cmp").setup({enabled=true})
        end,
        custom_key_maps = {
            {"n", "<Leader>|", function() require("multiple-cursors").align() end},
        },

    },  -- This causes the plugin setup function to be called
    keys = {
        { "<M-j>",         "<Cmd>MultipleCursorsAddDown<CR>"          , mode = { "n" , "x" }      , desc = "Add cursor and move down"},
        { "<M-k>",         "<Cmd>MultipleCursorsAddUp<CR>"            , mode = { "n" , "x" }      , desc = "Add cursor and move up"},

        { "<M-n>",         "<Cmd>MultipleCursorsAddJumpNextMatch<CR>" , mode = { "n" , "x" }      , desc = "Add cursor and jump to next cword"},
        { "<M-l>",         "<Cmd>MultipleCursorsJumpNextMatch<CR>"    , mode = { "n" , "x" }      , desc = "Jump to next cword"},
        { "<M-p>",         "<Cmd>MultipleCursorsJumpPrevMatch<CR>"    , mode = { "n" , "x" }      , desc = "Jump to prev cword"},

        { "<C-Up>",        "<Cmd>MultipleCursorsAddUp<CR>"            , mode = { "n" , "i", "x" } , desc = "Add cursor and move up"},
        { "<C-Down>",      "<Cmd>MultipleCursorsAddDown<CR>"          , mode = { "n" , "i", "x" } , desc = "Add cursor and move down"} ,

        { "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>"   , mode = { "n" , "i" }      , desc = "Add or remove cursor"},

        { "<Leader>ma",    "<Cmd>MultipleCursorsAddMatches<CR>"       , mode = { "n" , "x" }      , desc = "Add cursors to cword"},
        { "<Leader>mA",    "<Cmd>MultipleCursorsAddMatchesV<CR>"      , mode = { "n" , "x" }      , desc = "Add cursors to cword in previous area"},

        { "<Leader>md",    "<Cmd>MultipleCursorsAddJumpNextMatch<CR>" , mode = { "n" , "x" }      , desc = "Add cursor and jump to next cword"},
        { "<Leader>mD",    "<Cmd>MultipleCursorsJumpNextMatch<CR>"    , mode = { "n" , "x" }      , desc = "Jump to next cword" },
        { "<Leader>ml",    "<Cmd>MultipleCursorsLock<CR>"             , mode = { "n" , "x" }      , desc = "Lock virtual cursors" },
    }
}
