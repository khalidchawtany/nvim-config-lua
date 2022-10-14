vim.api.nvim_create_autocmd(
  { "CursorMoved", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost" },
  {
    callback = function()
      require("user.winbar").get_winbar()
    end
  }
)

vim.api.nvim_create_autocmd(
  { "BufReadPost", "FileReadPost" },
  {
    -- pattern = "*",
    callback = function()
      -- {"BufReadPost,FileReadPost", "*", "if !(empty(&filetype) || &filetype=='noice') | normal zR | endif"}
      if vim.bo.filetype == 'noice' or  vim.bo.buflisted == false then
        return
      end

      vim.cmd.normal("zR")
    end
  }
)
