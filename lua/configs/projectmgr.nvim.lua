local M = {
  module = "projectmgr",
  cmd = {"ProjectMgr"},
  rocks = {"lsqlite3"}
}

M.init = function()
  -- vim.keymap.set("n", "<c-s><c-m>", vim.cmd.ProjectMgr, {desc = "Project Mgr"})

  vim.api.nvim_set_keymap("n", "<c-s><c-m>", "<cmd>ProjectMgr<CR>", {})
end

M.config = function()
  require("projectmgr").setup(
    {
      autogit = false,
      reopen = false,
      session = {enabled = true, file = "Session.vim"},
      shada = {enabled = false, file = "main.shada"},
      scripts = {
        enabled = true,
        file_startup = "startup.sh",
        file_shutdown = "shutdown.sh"
      }
    }
  )
end

return M
