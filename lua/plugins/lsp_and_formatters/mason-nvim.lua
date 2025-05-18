local M = {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    -- event = "BufReadPre",
}


M.config = function()
    vim.diagnostic.config {
        underline = true,
        virtual_text = false,
        -- virtual_text = {
        --     prefix = "",
        --     severity = nil,
        --     source = "if_many",
        --     format = nil,
        -- },
        signs = true,
        severity_sort = true,
        update_in_insert = false,
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- You are now capable!
    capabilities.textDocument.colorProvider = {
        dynamicRegistration = true,
    }

    vim.lsp.config('*', {
        capabilities = vim.lsp.protocol.make_client_capabilities(),
    })

    vim.lsp.config('lua_ls', {
        settings = {
            Lua = {
                -- completion = {
                -- 	keywordSnippet  = "Disable"  -- prevent duplicate snippets from luasnip and LSP
                -- },
                diagnostics = {
                    globals = { "vim", "use", "require" },
                },
                hint = {
                    enable = true,
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                    -- prevent lua being asked to configure workspace
                    checkThirdParty = false,
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    })

    vim.lsp.config('texlab', {
        settings = {
            texlab = {
                build = {
                    onSave = true,
                    executable = "tectonic",
                    args = vim.split("%f --synctex", " "),
                },
                forwardSearch = {
                    executable = "zathura",
                    args = { "--synctex-forward", "%l:1:%f", "%p" },
                },
            },
        },
    })


    vim.lsp.config('html', {
        settings = {
            html = {
                format = {
                    templating = true,
                    wrapLineLength = 120,
                    wrapAttributes = "auto",
                },
                hover = {
                    documentation = true,
                    references = true,
                },
            },
        },
    })

    vim.lsp.config('ts_ls', {
        -- filetypes = { ... },
        root_dir = function(fname)
            return require("lspconfig.util").root_pattern(".git")(fname)
        end,
        settings = {
            javascript = {
                inlayHints = {
                    includeInlayEnumMemberValueHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayVariableTypeHints = true,
                },
            },
            typescript = {
                inlayHints = {
                    includeInlayEnumMemberValueHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayVariableTypeHints = true,
                },
            },
        },
    })


    vim.lsp.config('intelephense', {
        -- filetypes = { ... },
        root_dir = function(fname)
            return require("lspconfig.util").root_pattern(".git")(fname)
        end,
        settings = {
            php = {},
        },
    })


    vim.lsp.config('tailwindcss', {

        settings = {
            tailwindCSS = {
                experimental = {
                    classRegex = {
                        "cva\\(([^)]*)\\)",
                        "[\"'`]([^\"'`]*).*?[\"'`]",
                    },
                },
            },
        },
    })

    require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
            },
        },
    })

    require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
    })
end
return M
