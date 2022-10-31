local winbarAutoCommandId = nil
local setUpWinbarAutoCmd = function()
  winbarAutoCommandId =
    vim.api.nvim_create_autocmd(
    {"CursorMoved", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost"},
    {
      callback = function()
        require("user.winbar").get_winbar()
      end
    }
  )
end

setUpWinbarAutoCmd()

vim.keymap.set(
  "n",
  "yo<cr>",
  function()
    if vim.api.nvim_get_option_value("winbar", {scope = "local"}) == "" then
      setUpWinbarAutoCmd()
      require("user.winbar").get_winbar()
    else
      vim.api.nvim_del_autocmd(winbarAutoCommandId)
      pcall(vim.api.nvim_set_option_value, "winbar", "", {scope = "local"})
    end
  end,
  {desc = "Toggle Winbar"}
)

vim.api.nvim_create_autocmd(
  {"BufReadPost", "FileReadPost"},
  {
    -- pattern = "*",
    callback = function()
      -- {"BufReadPost,FileReadPost", "*", "if !(empty(&filetype) || &filetype=='noice') | normal zR | endif"}
      if vim.bo.filetype == "noice" or vim.bo.buflisted == false then
        return
      end

      vim.cmd.normal("zR")
    end
  }
)
