return {
  "danymat/neogen", -- Documentation and annotation,
  dependencies = "nvim-treesitter/nvim-treesitter",
  cmd = {"Neogen"}, -- :Neogen func|class|type|...
  keys = {
    {"<leader>dgd", ":lua require('neogen').generate()<CR>", desc = "Annotate (Neogen)"},
    {"<leader>dgg", ":lua require('neogen').generate()<CR>", desc = "Annotate (Neogen)"},
    {"<leader>dgc", ":lua require('neogen').generate({type='class')<CR>", desc = "Annotate Class (Neogen)"},
    {"<M-]>", "<C-G>u<cmd>lua require('neogen').jump_next<CR>", desc = "Neogen (Next)"},
    {"<M-[>", "<C-G>u<cmd>lua require('neogen').jump_prev<CR>", desc = "Neogen (Prev)"}
  },
  config = function()
    require("neogen").setup {
      enabled = true
    }
  end
}
