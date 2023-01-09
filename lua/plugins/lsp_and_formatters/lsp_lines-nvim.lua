local M = {
  url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  dependencies = {"folke/trouble.nvim"},
  keys = {
    {
      "<Leader>l",
	  function()
		require("lsp_lines").toggle()
      end,
      desc = "Toggle lsp_lines"
    }
  }
}

M.config = function()
  vim.diagnostic.config(
    {
      virtual_text = false,
      virtual_lines = {only_current_line = true}
    }
  )
  require("lsp_lines").setup()
end
return M
