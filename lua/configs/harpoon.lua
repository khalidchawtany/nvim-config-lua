local M = {
  module = {"harpoon"}
}

M.init = function()
  -- :lua require("harpoon.mark").add_file()
  -- :lua require("harpoon.ui").nav_file(3) -- This will navigate to file 3
  -- :lua require("harpoon.ui").toggle_quick_menu()
  -- lua require("harpoon.term").gotoTerminal(1)
  -- lua require("harpoon.term").sendCommand(1, 1)
  -- lua require("harpoon.term").sendCommand(1, "ls -la")
  -- lua require('harpoon.cmd-ui').toggle_quick_menu()
end

M.config = function()
  require("harpoon").setup(
    {
      global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
        excluded_filetypes = {"harpoon"}
      }
      -- ... your other configs ...
      -- projects = {
      -- ["$HOME/personal/vim-with-me/server"] = {
      --     term = {
      --         cmds = {
      --             "./env && npx ts-node src/index.ts"
      --         }
      --     }
      -- },
    }
  )
end

return M
