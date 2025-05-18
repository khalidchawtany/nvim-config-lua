return {
  "weilbith/nvim-code-action-menu",
  cmd = {"CodeActionMenu"},
    keys = {
    {"<D-CR>", "<cmd>CodeActionMenu<cr>", desc = "Code Action Menu"}
  },
  config = function ()
	  vim.g.code_action_menu_show_details = false
	  vim.g.code_action_menu_show_diff = false
	  vim.g.code_action_menu_show_action_kind = true
	  vim.g.code_action_menu_window_border = 'rounded'
  end

}
