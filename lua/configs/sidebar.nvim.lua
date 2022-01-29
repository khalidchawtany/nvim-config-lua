local M = {
  -- branch = "dev",
  module = "sidebar-nvim",
  cmd = {
    "SidebarNvimToggle",
    "SidebarNvimClose",
    "SidebarNvimOpen",
    "SidebarNvimUpdate",
    "SidebarNvimFocus"
  }
}

M.mapKeys = function()
  vim.cmd [[
	nnoremap <leader>oss :lua require("sidebar-nvim").toggle()<cr>
	nnoremap <leader>oso :lua require("sidebar-nvim").open()<cr>
	nnoremap <leader>osf :lua require("sidebar-nvim").focus()<cr>
	nnoremap <leader>osc :lua require("sidebar-nvim").close()<cr>
	nnoremap <leader>osu :lua require("sidebar-nvim").update()<cr>
  ]]
end

M.init = M.mapKeys

M.config = function()
  -- M.mapKeys()
  require("sidebar-nvim").setup({
      disable_default_keybindings = 0,
      bindings = {
        ["q"] = function()
          require("sidebar-nvim").close()
        end
      },
      open = false,
      side = "left",
      initial_width = 35,
      hide_statusline = false,
      update_interval = 1000,
      sections = {"datetime", "git", "diagnostics", "todos", "buffers", "files"},
      section_separator = "-----",
      containers = {
        attach_shell = "/bin/sh",
        show_all = true,
        interval = 5000
      },
      datetime = {format = "%a %b %d, %H:%M", clocks = {{name = "local"}}},
      todos = {ignored_paths = {"~"}},
      disable_closing_prompt = false
    }
  )
end

return M
