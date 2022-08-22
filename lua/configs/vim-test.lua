local M = {
  cmd = {
    "TestNearest",
    "TestFile",
    "TestSuite",
    "TestSuite",
    "TestSuite",
    "TestLast",
    "TestLast",
    "TestVisit"
  }
}

local mapKeys = function()
  vim.cmd [[
     nnoremap <silent> t<C-n>      :TestNearest <CR>
     nnoremap <silent> t<C-f>      :TestFile    <CR>
     nnoremap <silent> t<C-s>      :TestSuite   <CR>
     nnoremap <silent> t<C-t>      :TestSuite   <CR>
     nnoremap <silent> t<C-cr>     :TestSuite   <CR>
     nnoremap <silent> t<C-l>      :TestLast    <CR>
     nnoremap <silent> t<C-space>  :TestLast    <CR>
     nnoremap <silent> t<C-g>      :TestVisit   <CR>
    ]]
end

M.init = function()
  -- vim.cmd [[ let test#strategy = "FTerm"]]
  mapKeys()
end

return M
