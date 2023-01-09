return {
  "uga-rosa/ccc.nvim", -- colizer and color picker
  keys = {
    {
      "<c-s>cc",
      function()
        require("ccc.ui"):open(false)
      end,
      desc = "Color picker",
      mode = {"n", "i"}
    }
  }
}

-- vim.keymap.set("n", "<c-s>cc", "<cmd>lua require('ccc.ui'):open(false)<Cr>", {noremap = true, silent = true})
