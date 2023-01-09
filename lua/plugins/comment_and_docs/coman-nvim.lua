local M = {
  "glepnir/coman.nvim", -- comments and annotation,
  cmd = {"ComAnnotation", "ComComment"},
  keys = {
    {"gcj", "<cmd>ComAnnotation<cr>", desc = "Annotation"},
    {"gck", "<cmd>ComComment<cr>", desc = "Annotation (Comment)"},
    {"gck", ":ComComment<cr>", desc = "Annotation (Comment)", mode = {"x"}}
  }
}

M.init = function()
  -- local custom_template = require("coman").custom_template
  -- -- tbl is the function relate table. index 1 is function name
  -- -- others are params name with type (if have)
  -- custom_template["c"] = function(tbl, cms)
  --   return {}
  -- end
end

return M
