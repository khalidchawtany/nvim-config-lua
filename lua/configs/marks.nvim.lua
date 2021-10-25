local M =  {
  -- module = "marks",
}

M.config = function()
  require "marks".setup {
    signs = true,
    default_mappings = false
  }
end

return M
