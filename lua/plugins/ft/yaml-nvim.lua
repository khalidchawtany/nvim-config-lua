return {
  "cuducos/yaml.nvim",
  ft = "yaml",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim" -- optional
  },
  config = function()
    require("yaml_nvim").setup({ ft = { "yaml",  } })
  end
}
