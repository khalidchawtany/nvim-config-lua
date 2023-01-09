local M = {
  "drmingdrmer/xptemplate",
  -- event = {"InsertEnter"},
  keys = {{"<c-\\>", mode = "i"}}
}

M.config = function()
  vim.cmd [[
  set runtimepath+=/Users/juju/.config/nvim/xpt-personal
  fun! ListSnippetsStartingWithPrefix()
	return XPTemplateStart(0, {"forcePum": 1})
  endfunction

  fun! ListAll()
	return XPTemplateStart(0, {"forcePum": 1, "popupOnly": 1})
  endfunction

  " i<C-r>=ListAll()<CR>

  " i<C-r>=ListSnippetsStartingWithPrefix()<CR>
  ]]
  vim.g.xptemplate_key = "<c-\\>"
  vim.g.xptemplate_nav_next = "<C-j>"
  vim.g.xptemplate_nav_prev = "<C-k>"
  vim.g.xptemplate_minimal_prefix = 0
end
return M
