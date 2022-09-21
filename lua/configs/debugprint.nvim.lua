local M = {
  module = "debugprint"
}

M.init = function()
  vim.keymap.set(
    "n",
    "g<Leader>p",
    function()
      require("debugprint").debugprint()
    end
  )
  vim.keymap.set(
    "n",
    "g<Leader>P",
    function()
      require("debugprint").debugprint({above = true})
    end
  )
  vim.keymap.set(
    "n",
    "g<Leader>j",
    function()
      require("debugprint").debugprint({variable = true})
    end
  )
  vim.keymap.set(
    "n",
    "g<Leader>k",
    function()
      require("debugprint").debugprint({above = true, variable = true})
    end
  )

  vim.api.nvim_create_user_command(
    "DeleteDebugs",
    function(opts)
      -- Note: you must set `range=true` and pass through opts for ranges to work
      M.deleteprints(opts)
    end,
    {range = true}
  )
  vim.keymap.set(
    "n",
    "g<leader>d",
    function()
      M.deleteprints()
    end
  )
end
M.config = function()
  local php = {
    left = 'print "',
    right = '"',
    mid_var = "${",
    right_var = '}"'
  }

  require("debugprint").add_custom_filetypes({php})

  require("debugprint").setup(
    {
      create_keymaps = false,
      create_commands = false,
      filetypes = {php}
    }
  )
end
return M
