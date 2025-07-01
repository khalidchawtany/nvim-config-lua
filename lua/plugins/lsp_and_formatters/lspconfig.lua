vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        -- Unset 'formatexpr'
        -- vim.bo[args.buf].formatexpr = nil
        -- Unset 'omnifunc'
        -- vim.bo[args.buf].omnifunc = nil
        -- Unmap K
        -- vim.keymap.del('n', 'K', { buffer = args.buf })

        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        local bufnr = args.buf

        -- local capabilities = vim.lsp.protocol.make_client_capabilities()


        if client:supports_method('textDocument/inlayHintProvider') then
            if vim.lsp.buf.inlay_hint then
                vim.lsp.buf.inlay_hint(bufnr, true)
            end
        end

        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end

        -- Enable completion triggered by <c-x><c-o>
        buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Mappings.
        local opts = { noremap = true, silent = true }

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        --?????????????????????????????????????????????????--
        buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
        buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
        buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        buf_set_keymap("n", "g<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
        buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
        buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
        buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
        buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        buf_set_keymap("n", "<space>dl", "<cmd>lua vim.diagnostic.open_float(0, {scope='line'}) <CR>", opts)
        buf_set_keymap("n", "<space>dc", "<cmd>lua vim.diagnostic.open_float(0, {scope='cursor'}) <CR>", opts)
        buf_set_keymap("n", "<space>df", "<cmd>lua vim.diagnostic.open_float(0, {}) <CR>", opts)

        buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
        buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
        buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.set_loclist()<CR>", opts)

        if client:supports_method('textDocument/formatting') then
            buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        elseif client:supports_method('textDocument/document_range_formatting') then
            buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
        end
    end,
})

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },

    -- example using `opts` for defining servers
    opts = {
        servers = {
            lua_ls = {},
        },
    },
    config = function(_, opts)
        local lspconfig = require("lspconfig")
        for server, config in pairs(opts.servers) do
            -- passing config.capabilities to blink.cmp merges with the capabilities in your
            -- `opts[server].capabilities, if you've defined it
            local capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
            capabilities.textDocument.completion.completionItem.snippetSupport = false

            config.capabilities = capabilities
            lspconfig[server].setup(config)
        end
    end,

    -- example calling setup directly for each LSP
    -- config = function()
    --     local capabilities = require('blink.cmp').get_lsp_capabilities()
    --     local lspconfig = require('lspconfig')
    --
    --     lspconfig['lua_ls'].setup({ capabilities = capabilities })
    -- end
}
