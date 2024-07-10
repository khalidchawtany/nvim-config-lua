local M = {
  "windwp/windline.nvim",
  event = "VimEnter"
}

M.config = function()

-- require('wlsample.bubble')
--
-- require('wlsample.evil_line')
-- require('wlsample.bubble2')
  -- require("windline").setup({tabline = {}})
  -- require("wlsample.evil_line")
  require("user.windline")
  -- table.insert(require("windline").default_line.active, 1, {text=require('nomodoro').status, name="nomodoro"})
  -- require("wlfloatline").setup(
  --   {
  --     skip_filetypes = {
  --       "TelescopePrompt",
  --       "NvimTree",
  --       "term",
  --       ""
  --     }
  --   }
  -- )

  -- Add winbar
  -- local windline = require("windline")
  -- local winbar = {
  --   filetypes = {"winbar"},
  --   active = {
  --     {" "},
  --     {"%="},
  --     {
  --       function(bufnr)
  --         local bufname = vim.api.nvim_buf_get_name(bufnr)
  --         local path = vim.fn.fnamemodify(bufname, ":~:.")
  --         return path
  --       end,
  --       {"white", "InactiveBg"}
  --     }
  --   },
  --   inactive = {
  --     {" ", {"white", "InactiveBg"}},
  --     {"%="},
  --     {
  --       function(bufnr)
  --         local bufname = vim.api.nvim_buf_get_name(bufnr)
  --         local path = vim.fn.fnamemodify(bufname, ":~:.")
  --         return path
  --       end,
  --       {"white", "InactiveBg"}
  --     }
  --   }
  -- }
  -- windline.add_status(winbar)
end

return M
