local M = {event = "BufRead"}

M.config = function()
    require("plugins.others").colorizer()
end

return M
