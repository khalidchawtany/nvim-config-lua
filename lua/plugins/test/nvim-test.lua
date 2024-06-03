return {
    "klen/nvim-test",
    cmd = {
        "TestSuite",
        "TestFile",
        "TestEdit",
        "TestNearest",
        "TestLast",
        "TestVisit",
        "TestInfo",
    },
    keys = {
        { "<leader>trs" , "<cmd>silent! TestSuite<cr>"   , mode={ "n" } , { desc="Test Suite"  , silent=true }} ,
        { "<leader>trf" , "<cmd>silent! TestFile<cr>"    , mode={ "n" } , { desc="Test File"   , silent=true }} ,
        { "<leader>tre" , "<cmd>silent! TestEdit<cr>"    , mode={ "n" } , { desc="Test Edit"   , silent=true }} ,
        { "<leader>trn" , "<cmd>silent! TestNearest<cr>" , mode={ "n" } , { desc="Test Nearest", silent=true }} ,
        { "<leader>trl" , "<cmd>silent! TestLast<cr>"    , mode={ "n" } , { desc="Test Last"   , silent=true }} ,
        { "<leader>trv" , "<cmd>silent! TestVisit<cr>"   , mode={ "n" } , { desc="Test Visit"  , silent=true }} ,
        { "<leader>tri" , "<cmd>silent! TestInfo<cr>"    , mode={ "n" } , { desc="Test Info"   , silent=true }} ,
        { "t<C-s>"      , "<cmd>silent! TestSuite<cr>"   , mode={ "n" } , { desc="Test Suite"  , silent=true }} ,
        { "t<C-f>"      , "<cmd>silent! TestFile<cr>"    , mode={ "n" } , { desc="Test File"   , silent=true }} ,
        { "t<C-e>"      , "<cmd>silent! TestEdit<cr>"    , mode={ "n" } , { desc="Test Edit"   , silent=true }} ,
        { "t<C-n>"      , "<cmd>silent! TestNearest<cr>" , mode={ "n" } , { desc="Test Nearest", silent=true }} ,
        { "t<C-l>"      , "<cmd>silent! TestLast<cr>"    , mode={ "n" } , { desc="Test Last"   , silent=true }} ,
        { "t<C-t>"      , "<cmd>silent! TestLast<cr>"    , mode={ "n" } , { desc="Test Last"   , silent=true }} ,
        { "t<C-v>"      , "<cmd>silent! TestVisit<cr>"   , mode={ "n" } , { desc="Test Visit"  , silent=true }} ,
        { "t<C-i>"      , "<cmd>silent! TestInfo<cr>"    , mode={ "n" } , { desc="Test Info"   , silent=true }} ,
    },
    config = function()
        require("nvim-test").setup({
            run = true,                 -- run tests (using for debug)
            commands_create = true,     -- create commands (TestFile, TestLast, ...)
            filename_modifier = ":.",   -- modify filenames before tests run(:h filename-modifiers)
            silent = false,             -- less notifications
            term = "terminal",          -- a terminal to run ("terminal"|"toggleterm")
            termOpts = {
                direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
                width = 96,             -- terminal's width (for vertical|float)
                height = 24,            -- terminal's height (for horizontal|float)
                go_back = false,        -- return focus to original window after executing
                stopinsert = false,    -- exit from insert mode (true|false|"auto")
                keep_one = true,        -- keep only one terminal for testing
            },
            runners = {                 -- setup tests runners
                cs = "nvim-test.runners.dotnet",
                go = "nvim-test.runners.go-test",
                haskell = "nvim-test.runners.hspec",
                javascriptreact = "nvim-test.runners.jest",
                javascript = "nvim-test.runners.jest",
                lua = "nvim-test.runners.busted",
                python = "nvim-test.runners.pytest",
                ruby = "nvim-test.runners.rspec",
                rust = "nvim-test.runners.cargo-test",
                typescript = "nvim-test.runners.jest",
                typescriptreact = "nvim-test.runners.jest",
                php = "user.nvim_test_runners.php",
            },
        })
    end,
}
