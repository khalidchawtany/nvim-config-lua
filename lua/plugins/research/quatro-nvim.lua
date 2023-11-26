return {
    "quarto-dev/quarto-nvim",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
        "jmbuhr/otter.nvim",
    },
    cmd = {
        "QuartoPreview",
        "QuartoClosePreview",
        "QuartoHelp",
        "QuartoActivate",
        "QuartoDiagnostics",
        "QuartoHover",
        "QuartoSend",
        "QuartoSendAbove",
        "QuartoSendBelow",
        "QuartoSendAll",
        "QuartoSendLine",
    },
    keys = {
        {
            "<leader>qp",
            function()
                require("quarto").quartoPreview()
            end,
            desc = "Quarto Preview",
        },
        {
            "<leader>qrc",
            function()
                require("quarto").run_cell()
            end,
            desc = "Quarto Run Cell",
        },
        {
            "<leader>qrk",
            function()
                require("quarto").run_above()
            end,
            desc = "Quarto Run Above",
        },
        {
            "<leader>qra",
            function()
                require("quarto").run_all()
            end,
            desc = "Quarto Run All",
        },
        {
            "<leader>qrA",
            function()
                require("quarto").run_all(true)
            end,
            desc = "Quarto Run All (All languages)",
        },
        {
            "<leader>qrl",
            function()
                require("quarto").run_line()
            end,
            desc = "Quarto Run Line",
        },
        {
            "<leader>qrr",
            function()
                require("quarto").run_range()
            end,
            desc = "Quarto Run Range",
            mode={ "v" },
        },
    },

    ft = { "qmd" },

    config = function()
        require("quarto").setup({
            debug = false,
            closePreviewOnExit = true,
            lspFeatures = {
                enabled = true,
                languages = { "r", "python", "julia", "bash" },
                chunks = "curly", -- 'curly' or 'all'
                diagnostics = {
                    enabled = true,
                    triggers = { "BufWritePost" },
                },
                codeRunner = {
                    enabled = false,
                    default_method = nil, -- 'molten' or 'slime'
                    ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
                    -- Takes precedence over `default_method`
                    never_run = { "yaml" }, -- filetypes which are never sent to a code runner
                },
                completion = {
                    enabled = true,
                },
            },
            keymap = {
                hover = "K",
                definition = "gd",
                rename = "<leader>lR",
                references = "gr",
            },
        })
    end,
}
