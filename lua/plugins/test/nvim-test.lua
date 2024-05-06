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
        { "<leader>trs" , "<cmd>TestSuite<cr>"   , mode={ "n" } , desc="Test Suite"    } ,
        { "<leader>trf" , "<cmd>TestFile<cr>"    , mode={ "n" } , desc="Test File"     } ,
        { "<leader>tre" , "<cmd>TestEdit<cr>"    , mode={ "n" } , desc="Test Edit"     } ,
        { "<leader>trn" , "<cmd>TestNearest<cr>" , mode={ "n" } , desc="Test Nearest"  } ,
        { "<leader>trl" , "<cmd>TestLast<cr>"    , mode={ "n" } , desc="Test Last"     } ,
        { "<leader>trv" , "<cmd>TestVisit<cr>"   , mode={ "n" } , desc="Test Visit"    } ,
        { "<leader>tri" , "<cmd>TestInfo<cr>"    , mode={ "n" } , desc="Test Info"     } ,
        { "t<C-s>"      , "<cmd>TestSuite<cr>"   , mode={ "n" } , desc="Test Suite"    } ,
        { "t<C-f>"      , "<cmd>TestFile<cr>"    , mode={ "n" } , desc="Test File"     } ,
        { "t<C-e>"      , "<cmd>TestEdit<cr>"    , mode={ "n" } , desc="Test Edit"     } ,
        { "t<C-n>"      , "<cmd>TestNearest<cr>" , mode={ "n" } , desc="Test Nearest"  } ,
        { "t<C-l>"      , "<cmd>TestLast<cr>"    , mode={ "n" } , desc="Test Last"     } ,
        { "t<C-t>"      , "<cmd>TestLast<cr>"    , mode={ "n" } , desc="Test Last"     } ,
        { "t<C-v>"      , "<cmd>TestVisit<cr>"   , mode={ "n" } , desc="Test Visit"    } ,
        { "t<C-i>"      , "<cmd>TestInfo<cr>"    , mode={ "n" } , desc="Test Info"     } ,
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
