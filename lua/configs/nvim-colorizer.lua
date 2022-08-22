local M = {event = "BufRead"}

M.config = function()
  require('colorizer').setup({
    '*';
    -- An example
    '!css';
    '!html';
    '!tsx';
    '!dart';
  })
end

return M
