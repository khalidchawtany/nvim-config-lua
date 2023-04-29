return {
	"echasnovski/mini.colors",
	version = false,
	cmd = { "MiniColors", "Colorscheme" },
	init = function()
		vim.api.nvim_create_user_command("MiniColors", function()
			require("mini.colors").interactive()
		end, {})
	end,
	config = function()
		require("mini.colors").setup()
	end,
}
