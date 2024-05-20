vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "mysql",
    callback = function()
        require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
    end,
})


return {
    "tpope/vim-dadbod",
    ft = { "sql", "mysql" },
    dependencies = {
        "kristijanhusak/vim-dadbod-completion",
        "kristijanhusak/vim-dadbod-ui",
    },

    cmd = { "DB", "DBUI", "DBUIToggle" },
    config = function()
        -- vim.cmd([[ autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} }) ]])
    end,
}
