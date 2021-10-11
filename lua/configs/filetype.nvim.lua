local M = {}

M.init = function()
  -- Do not source the default filetype.vim
  vim.g.did_load_filetypes = 1
end

return M
