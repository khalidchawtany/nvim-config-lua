local M= {}

M.init = function ()
  vim.cmd [[
  let g:better_whitespace_guicolor='WarnColor'
  let g:better_whitespace_filetypes_blacklist = [ 'diff', 'git', 'gitcommit', 'qf', 'help', 'fugitive', 'dashboard' ]
  ]]
end

return M
