return {
    "kristijanhusak/orgmode.nvim",
    ft = { "org" },

    init = function()
    end,

    config = function()
        -- require("orgmode").setup_ts_grammar()
        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.org = {
            install_info = {
                url = "https://github.com/milisims/tree-sitter-org",
                revision = "main",
                files = { "src/parser.c", "src/scanner.cc" }
            },
            filetype = "org"
        }
        require("orgmode").setup {}
    end
}
