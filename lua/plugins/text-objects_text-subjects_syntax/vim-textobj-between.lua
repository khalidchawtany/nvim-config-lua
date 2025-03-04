return {
    "thinca/vim-textobj-between",
    dependencies = { "kana/vim-textobj-user" },

    keys = {
        { "is", "<Plug>(textobj-between-i)", desc = "TxetObj (Between-i)", mode = { "v", "o" } },
        { "as", "<Plug>(textobj-between-a)", desc = "TxetObj (Between-a)", mode = { "v", "o" } },
    },
    inti = function()
        vim.g.textobj_between_no_default_key_mappings = true
    end,
}
