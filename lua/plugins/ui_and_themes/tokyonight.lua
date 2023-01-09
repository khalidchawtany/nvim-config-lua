return {
	"folke/tokyonight.nvim",
	config = function()
		vim.g.tokyonight_style = "knight" -- storm, knight, day
		vim.g.tokyonight_italic_functions = true
		vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
		vim.g.tokyonight_hide_inactive_statusline = false
		---vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}
		vim.cmd([[colorscheme tokyonight]])
	end
}
