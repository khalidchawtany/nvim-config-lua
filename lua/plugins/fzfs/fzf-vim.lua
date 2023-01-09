vim.cmd [[source ~/.config/nvim/lua/_fzf.vim]]
return {
  "junegunn/fzf.vim",
  dependencies = {"junegunn/fzf"},
  cmd = {"FzfFiles", "FZF", "FzfLines", "FzfBLines", "FzfAg"},
  -- TODO: fix me for FZF
  config = function()
    vim.cmd [[source ~/.config/nvim/lua/_fzf.vim]]
  end
}
