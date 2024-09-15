return {
    "elihunter173/dirbuf.nvim",
    cmd = { "Dirbuf" },
    event = "VimEnter",
    keys = {
        -- { "--", "<cmd>Dirbuf<cr>",     desc = "Dirbuf" },
        { "-d", "<cmd>Dirbuf<cr>",     desc = "Dirbuf" },
        { "-q", "<cmd>DirbufQuit<cr>", desc = "Dirbuf" },
    },
    config = function()
        require("dirbuf").setup({ hash_padding = 2, show_hidden = true })

        vim.api.nvim_create_autocmd({ "FileType" }, {
            pattern = "dirbuf",
            callback = function()
                vim.cmd([[
                    nmap <silent><nowait><buffer> - <Plug>(dirbuf_up)
                    nmap <silent><nowait><buffer> q <cmd>DirbufQuit<cr>
                    nmap <silent><nowait><buffer> <leader>W <cmd>DirbufSync<cr>
                    nmap <silent><nowait><buffer> <leader>w <cmd>DirbufSync -confirm<cr>
                    nmap <silent><nowait><buffer> <leader>p <cmd>DirbufSync -dry-run<cr>
               ]])
 
            end,
        })
    end,
}
