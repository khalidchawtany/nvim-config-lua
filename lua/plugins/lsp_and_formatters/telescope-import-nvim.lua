return {
    "piersolenski/telescope-import.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    ft = { "lua", "javascript", "python", "typescript", "php" },
    config = function()
        vim.keymap.set(
            "n",
            "<leader>ci",
            ":lua require('telescope').extensions.import.import()<CR>",
            { noremap = true, silent = true, desc = "Telescope Import" }
        )
        require("telescope").load_extension("import")
        require("telescope").setup({
            extensions = {
                import = {
                    -- Add imports to the top of the file keeping the cursor in place
                    insert_at_top = true,
                },
                -- Support additional languages
                custom_languages = {
                    {
                        -- The regex pattern for the import statement
                        regex = [[^(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
                        -- The Vim filetypes
                        filetypes = { "typescript", "typescriptreact", "javascript", "react" },
                        -- The filetypes that ripgrep supports (find these via `rg --type-list`)
                        extensions = { "js", "ts" },
                    },
                },
            },
        })
    end,
}
