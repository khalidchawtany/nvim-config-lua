local M = {
    "mhartington/formatter.nvim",
    cmd = { "Format", "FormatWrite" },
    keys = { { "<c-k><c-space>", "<cmd>Format<cr>", desc = "Format" } },
}

M.config = function()
    require("formatter").setup({
        logging = false,
        filetype = {
            vue = {
                function()
                    return {
                        exe = "prettier",
                        args = {
                            "--stdin-filepath",
                            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                            "--parser",
                            "vue",
                            "--no-semi",
                            "--single-quote",
                            "--space-before-function-paren",
                            "--max-attribute-length 1",
                        },
                        stdin = true,
                    }
                end,
            },
            typescriptreact = {
                function()
                    return {
                        exe = "prettier",
                        args = {
                            "--stdin-filepath",
                            vim.api.nvim_buf_get_name(0),
                            "--single-quote",
                            "--space-before-function-paren",
                            "--max-attribute-length 1",
                        },
                        stdin = true,
                    }
                end,
            },
            typescript = {
                prettier = function()
                    return {
                        exe = "prettier",
                        args = {
                            "--stdin-filepath",
                            vim.api.nvim_buf_get_name(0),
                            "--single-quote",
                        },
                        stdin = true,
                    }
                end,
            },
            javascriptreact = {
                prettier = function()
                    return {
                        exe = "prettier",
                        args = {
                            "--stdin-filepath",
                            vim.api.nvim_buf_get_name(0),
                            "--single-quote",
                        },
                        stdin = true,
                    }
                end,
            },
            -- typescript = eslint_fmt,
            -- typescriptreact = eslint_fmt,
            -- javascript = eslint_fmt,
            -- javascriptreact = eslint_fmt,
            javascript = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {
                            "--stdin-filepath",
                            vim.api.nvim_buf_get_name(0),
                            "--single-quote",
                        },
                        stdin = true,
                    }
                end,
            },
            rust = {
                -- Rustfmt
                function()
                    return {
                        exe = "rustfmt",
                        args = { "--emit=stdout" },
                        stdin = true,
                    }
                end,
            },
            go = {
                function()
                    return { exe = "gofmt", stdin = true }
                end,
            },
            lua = {
                -- luafmt
                function()
                    return {
                        exe = "luafmt",
                        args = { "--indent-count", 2, "--stdin" },
                        stdin = true,
                    }
                end,
            },
            python = {
                -- python-black
                -- pip3 install git+git://github.com/psf/black
                function()
                    return { exe = "black", args = { "--quiet" }, stdin = false }
                end,
            },
            cpp = {
                -- clang-format
                function()
                    return {
                        exe = "clang-format",
                        args = {
                            "--assume-filename",
                            vim.api.nvim_buf_get_name(0),
                        },
                        stdin = true,
                        cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
                    }
                end,
            },
            json = {
                function()
                    return {
                        exe = "prettier",
                        args = {
                            "--stdin-filepath",
                            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                            "--double-quote",
                        },
                        stdin = true,
                    }
                end,
            },
            html = {
                function()
                    return {
                        exe = "prettier",
                        args = {
                            "--stdin-filepath",
                            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                            "--double-quote",
                        },
                        stdin = true,
                    }
                end,
            },
            htm = {
                function()
                    return {
                        exe = "prettier",
                        args = {
                            "--stdin-filepath",
                            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                            "--plugin",
                            "/Users/juju/.config/yarn/global/node_modules/prettier-plugin-twig-melody",
                            "--double-quote",
                        },
                        stdin = true,
                    }
                end,
            },
            blade = {
                function()
                    return {
                        exe = "blade-formatter",
                        -- args = {"--write", "--stdin", "--indent-size=4", "--wrap-line-length=100", vim.api.nvim_buf_get_name(0)},
                        args = {
                            "--indent-size=2",
                            "--wrap-line-length=100",
                            vim.api.nvim_buf_get_name(0),
                        },
                        stdin = true,
                    }
                end,
            },
            php = {
                function()
                    return {
                        -- '/Users/juju/.composer/vendor/bin/phpstan analyze --error-format raw --no-progress'
                        exe ='PATH="/opt/homebrew/opt/php@8.2/bin:$PATH" /Users/juju/.composer/vendor/squizlabs/php_codesniffer/bin/phpcbf',
                        -- exe ='/Users/juju/.local/share/nvim/mason/bin/pint',

                        -- args = {"-", "--standard=PSR12 --stdin-path=" .. vim.api.nvim_buf_get_name(0), "-"},
                        args = {
                            "--standard=PSR12",
                            vim.api.nvim_buf_get_name(0),
                            "--tab-width=2",
                        },
                        stdin = true,
                        ignore_exitcode = true,
                    }
                end,
            },
            -- !sqlfluff format --dialect mysql %

            mysql = {
                function()
                    return {
                        exe = 'sqlfluff',
                        args = {
                            "format",
                            "--dialect",
                            "mysql",
                        },
                        stdin = false,
                        ignore_exitcode = true,
                    }
                end,
            },
        },
    })
end

return M
