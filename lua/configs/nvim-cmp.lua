local M = {
  requires = {
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "quangnguyen30192/cmp-nvim-ultisnips"
  }
}

M.config = function()
  local cmp = require "cmp"
  cmp.setup(
    {
      sources = {
        {name = "nvim_lua"},
        {name = "buffer"},
        {name = "nvim_lsp"},
        {name = "path"},
        {name = "ultisnips"}
      },
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end
      },
      mapping = {
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
        ["<Tab>"] = function(fallback)
          if vim.fn.pumvisible() == 1 then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
          elseif check_back_space() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n")
          elseif vim.fn["vsnip#available"]() == 1 then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true), "")
          else
            fallback()
          end
        end
      }
    }
  )

  -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  -- The following example advertise capabilities to `clangd`.
  require "lspconfig".clangd.setup {
    capabilities = capabilities
  }
end

return M
