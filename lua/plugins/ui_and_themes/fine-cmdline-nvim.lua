local M = {
  "VonHeikemen/fine-cmdline.nvim",
  requires = {"MunifTanjim/nui.nvim"},
  keys = {
    {
      "<leader>;",
      function()
        require("fine-cmdline").open()
      end,
      desc = "fine-cmdline"
    }
  }
}

-- if vim.fn.exists('g:neovide') then
--   vim.api.nvim_set_keymap("n", ";", '<cmd>lua require("fine-cmdline").open()<CR>', {noremap = true})
--   vim.api.nvim_set_keymap("n", "/", '<cmd>lua require("fine-cmdline").open({default_value = "/"})<CR>', {noremap = true})
-- end

M.config = function()
  require("fine-cmdline").setup(
    {
      cmdline = {
        enable_keymaps = true,
        smart_history = true,
        prompt = " "
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