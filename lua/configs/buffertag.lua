local M = {}

M.config = function()
 require('buffertag').setup()
end
    -- accepts any border options that `nvim_open_win` accepts.
    -- see ":help vim.api.nvim_open_win"
    -- border = "none",

return M
