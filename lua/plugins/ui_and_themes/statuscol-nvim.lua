return {
  "luukvbaal/statuscol.nvim",
  lazy = true,
  config = function()
    require("statuscol").setup()

    vim.o.statuscolumn = "%@v:lua.ScFa@%C%T%@v:lua.ScLa@%s%T@v:lua.ScNa@%=%{v:lua.ScLn()}%T"
  end
}
