local M = {after = "nvim-compe"}

M.config = function()
    require('nvim-autopairs').setup{}
end

return M

