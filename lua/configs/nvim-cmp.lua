local M = {
  requires = {
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "SirVer/ultisnips",
    -- "hrsh7th/cmp-cmdline",
    -- "hrsh7th/cmp-copilot",
    "zbirenbaum/copilot-cmp",
    {
      "quangnguyen30192/cmp-nvim-ultisnips",
      config = function()
        -- optional call to setup (see customization section)
        require("cmp_nvim_ultisnips").setup {}
      end
      -- If you want to enable filetype detection based on treesitter:
      -- requires = { "nvim-treesitter/nvim-treesitter" },
    }
  },
  event = "InsertEnter"
}

_G.check_back_space = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s" ~= nil
end

_G.has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

_G.feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

M.config = function()
  vim.cmd [[
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
  ]]

  local cmp = require "cmp"

  cmp.setup(
    {
      completion = {},
      sources = {
        {name = "copilot", group_index = 2},
        {name = "nvim_lsp"},
        {name = "nvim_lua"},
        {name = "ultisnips"},
        {name = "path"},
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
            end
          }
        }
        -- {
        --   name = "look",
        --   keyword_length = 4,
        --   option = {
        --     convert_case = true,
        --     loud = true
        --   }
        -- }
      },
      experimental = {
        native_menu = false,
        ghost_text = false
      },
      -- formatting = {
      --   format = function(entry, vim_item)
      --     vim_item.menu =
      --       ({
      --       nvim_lsp = "[LSP]",
      --       emoji = "[EMO]",
      --       path = "[PA]",
      --       calc = "[CALC]",
      --       vsnip = "[SNIP]",
      --       buffer = "[BUF]"
      --     })[entry.source.name]
      --     return vim_item
      --   end
      -- },
      formatting = {
        format = function(entry, vim_item)
          vim_item.menu =
            ({
            nvim_lsp = "[LSP]",
            emoji = "[EMO]",
            path = "[FILE]",
            calc = "[CALC]",
            vsnip = "[SNIP]",
            luasnip = "[LSNIP]",
            ultisnips = "[ULTIS]",
            buffer = "[BUF]"
          })[entry.source.name]
          vim_item.dup =
            ({
            buffer = 1,
            path = 1,
            nvim_lsp = 1
          })[entry.source.name] or 0
          return vim_item
        end
      },
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end
      },
      mapping = {
        -- ["<C-n>"] = cmp.mapping(
        --   function(fallback)
        --     if require("neogen").jumpable() then
        --       require("neogen").jump_next()
        --     else
        --       fallback()
        --     end
        --   end,
        --   {
        --     "i",
        --     "s"
        --   }
        -- ),
        -- ["<C-p>"] = cmp.mapping(
        --   function(fallback)
        --     if require("neogen").jumpable(true) then
        --       require("neogen").jump_prev()
        --     else
        --       fallback()
        --     end
        --   end,
        --   {
        --     "i",
        --     "s"
        --   }
        -- ),
        -- ["<C-n>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
        ["<C-n>"] = cmp.mapping(
          function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
              -- elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
              --   return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), "m", true)
              feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
              cmp.complete()
            else
              fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
          end,
          {"i", "s"}
        ),
        -- ["<C-p>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
        ["<C-p>"] = cmp.mapping(
          function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
              -- elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
              --   return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), "m", true)
              feedkey("<Plug>(vsnip-jump-prev)", "")
            else
              fallback()
            end
          end,
          {"i", "s"}
        ),
        ["<Down>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
        ["<Up>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm(
          {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
          }
        ),
        ["<TAB>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif check_back_space() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<TAB>", true, true, true), "n")
          elseif vim.fn["vsnip#available"]() == 1 then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true), "")
          elseif require("neogen").jumpable() then
            require("neogen").jump_next()
          else
            fallback()
          end
        end
      }
    }
  )

  -- require "cmp".setup.cmdline(
  --   ":",
  --   {
  --     sources = {
  --       {name = "cmdline"}
  --     },
  --     mapping = cmp.mapping.preset.cmdline(
  --       {
  --         ["<C-j>"] = {
  --           c = function(fallback)
  --             if cmp.visible() then
  --               cmp.select_next_item()
  --             else
  --               fallback()
  --             end
  --           end
  --         },
  --         ["<C-k>"] = {
  --           c = function(fallback)
  --             if cmp.visible() then
  --               cmp.select_prev_item()
  --             else
  --               fallback()
  --             end
  --           end
  --         }
  --       }
  --     ) -- This line
  --   }
  -- )
  --
  -- require "cmp".setup.cmdline(
  --   "/",
  --   {
  --     sources = {
  --       {name = "buffer"}
  --     },
  --     mapping = cmp.mapping.preset.cmdline(
  --       {
  --         ["<C-j>"] = {
  --           c = function(fallback)
  --             if cmp.visible() then
  --               cmp.select_next_item()
  --             else
  --               fallback()
  --             end
  --           end
  --         },
  --         ["<C-k>"] = {
  --           c = function(fallback)
  --             if cmp.visible() then
  --               cmp.select_prev_item()
  --             else
  --               fallback()
  --             end
  --           end
  --         }
  --       }
  --     ) -- This line
  --   }
  -- )

  -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  -- The following example advertise capabilities to `clangd`.
  -- require "lspconfig".clangd.setup {
  --   capabilities = capabilities
  -- }
end

--M.config()

return M
