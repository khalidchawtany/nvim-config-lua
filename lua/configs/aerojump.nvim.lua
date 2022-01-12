local M = {
  run = {":UpdateRemotePlugins"},
	keys = {
		"<Plug>(AerojumpSpace)",
		"<Plug>(AerojumpBolt)",
		"<Plug>(AerojumpFromCursorBolt)",
		"<Plug>(AerojumpDefault)",
	}
}

M.setMaps = function()
  vim.cmd [[
    nmap <Leader>as <Plug>(AerojumpSpace)
    nmap <Leader>ab <Plug>(AerojumpBolt)
    nmap <Leader>aa <Plug>(AerojumpFromCursorBolt)
    nmap <Leader>ad <Plug>(AerojumpDefault)
  ]]
end
M.init = function()
  M.setMaps()
end

M.config = function()
  M.setMaps()
end

return M
