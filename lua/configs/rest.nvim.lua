local M = {
  module = "rest-nvim",
  ft = {"http"}
}

M.init = function()
  -- nnoremap <Plug>RestNvim :lua require('rest-nvim').run()<CR>
  -- nnoremap <Plug>RestNvimPreview :lua require('rest-nvim').run(true)<CR>
  -- nnoremap <Plug>RestNvimLast :lua require('rest-nvim').last()<CR>
  -- nnoremap <leader>ht <cmd>lua require('rest-nvim').run()<cr>
  vim.cmd [[
    autocmd FileType http  nnoremap <buffer> <cr> <cmd>lua require('rest-nvim').run()<cr>
    ]]
end

M.config = function()
  require("rest-nvim").setup(
    {
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150
      },
      result = {
        show_url = false,
        show_http_info = true,
        show_headers = false,
      },
      -- Jump to request line on run
      jump_to_request = true
    }
  )
end

return M
