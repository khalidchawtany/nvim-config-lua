local M = {
  keys = {
    "<Plug>(sandwich-add)",
    "sandwich-delete",
    "<Plug>(sandwich-delete-auto)",
    "<Plug>(sandwich-replace)",
    "<Plug>(sandwich-replace-auto)",
    "<Plug>(textobj-sandwich-auto-i)",
    "<Plug>(textobj-sandwich-auto-a)",
    "<Plug>(textobj-sandwich-auto-i)",
    "<Plug>(textobj-sandwich-auto-a)"
  }
}

M.init = function()
  vim.g.sandwich_no_default_key_mappings = true
  vim.cmd [[
  " add
  silent! nmap <unique> <leader>sa <Plug>(sandwich-add)
  silent! xmap <unique> <leader>sa <Plug>(sandwich-add)
  silent! omap <unique> <leader>sa <Plug>(sandwich-add)

  " delete
  silent! nmap <unique> <leader>Sd <Plug>(sandwich-delete)
  silent! xmap <unique> <leader>Sd <Plug>(sandwich-delete)
  silent! nmap <unique> <leader>Sdb <Plug>(sandwich-delete-auto)

  " replace
  silent! nmap <unique> <leader>Sr <Plug>(sandwich-replace)
  silent! xmap <unique> <leader>Sr <Plug>(sandwich-replace)
  silent! nmap <unique> <leader>Srb <Plug>(sandwich-replace-auto)

  " auto
  silent! omap <unique> ia <Plug>(textobj-sandwich-auto-i)
  silent! xmap <unique> ia <Plug>(textobj-sandwich-auto-i)
  silent! omap <unique> aa <Plug>(textobj-sandwich-auto-a)
  silent! xmap <unique> aa <Plug>(textobj-sandwich-auto-a)

  " query
  silent! omap <unique> is <Plug>(textobj-sandwich-query-i)
  silent! xmap <unique> is <Plug>(textobj-sandwich-query-i)
  silent! omap <unique> as <Plug>(textobj-sandwich-query-a)
  silent! xmap <unique> as <Plug>(textobj-sandwich-query-a)

  ]]
end

return M
