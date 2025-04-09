local ft = {
    "html",
    -- "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "svelte",
    "vue",
    "tsx",
    "jsx",
    "rescript",
    "xml",
    "php",
    "markdown",
    "astro",
    "glimmer",
    "handlebars",
    "hbs",
    "blade",
}
return {
    "windwp/nvim-ts-autotag",
    -- lazy = true,

    ft = ft,

    config = function()
        -- require("nvim-ts-autotag").setup()
        require("nvim-treesitter.configs").setup({
            autotag = {
                enable = true,
                enable_rename = true,
                enable_close = true,
                enable_close_on_slash = true,
                filetypes = ft,
            },
        })

        -- Enable update on insert
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
            virtual_text = {
                spacing = 5,
                severity_limit = "Warning",
            },
            update_in_insert = true,
        })
    end,
}
