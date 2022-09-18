local M = {
  module = "fine-cmdline",
  requires = {
    {"MunifTanjim/nui.nvim"}
  }
}

M.mapKeys = function()
  vim.api.nvim_set_keymap("n", "<leader>;", ':lua require("fine-cmdline").open()<CR>', {noremap = true, silent = true, nowait=true})

  -- if vim.fn.exists('g:neovide') then
  --   vim.api.nvim_set_keymap("n", ";", '<cmd>lua require("fine-cmdline").open()<CR>', {noremap = true})
  --   vim.api.nvim_set_keymap("n", "/", '<cmd>lua require("fine-cmdline").open({default_value = "/"})<CR>', {noremap = true})
  -- end
end

M.init = M.mapKeys
M.config = function()
  require("fine-cmdline").setup(
    {
      cmdline = {
        enable_keymaps = true,
        smart_history = true,
        prompt = ' '
      },
      popup = {
        position = {
          row = "10%",
          col = "50%"
        },
        size = {
          width = "60%",
          height = 1
        },
        border = {
          style = "rounded",
          highlight = "FloatBorder"
        },
        win_options = {
          winhighlight = "Normal:Normal"
        }
      },
      hooks = {
        before_mount = function(input)
          -- code
        end,
        after_mount = function(input)
          -- code
        end,
        set_keymaps = function(imap, feedkeys)
          local fn = require("fine-cmdline").fn
          imap("<c-k>", fn.up_history)
          imap("<c-j>", fn.down_history)
        end
      }
    }
  )
end

return M
