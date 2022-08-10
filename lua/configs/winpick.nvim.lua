local M = {
  module = "winpick"
}

local selectWin = function()
  local winpick = require("winpick")
  local winid = winpick.select()

  if winid then
    vim.api.nvim_set_current_win(winid)
  end
end

local copyBufferPath = function()
  local winpick = require("winpick")
  local winid, bufnr =
    winpick.select(
    {
      filter = function(winid, bufnr)
        if vim.api.nvim_buf_get_option(bufnr, "buftype") == "terminal" then
          return false
        end
        return winpick.defaults.filter(winid, bufnr)
      end
    }
  )

  if not winid then
    return
  end

  local name = vim.api.nvim_buf_get_name(bufnr)
  if name then
    vim.fn.setreg("+", vim.fn.fnamemodify(name, ":~:."))
  end
end

M.init = function()
  vim.keymap.set( "n", "<c-s><c-w>", selectWin , {desc='Piack window'})
  vim.keymap.set( "n", "<c-s><c-y>", copyBufferPath , {desc='Piack window'})
end

M.config = function()
  local winpick = require("winpick")
  winpick.setup(
    {
      border = "double",
      filter = winpick.defaults.filter, -- filters preview window and quickfix
      prompt = "Pick a window: ",
      format_label = winpick.defaults.format_label -- formatted as "<label>: <buffer name>"
    }
  )
end

return M
