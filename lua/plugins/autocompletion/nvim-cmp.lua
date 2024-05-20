local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "lukas-reineke/cmp-rg",
        "buschco/nvim-cmp-ts-tag-close",
    },
    event = "InsertEnter",
    opts = function(_, opts)
        local cmp = require("cmp")

        -- require("user.xptsource")

        vim.cmd([[
				" gray
				highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
				" blue
				highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
				highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
				" light blue
				highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
				highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
				highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
				" pink
				highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
				highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
				" front
				highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
				highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
				highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
            ]])

        opts.completion = {}
        opts.sources = {
            { name = "copilot",              group_index = 2 },
            { name = "codeium" },
            { name = "nvim-cmp-ts-tag-close" },
            { name = "luasnip" },
            { name = "nvim_lsp",             trigger_characters = { "-" } },
            -- { name = "xpt" },
            { name = "nvim_lua" },
            { name = "path" },
            { name = "otter" },
            {
                name = "buffer",
                option = {
                    get_bufnrs = function()
                        return vim.api.nvim_list_bufs()
                        -- local bufs = {}
                        -- for _, win in ipairs(vim.api.nvim_list_wins()) do
                        --   bufs[vim.api.nvim_win_get_buf(win)] = true
                        -- end
                        -- return vim.tbl_keys(bufs)
                    end,
                },
            },
            {
                name = "rg",
                -- Try it when you feel cmp performance is poor
                keyword_length = 3,
            },
            -- {
            --   name = "look",
            --   keyword_length = 4,
            --   option = {
            --     convert_case = true,
            --     loud = true
            --   }
            -- }
        }

        opts.view = {
            -- entries = "native",
        }
        opts.experimental = {
            -- native_menu = false,
            ghost_text = false,
        }
        opts.window = {
            -- documentation = "native",
            documentation = {
                border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
            },
            completion = {
                border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
            },
        }
        opts.sorting = {
            priority_weight = 2,
            comparators = {
                require("copilot_cmp.comparators").prioritize,
                require("copilot_cmp.comparators").score,
                -- Below is the default comparitor list and order for nvim-cmp
                cmp.config.compare.offset,
                -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
                cmp.config.compare.exact,
                cmp.config.compare.score,
                cmp.config.compare.recently_used,
                cmp.config.compare.locality,
                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order,
            },
        }
        opts.formatting = {
            format = function(entry, item)
                item.menu = ({
                    -- xpt = "[XPT]",
                    copilot = "[Cop]",
                    luasnip = "[LS]",
                    nvim_lsp = "[LSP]",
                    path = "[FILE]",
                    buffer = "[BUF]",
                    rg = "[RG]",
                    treesitter = "[TS]",
                    calc = "[CALC]",
                    emoji = "[EMO]",
                    ['vim-dadbod-completion'] = "[DB]",
                })[entry.source.name]
                item.dup = ({
                    buffer = 1,
                    path = 1,
                    nvim_lsp = 0,
                    luasnip = 1,
                })[entry.source.name] or 0 -- 0 here is the default duplicate value

                require("tailwindcss-colorizer-cmp").formatter(entry, item)
                return item
            end,
        }
        opts.snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        }
        opts.mapping = cmp.mapping.preset.insert({
            -- ["<C-n>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
            ["<c-n>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                    require("luasnip").expand_or_jump()
                elseif has_words_before() then
                    cmp.mapping.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<c-p>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                    require("luasnip").jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
            ["<TAB>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                    require("luasnip").expand_or_jump()
                elseif has_words_before() then
                    cmp.mapping.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),
        })

        -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        -- -- Setup up vim-dadbod
        -- require("cmp").setup.filetype({ "sql", "mysql" }, {
        --     sources = {
        --         { name = "vim-dadbod-completion" },
        --         { name = "buffer" },
        --     },
        -- })
    end,
}
