return {
	"akinsho/flutter-tools.nvim",
	-- lazy = false,
	-- event = "VeryLazy",
	ft="dart",
	-- cmd = {
	-- 	"FlutterRun",
	-- 	"FlutterDevices",
	-- 	"FlutterEmulators",
	-- 	"FlutterReload",
	-- 	"FlutterRestart",
	-- 	"FlutterQuit",
	-- 	"FlutterDetach",
	-- 	"FlutterOutlineToggle",
	-- 	"FlutterOutlineOpen",
	-- 	"FlutterDevTools",
	-- 	"FlutterDevToolsActivate",
	-- 	"FlutterCopyProfilerUrl",
	-- 	"FlutterLspRestart",
	-- 	"FlutterSuper",
	-- 	"FlutterReanalyze",
	-- },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({}) -- use defaults

		require("telescope").load_extension("flutter")
	end,
}
