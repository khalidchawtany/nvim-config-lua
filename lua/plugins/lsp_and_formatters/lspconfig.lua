return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            tailwindcss = {},
        },
    },
    config = function()

        vim.lsp.util.stylize_markdown = function(bufnr, contents, opts)
            contents = vim.lsp.util._normalize_markdown(contents, {
                width = vim.lsp.util._make_floating_popup_size(contents, opts),
            })

            vim.bo[bufnr].filetype = "markdown"
            vim.treesitter.start(bufnr)
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, contents)

            return contents
        end


        vim.diagnostic.config({ virtual_text = false, })
        --- toggle diagnostics
        vim.g.diagnostics_visible = true
        local function toggle_diagnostics()
            if vim.g.diagnostics_visible then
                vim.g.diagnostics_visible = false
                vim.diagnostic.disable()
            else
                vim.g.diagnostics_visible = true
                vim.diagnostic.enable()
            end
        end

        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set(
            "n",
            "<leader>ol",
            toggle_diagnostics,
            vim.tbl_extend("force", bufopts, { desc = "✨lsp toggle diagnostics" })
        )

        require("lspconfig").v_analyzer.setup({
            cmd = { "/Users/juju/.config/v-analyzer/bin/v-analyzer" },
            document_config = {
                default_config = {
                    cmd = { "/Users/juju/.config/v-analyzer/bin/v-analyzer" },
                    root_dir = require("lspconfig").util.root_pattern(".git", ".v-analyzer"),
                    filetypes = { "v", "vlang" },
                },
            },
        })

        --  local on_attach = function(client, bufnr)
        --    vim.lsp.handlers["textDocument/publishDiagnostics"] =
        --      vim.lsp.with(
        --      vim.lsp.diagnostic.on_publish_diagnostics,
        --      {
        --        -- Enable signs
        --        signs = true,
        --        virtual_text = false,
        --        underline = true,
        --        update_in_insert = false
        --      }
        --    )
        --    local function buf_set_keymap(...)
        --      vim.api.nvim_buf_set_keymap(bufnr, ...)
        --    end
        --    local function buf_set_option(...)
        --      vim.api.nvim_buf_set_option(bufnr, ...)
        --    end
        --
        --    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
        --
        --    -- Mappings.
        --    local opts = {noremap = true, silent = true}
        --    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        --    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
        --    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
        --    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        --    buf_set_keymap("n", "g<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        --    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
        --    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
        --    buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
        --    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
        --    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        --    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        --    buf_set_keymap("n", "<space>dl", "<cmd>lua vim.diagnostic.open_float(0, {scope='line'}) <CR>", opts)
        --    buf_set_keymap("n", "<space>dc", "<cmd>lua vim.diagnostic.open_float(0, {scope='cursor'}) <CR>", opts)
        --    buf_set_keymap("n", "<space>df", "<cmd>lua vim.diagnostic.open_float(0, {}) <CR>", opts)
        --
        --    buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
        --    buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
        --    buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
        --
        --    -- Set some keybinds conditional on server capabilities
        --    if client.server_capabilities.document_formatting then
        --      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        --    elseif client.server_capabilities.document_range_formatting then
        --      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
        --    end
        --
        --    -- Set autocommands conditional on server_capabilities
        --    if client.server_capabilities.document_highlight then
        --      vim.api.nvim_exec(
        --        [[
        -- augroup lsp_document_highlight
        -- autocmd! * <buffer>
        -- autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        -- autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        -- augroup END
        --  ]],
        --        false
        --      )
        --    end
        --
        --
        -- require'lspconfig'.sumneko_lua.setup {
        --  -- cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
        --  settings = {
        --   Lua = {
        -- 	  runtime = {
        -- 		  -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        -- 		  version = 'LuaJIT',
        -- 		  -- Setup your lua path
        -- 		  path = vim.split(package.path, ';')
        -- 	  },
        -- 	  diagnostics = {
        -- 		  -- Get the language server to recognize the `vim` global
        -- 		  globals = {'vim'}
        -- 	  },
        -- 	  workspace = {
        -- 		  -- Make the server aware of Neovim runtime files
        -- 		  library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true},
        -- 		  -- prevent lua being asked to configure workspace
        -- 		  checkThirdParty = false,
        -- 	  }
        --   }
        --  }
        -- }
        --
        --  end
    end,
}

-- -- Configure lua language server for neovim development
-- local lua_settings = {
--   Lua = {
--     runtime = {
--       -- LuaJIT in the case of Neovim
--       version = "LuaJIT",
--       path = vim.split(package.path, ";")
--     },
--     diagnostics = {
--       -- Get the language server to recognize the `vim` global
--       globals = {"vim"}
--     },
--     workspace = {
--       -- Make the server aware of Neovim runtime files
--       library = {[vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true}
--     }
--   }
-- }
--
-- -- config that activates keymaps and enables snippet support
-- local function make_config()
--   local capabilities = vim.lsp.protocol.make_client_capabilities()
--   capabilities.textDocument.completion.completionItem.snippetSupport = true
--   return {
--     -- enable snippet support
--     capabilities = capabilities,
--     -- map buffer local keybindings when the language server attaches
--     on_attach = on_attach
--   }
-- end
--
-- -- vim.cmd([[ autocmd BufWritePre *.lua lua vim.lsp.buf.formatting() ]])
--
-- require "lspconfig".phpactor.setup {}
--
-- require "lspconfig".efm.setup {
--   init_options = {documentFormatting = false},
--   filetypes = {"lua", "html"},
--   settings = {
--     rootMarkers = {".git/"},
--     languages = {
--       lua = {
--         {
--           formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
--           formatStdin = true
--         }
--       },
--       html = {{formatCommand = "prettier --tab-width 2 --stdin-filepath ${INPUT}", formatStdin = true}}
--     }
--   }
-- }
--
-- -- -- LUA
-- -- -- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
-- -- USER = vim.fn.expand('$USER')
-- --
-- -- local sumneko_root_path = ""
-- -- local sumneko_binary = ""
-- --
-- -- if vim.fn.has("mac") == 1 then
-- --     sumneko_root_path = "/Users/" .. USER .. "/.local/share/nvim/lspinstall/lua/sumneko-lua/extension/server"
-- --     sumneko_binary = "/Users/" .. USER .. "/.local/share/nvim/lspinstall/lua/sumneko-lua/extension/server/bin/macOS/lua-language-server"
-- --
-- -- elseif vim.fn.has("unix") == 1 then
-- --     sumneko_root_path = "/home/" .. USER .. "/.local/share/nvim/lspinstall/lua/sumneko-lua/extension/server"
-- --     sumneko_binary = "/home/" .. USER .. "/.local/share/nvim/lspinstall/lua/sumneko-lua/extension/server/bin/macOS/lua-language-server"
-- -- else
-- --     print("Unsupported system for sumneko")
-- -- end
-- --
-- -- require'lspconfig'.sumneko_lua.setup {
-- --     cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
-- --     settings = {
-- --         Lua = {
-- --             runtime = {
-- --                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
-- --                 version = 'LuaJIT',
-- --                 -- Setup your lua path
-- --                 path = vim.split(package.path, ';')
-- --             },
-- --             diagnostics = {
-- --                 -- Get the language server to recognize the `vim` global
-- --                 globals = {'vim'}
-- --             },
-- --             workspace = {
-- --                 -- Make the server aware of Neovim runtime files
-- --                 library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
-- --             }
-- --         }
-- --     }
-- -- }
-- --
-- -- require"lspconfig".efm.setup {
-- --     init_options = {documentFormatting = true},
-- --     filetypes = {"lua"},
-- --     settings = {
-- --         rootMarkers = {".git/"},
-- --         languages = {
-- --             lua = {
-- --                 {
-- --                     formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
-- --                     formatStdin = true
-- --                 }
-- --             }
-- --         }
-- --     }
-- -- }
-- -- -- vim.cmd([[ autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100) ]])
-- -- vim.cmd([[ autocmd BufWritePre *.lua lua vim.lsp.buf.formatting() ]])
-- -- -- PHP
-- -- require'lspconfig'.phpactor.setup {}
-- --
-- -- require'lspinstall'.setup() -- important
-- --
-- -- local servers = require'lspinstall'.installed_servers()
-- -- for _, server in pairs(servers) do require'lspconfig'[server].setup {} end
-- -- keymaps
