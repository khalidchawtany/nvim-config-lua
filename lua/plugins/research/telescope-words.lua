return {
    "archie-judd/telescope-words.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    keys = {
        {
            "<c-s><c-s>s",
            function()
                require("telescope").extensions.telescope_words.search_dictionary()
            end,
            mode = { "n" },
            desc = "Telescope: search dictionar",
        },
        {
            "<c-s><c-s>t",
            function()
                require("telescope").extensions.telescope_words.search_thesaurus()
            end,
            mode = { "n" },
            desc = "Telescope: search thesaurus",
        },

        {
            "<c-s>ss",
            function()
                require("telescope").extensions.telescope_words.search_dictionary_for_word_under_cursor()
            end,
            mode = { "n" },
            desc = "Telescope: search dictionar CWORD",
        },
        {
            "<c-s>st",
            function()
                require("telescope").extensions.telescope_words.search_thesaurus_for_word_under_cursor()
            end,
            mode = { "n" },
            desc = "Telescope: search thesaurus CWORD",
        },
    },
}
