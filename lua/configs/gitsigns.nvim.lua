local M = {requires = {'nvim-lua/plenary.nvim'}}

M.config = function()
    require('gitsigns').setup()
end
return M
