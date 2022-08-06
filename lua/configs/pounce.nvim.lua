local M = {
  module = "pounce",
  cmd = {"Pounce"},
  -- keys={"<leader>p"}
  opt = true
}

M.mapKeys = function()
  vim.cmd [[
	nmap <c-s>F <cmd>PounceRepeat<CR>
	nmap <c-s>f <cmd>Pounce<CR>
	vmap <c-s>f <cmd>Pounce<CR>
	omap <c-s>f <cmd>Pounce<CR>
  ]]
end

M.init = M.mapKeys

M.config = function()
  M.mapKeys()
  require "pounce".setup {
    accept_keys = "JFKDLSAHGNUVRBYTMICEOXWPQZ",
    accept_best_key = "<enter>",
    multi_window = true,
    debug = false,
  }
end

return M
