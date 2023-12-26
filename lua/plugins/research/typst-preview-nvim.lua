return {
    "chomosuke/typst-preview.nvim",
    -- lazy = true, -- or ft = 'typst'
    ft = "typst",
    version = "0.1.*",
    cmd = { "TypstPreview" },
    build = function()
        require("typst-preview").update()
    end,
    config = function()
        require("typst-preview").setup({
            -- Setting this true will enable printing debug information with print()
            debug = false,

            -- This function will be called to determine the root of the typst project
            get_root = function(bufnr_of_typst_buffer)
                return vim.fn.getcwd()

                -- return vim.fn.expand("%:p")
            end,
        })
    end,
}
