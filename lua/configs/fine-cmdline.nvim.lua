local M = {
  module = "fine-cmdline",
  requires = {
    {"MunifTanjim/nui.nvim"}
  }
}

M.mapKeys = function()
  vim.api.nvim_set_keymap("n", "<leader>;", ':lua require("fine-cmdline").open()<CR>', {noremap = true})
end

M.init = M.mapKeys
M.config = function()
  require("fine-cmdline").setup(
    {
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
