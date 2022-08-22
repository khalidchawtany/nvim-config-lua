local M = {event = "BufRead"}

M.config = function()
  require("document-color").setup {
    -- Default options
    mode = "background" -- "background" | "foreground" | "single"
  }
end
return M
