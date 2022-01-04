local M = {
  event = {"BufRead Cargo.toml"},
  requires = {{"nvim-lua/plenary.nvim"}},
  module = "crates"
}

M.init = function()
  vim.cmd [[
	    function! SetUpCratesPlugin() abort
	    echomsg "running crates init"
	      lua require('cmp').setup.buffer { sources = { { name = 'crates' } } }

	      nnoremap <buffer> <silent> <leader>ct :lua require('crates').toggle()<cr>
	      nnoremap <buffer> <silent> <leader>cr :lua require('crates').reload()<cr>
	      
	      nnoremap <buffer> <silent> <leader>cv :lua require('crates').show_versions_popup()<cr>
	      nnoremap <buffer> <silent> <leader>cf :lua require('crates').show_features_popup()<cr>
	      
	      nnoremap <buffer> <silent> <leader>cu :lua require('crates').update_crate()<cr>
	      vnoremap <buffer> <silent> <leader>cu :lua require('crates').update_crates()<cr>
	      nnoremap <buffer> <silent> <leader>ca :lua require('crates').update_all_crates()<cr>
	      nnoremap <buffer> <silent> <leader>cU :lua require('crates').upgrade_crate()<cr>
	      vnoremap <buffer> <silent> <leader>cU :lua require('crates').upgrade_crates()<cr>
	      nnoremap <buffer> <silent> <leader>cA :lua require('crates').upgrade_all_crates()<cr>
	      
	      nnoremap <buffer> <silent> K :lua show_crate_documentation()<cr>
	    endfunction

	    autocmd FileType toml call SetUpCratesPlugin()<cr>
	]]
end

show_crate_documentation = function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({"vim", "help"}, filetype) then
    vim.cmd("h " .. vim.fn.expand("<cword>"))
  elseif vim.tbl_contains({"man"}, filetype) then
    vim.cmd("Man " .. vim.fn.expand("<cword>"))
  elseif vim.fn.expand("%:t") == "Cargo.toml" then
    require("crates").show_popup()
  else
    vim.lsp.buf.hover()
  end
end

M.config = function()
  require("crates").setup()
end

return M
