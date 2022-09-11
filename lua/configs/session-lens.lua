local M = {
  module = "session-lens",
  requires = {"rmagatti/auto-session", "nvim-telescope/telescope.nvim"},
  opt = true
}

-- usage
-- :Telescope session-lens search_session
-- :lua require('session-lens').search_session()

M.init = function()
  vim.cmd [[
  nnoremap <c-s>\   <cmd>lua require('session-lens').search_session()<cr>
]]
end
M.config = function()
  require("session-lens").setup({})
end
return M
