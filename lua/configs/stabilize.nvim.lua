local M = {
  disabled = true
}

M.config = function()
  vim.cmd [[
  autocmd WinNew * lua win=vim.api.nvim_get_current_win() vim.defer_fn(function()vim.api.nvim_set_current_win(win) end, 70)
  ]]
  require("stabilize").setup(
    {
      force = true, -- stabilize window even when current cursor position will be hidden behind new window
      forcemark = nil, -- set context mark to register on force event which can be jumped to with '<forcemark>
      ignore = {
        -- do not manage windows matching these file/buftypes
        filetype = {"help", "list", "Trouble", "fugitive", "gitcommit"},
        buftype = {"terminal", "quickfix", "loclist"}
      },
      nested = nil -- comma-separated list of autocmds that wil trigger the plugins window restore function
      -- nested = "QuickFixCmdPost,User LspDiagnosticsChanged"
    }
  )
end

return M
