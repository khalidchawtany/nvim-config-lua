local M = function()
  -- module = "marks",
end

M.config = function()
  require "marks".setup {
    signs = true,
    default_mappings = true
  }
end

return M
