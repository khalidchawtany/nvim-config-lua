local M = {
  module = "pounce",
  cmd = {"Pounce"},
  -- keys={"<leader>p"}
  opt = true
}

M.mapKeys = function()
  vim.cmd [[
	nmap <leader>p <cmd>Pounce<CR>
	vmap <leader>p <cmd>Pounce<CR>
	omap <leader>P <cmd>Pounce<CR>
  ]]
end

M.init = M.mapKeys

M.config = function()
  M.mapKeys()
  require "pounce".setup {
    accept_keys = "JFKDLSAHGNUVRBYTMICEOXWPQZ",
    debug = false
  }
end

return M
