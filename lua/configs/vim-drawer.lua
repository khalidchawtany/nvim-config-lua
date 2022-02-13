  
local M = {
  cmd = {"VimDrawer"}
}

M.init = function()
  vim.g.vim_drawer_spaces = {
    {"screen", "app/screens"},
    {"model", "app/models"},
    {"model", "app/models/*-store/"},
    {"controllers", "/controllers/*.php"},
    {"models", "/models/*.php"},
  }
end
return M
