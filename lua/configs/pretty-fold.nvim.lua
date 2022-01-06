local M = {}
M.config = function()
  require("pretty-fold").setup {}
  require("pretty-fold.preview").setup_keybinding()
end
return M
