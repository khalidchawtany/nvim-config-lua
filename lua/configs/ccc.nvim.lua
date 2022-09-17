local M = {
  module = "ccc.ui"
}

M.config = function()
  -- vim.keymap.set("n", "<c-s>cc", "<cmd>lua require('ccc.ui'):open(false)<Cr>", {noremap = true, silent = true})
  vim.keymap.set( "i", "<c-s>cc",
    function()
      require("ccc.ui"):open(false)
    end,
    {desc = "Color Picker"}
  )

  vim.keymap.set( "i", "<c-s>cc",
    function()
      require("ccc.ui"):open(true)
    end,
    {desc = "Color Picker (Insert)"}
  )
end
return M
