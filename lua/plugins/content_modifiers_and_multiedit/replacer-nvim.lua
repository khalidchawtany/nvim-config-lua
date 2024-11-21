return {
    "gabrielpoca/replacer.nvim",
    keys = {
        { "<leader>rR", ':lua require("replacer").run()<cr>',                         desc = "Replacer (QF-Rename)" },
        { "<leader>rr", ':lua require("replacer").run({ rename_files = false })<cr>', desc = "Replacer (No-Rename)" },
    },
}
