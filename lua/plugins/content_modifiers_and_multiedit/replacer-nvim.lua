return {
    "gabrielpoca/replacer.nvim",
    keys = {
        { "<leader>sR", ':lua require("replacer").run()<cr>',                          desc = "Replacer (QF-Rename)" },
        { "<leader>sr", ':lua require("replacer").run({ rename_files = false })<cr>', desc = "Replacer (No-Rename)" },
    },
}
