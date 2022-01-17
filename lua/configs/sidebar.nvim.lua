local M = {
  branch = "dev",
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
  M.mapKeys()
  require("sidebar-nvim").setup()
end


return M
