local M = {
   requires = 'anuvyklack/nvim-keymap-amend' -- only for preview
}
M.config = function()
  require("pretty-fold").setup {}
  require('pretty-fold.preview').setup()
end
return M
