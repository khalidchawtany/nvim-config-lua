local M = {
    cmd = {"Glance"}

}
M.config = function()
  require("glance").setup({})
end
return M
