local M = {
  module = "yode-nvim",
  cmd = {
    "YodeCreateSeditorFloating",
    "YodeCreateSeditorReplace",
    "YodeBufferDelete",
    "YodeGoToAlternateBuffer",
    "YodeCloneCurrentIntoFloat",
    "YodeFloatToMainWindow",
    "YodeFormatWrite",
    "YodeRunInFile"
  }
}
M.mapKeys = function()
  vim.cmd [[
  noremap <leader>yc :YodeCreateSeditorFloating<cr>
  noremap <leader>yr :YodeCreateSeditorReplace<cr>
  nnoremap <leader>yd <cmd>YodeBufferDelete<cr>

  nnoremap <leader>y<space> <cmd>YodeGoToAlternateBuffer<cr>
  nnoremap <leader>yF <cmd>YodeCloneCurrentIntoFloat<cr>
  nnoremap <leader>ym <cmd>YodeFloatToMainWindow<cr>
  nnoremap <leader>yww <cmd>YodeFormatWrite<cr>
  nnoremap <leader>yf <cmd>YodeRunInFile<cr>
  map <C-W>yj :YodeLayoutShiftWinDown<CR>
  map <C-W>yk :YodeLayoutShiftWinUp<CR>
  map <C-W>yJ :YodeLayoutShiftWinBottom<CR>
  map <C-W>yK :YodeLayoutShiftWinTop<CR>

  ]]
end
M.init = function()
  M.mapKeys()
end
M.config = function()
  require("yode-nvim").setup({})
end

return M
