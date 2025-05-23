local M = {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "davidmh/cspell.nvim",
        "gbprod/none-ls-php.nvim",
    },
    event = "BufEnter",
}

M.config = function()
    local null_ls = require("null-ls")
    local cspell = require('cspell')

    local cspell_config = {
        extra_args = { "--config", vim.fn.expand("~/.cspell.json") },
        diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["HINT"] -- ERROR, WARN, INFO, HINT
        end,
        config = {
            find_json = function(_)
                return vim.fn.expand("~/.config/nvim/cspell.json")
            end,
            on_success = function(cspell_config_file_path, params, action_name)
                if action_name == "add_to_json" then
                    os.execute(
                        string.format(
                            "cat %s | jq -S '.words |= sort' | tee %s > /dev/null",
                            cspell_config_file_path,
                            cspell_config_file_path
                        )
                    )
                end
            end,
        },
    }
    -- return nil
    require("null-ls").setup({
        sources = {

            -- CSpell
            cspell.diagnostics.with(cspell_config),
            cspell.code_actions.with(cspell_config),

            -- Hover
            null_ls.builtins.hover.dictionary,
            -- completion
            null_ls.builtins.completion.luasnip,
            -- null_ls.builtins.completion.spell.with({
            -- 	filetypes = { "markdown", "text", "org", "norg", "gitcommit" },
            -- }),
            -- code actions
            null_ls.builtins.code_actions.gitsigns,
            null_ls.builtins.code_actions.proselint,
            -- null_ls.builtins.code_actions.refactoring,
            -- null_ls.builtins.code_actions.xo, -- eslint wrapper with great defaults
            -- formatting
            -- null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.prettier.with({
                extra_args = function(params)
                    return params.options
                        and params.options.tabSize
                        and {
                            "--tab-width",
                            "--single-quote",
                            "--single-attribute-per-line",
                            params.options.tabSize,
                        }
                end,
            }),
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

            -- null_ls.builtins.formatting.autopep8,
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.djhtml,
            null_ls.builtins.formatting.djlint,
            -- null_ls.builtins.formatting.jq, -- Lua
            null_ls.builtins.formatting.stylua,
            -- null_ls.builtins.formatting.lua_format, -- PHP
            -- null_ls.builtins.formatting.phpcbf,
            -- null_ls.builtins.formatting.phpcsfixer,
            null_ls.builtins.formatting.pint.with({
                command = "pint",
            }),                                          -- Twig
            null_ls.builtins.formatting.blade_formatter, -- Yaml
            null_ls.builtins.formatting.yamlfmt,
            -- CSS, Style, less, sass, scss
            null_ls.builtins.formatting.rustywind, -- sort Tailwind classes
            -- Go
            null_ls.builtins.formatting.gofmt,
            null_ls.builtins.formatting.goimports,
            null_ls.builtins.formatting.goimports_reviser,
            null_ls.builtins.formatting.golines,
            -- diagnostics
            -- JS, TS, VUE, REACT
            -- null_ls.builtins.diagnostics.eslint,
            -- null_ls.builtins.diagnostics.tsc, -- Python
            -- null_ls.builtins.diagnostics.djlint, -- django
            -- null_ls.builtins.diagnostics.pycodestyle,
            -- null_ls.builtins.diagnostics.mypy, -- Json
            -- null_ls.builtins.diagnostics.jsonlint,
            -- null_ls.builtins.diagnostics.luacheck.with({
            --     extra_args = { "--globals", "{'vim'}" },
            -- }),
            null_ls.builtins.diagnostics.stylelint, -- Tailwind
            -- null_ls.builtins.diagnostics.php,
            -- null_ls.builtins.diagnostics.phpcs,
            null_ls.builtins.diagnostics.twigcs, -- Blade
            null_ls.builtins.diagnostics.yamllint,
        },
        should_attach = function(bufnr)
            return not vim.api.nvim_buf_get_name(bufnr):match("^git://")
        end,
    })

    require("null-ls").register(require("none-ls-php.diagnostics.php"))
end

return M
