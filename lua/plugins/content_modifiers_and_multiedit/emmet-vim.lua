return {
	"mattn/emmet-vim",
	keys = { { "<C-;>,", mode = {"i", "v", "n"} } },

	init = function()
		vim.g.user_emmet_mode = "a" -- enable all function in all mode.

		vim.g.user_emmet_leader_key = "<C-;>"
	end,
}
