local M = {
  cmd = {"Format", "FormatWrite"}
}

M.init = function()
  vim.cmd [[ nnoremap <silent> <c-k><c-space> :Format<CR> ]]
end

M.config = function()
  require("formatter").setup(
    {
      logging = false,
      filetype = {
        -- typescript = eslint_fmt,
        -- typescriptreact = eslint_fmt,
        -- javascript = eslint_fmt,
        -- javascriptreact = eslint_fmt,
        javascript = {
          -- prettier
          function()
            return {
              exe = "prettier",
              args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
              stdin = true
            }
          end
        },
        rust = {
          -- Rustfmt
          function()
            return {
              exe = "rustfmt",
              args = {"--emit=stdout"},
              stdin = true
            }
          end
        },
        lua = {
          -- luafmt
          function()
            return {
              exe = "luafmt",
              args = {"--indent-count", 2, "--stdin"},
              stdin = true
            }
          end
        },
        cpp = {
          -- clang-format
          function()
            return {
              exe = "clang-format",
              args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
              stdin = true,
              cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
            }
          end
        },
        php = {
          function ()
            return {
              -- '/Users/juju/.composer/vendor/bin/phpstan analyze --error-format raw --no-progress'
              exe = '/Users/juju/.composer/vendor/squizlabs/php_codesniffer/bin/phpcbf',
              args = {'--stdin-path=' .. vim.api.nvim_buf_get_name(0), '-'},
              stdin = true,
              ignore_exitcode = true,
            }
          end
        }
      }
    }
  )
end

return M
