local M = {
  cmd = {"ComAnnotation", "ComComment"}
}

M.init = function()
  vim.keymap.set("n", "gcj", "<cmd>ComAnnotation<Cr>", {noremap = true, silent = true})
  vim.keymap.set("n", "gck", "<cmd>ComComment<cr>", {noremap = true, silent = true})
  vim.keymap.set("x", "gck", "<cmd>ComComment<cr>", {noremap = true, silent = true})

  -- local custom_template = require("coman").custom_template
  -- -- tbl is the function relate table. index 1 is function name
  -- -- others are params name with type (if have)
  -- custom_template["c"] = function(tbl, cms)
  --   return {}
  -- end
end

return M
