vim.cmd([[source ~/.config/nvim/lua/_fzf.vim]])
return {
	"junegunn/fzf.vim",
	dependencies = { "junegunn/fzf" },
    keys = {"<c-p><c-o>"},
	cmd = {
		"FZF",
		"FzfAg",
		"FzfBCommits",
		"FzfBLines",
		"FzfBTags",
		"FzfColors",
		"FzfCommands",
		"FzfCommits",
		"FzfFiles",
		"FzfGFiles",
		"FzfGitFiles",
		"FzfHelpOctober",
		"FzfHelpTic",
		"FzfHelptags",
		"FzfHistory",
		"FzfLines",
		"FzfLocate",
		"FzfLua",
		"FzfMaps",
		"FzfMarks",
		"FzfMarks",
		"FzfSnippets",
		"FzfTags",
		"FzfWindows",
	},
	-- TODO: fix me for FZF
	config = function()
		vim.cmd([[source ~/.config/nvim/lua/_fzf.vim]])
	end,
}
