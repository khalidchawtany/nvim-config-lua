return {
    "elihunter173/dirbuf.nvim",
    cmd = { "Dirbuf" },
    keys = {
        { "-d", "<cmd>Dirbuf<cr>",     desc = "Dirbuf" },
        { "-q", "<cmd>DirbufQuit<cr>", desc = "Dirbuf" },
    },
    config = function()
        require("dirbuf").setup({ hash_padding = 2, show_hidden = true })

        vim.api.nvim_create_autocmd({ "FileType" }, {
            pattern = "dirbuf",
            callback = function()
                vim.cmd([[nmap <silent><nowait><buffer> - <Plug>(dirbuf_up)]])
                vim.cmd([[nmap <silent><nowait><buffer> q <cmd>DirbufQuit<cr>]])
            end,
        })
    end,
}
