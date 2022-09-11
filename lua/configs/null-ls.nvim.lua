local M = { requires = { "nvim-lua/plenary.nvim" } }
M.config = function()
  local null_ls = require("null-ls")
  return nil
  require("null-ls").setup({
    sources = {
      null_ls.builtins.hover.dictionary,
      null_ls.builtins.completion.spell,

      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.code_actions.refactoring,

      null_ls.builtins.formatting.prettier,
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
      -- null_ls.builtins.formatting.prettier.with({
      --   filetypes = { "html", "json", "yaml", "markdown" },
      --   disabled_filetypes = { "lua" },
      --   extra_args = { "-i", "2", "-ci" },
      --   extra_args = { "--config-path", vim.fn.expand("~/.config/stylua.toml") },
      --   env = {
      --     PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierrc.json"),
      --   },
      --   -- ignore prettier warnings from eslint-plugin-prettier
      --   filter = function(diagnostic)
      --     return diagnostic.code ~= "prettier/prettier"
      --   end,
      -- }),

      -- JS, TS, VUE, REACT
      -- null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.code_actions.xo, -- eslint wrapper with great defaults
      null_ls.builtins.diagnostics.tsc, -- Python
      null_ls.builtins.diagnostics.djlint, -- django
      null_ls.builtins.formatting.djhtml,
      null_ls.builtins.formatting.djlint,
      null_ls.builtins.diagnostics.pycodestyle,
      null_ls.builtins.diagnostics.mypy, -- Json
      null_ls.builtins.diagnostics.jsonlint,
      null_ls.builtins.formatting.jq, -- Lua
      null_ls.builtins.diagnostics.luacheck,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.lua_format, -- PHP
      null_ls.builtins.diagnostics.php,
      null_ls.builtins.diagnostics.phpcs,
      null_ls.builtins.formatting.phpcbf,
      null_ls.builtins.formatting.phpcsfixer,
      null_ls.builtins.formatting.pint, -- Twig
      null_ls.builtins.diagnostics.twigcs, -- Blade
      null_ls.builtins.formatting.blade_formatter, -- Yaml
      null_ls.builtins.diagnostics.yamllint,
      null_ls.builtins.formatting.yamlfmt,
      -- CSS, Style, less, sass, scss
      null_ls.builtins.diagnostics.stylelint, -- Tailwind
      null_ls.builtins.formatting.rustywind, -- Go
      null_ls.builtins.formatting.gofmt,
      null_ls.builtins.formatting.goimports,
      null_ls.builtins.formatting.goimports_reviser,
      null_ls.builtins.formatting.golines
    },
    should_attach = function(bufnr)
      return not vim.api.nvim_buf_get_name(bufnr):match("^git://")
    end
  })
end

return M
