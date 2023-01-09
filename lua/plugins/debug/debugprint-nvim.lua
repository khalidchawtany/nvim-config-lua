return {
  "andrewferrier/debugprint.nvim",
  keys = {
    {
      "g<Leader>P",
      function()
        require("debugprint").debugprint({above = true})
      end,
      desc = "Debugprint Above"
    },
    {
      "g<Leader>p",
      function()
        require("debugprint").debugprint()
      end,
      desc = "Debugprint Belog"
    },
    {
      "g<Leader>j",
      function()
        require("debugprint").debugprint({variable = true})
      end,
      desc = "Debugprint Var"
    },
    {
      "g<Leader>k",
      function()
        require("debugprint").debugprint({variable = true, above = true})
      end,
      desc = "Debugprint Var Above"
    },
    {
      "g<Leader>d",
      function()
        require("debugprint").deleteprints()
      end,
      desc = "Debugprint Delete"
    }
  },
  config = function()
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
}
