local M = {}

M.config = function()
  -- require("windline").setup({tabline = {}})
  require("wlsample.evil_line")
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
