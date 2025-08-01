return {
	"akinsho/flutter-tools.nvim",
	-- lazy = false,
	-- event = "VeryLazy",
	ft = "dart",
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

		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = "dart",
			callback = function()
				vim.keymap.set(
					"n",
					"<leader>oo",
					"<cmd>FlutterOutlineToggle<CR>",
					{ silent = true, buffer = true, desc = "Flutter - Outline Toggle" }
				)
				vim.keymap.set(
					"n",
					"<leader>or",
					"<cmd>FlutterLspRestart<CR>",
					{ silent = true, buffer = true, desc = "Flutter - LspRestart" }
				)
			end,
		})

		require("flutter-tools").setup({
			ui = {
				-- the border type to use for all floating windows, the same options/formats
				-- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
				border = "rounded",
				-- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
				-- please note that this option is eventually going to be deprecated and users will need to
				-- depend on plugins like `nvim-notify` instead.
				notification_style = "native", -- | "plugin",
			},
			decorations = {
				statusline = {
					-- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
					-- this will show the current version of the flutter app from the pubspec.yaml file
					app_version = false,
					-- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
					-- this will show the currently running device if an application was started with a specific
					-- device
					device = false,
				},
			},
			-- debugger = {
			-- 	-- integrate with nvim dap + install dart code debugger
			-- 	enabled = false,
			-- 	run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
			-- 	-- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
			-- 	-- see |:help dap.set_exception_breakpoints()| for more info
			-- 	exception_breakpoints = {},
			-- 	register_configurations = function(paths)
			-- 		require("dap").configurations.dart = {
			-- 			-- <put here config that you would find in .vscode/launch.json>
			-- 		}
			-- 	end,
			-- },
			-- flutter_path = "<full/path/if/needed>", -- <-- this takes priority over the lookup
			-- flutter_lookup_cmd = nil,      -- example "dirname $(which flutter)" or "asdf where flutter"
			fvm = false,                   -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
			widget_guides = {
				enabled = true,
			},
			closing_tags = {
				highlight = "Comment", -- highlight for the closing tag
				prefix = "// ", -- character to use for close tag e.g. > Widget
				enabled = true, -- set to false to disable
			},
			dev_log = {
				enabled = true,
				open_cmd = "tabedit", -- command to use to open the log buffer
			},
			dev_tools = {
				autostart = false, -- autostart devtools server if not detected
				auto_open_browser = false, -- Automatically opens devtools in the browser
			},
			outline = {
				open_cmd = "30vnew", -- command to use to open the outline buffer
				auto_open = true, -- if true this will open the outline automatically when it is first populated
			},
			lsp = {
				color = {
					-- show the derived colours for dart variables
					enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
					background = true, -- highlight the background
					background_color = { r = 19, g = 17, b = 24}, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
					foreground = false, -- highlight the foreground
					virtual_text = true, -- show the highlight using virtual text
					virtual_text_str = "", -- the virtual text character to highlight
				},
				-- capabilities = my_custom_capabilities -- e.g. lsp_status capabilities
				-- --- OR you can specify a function to deactivate or change or control how the config is created
				-- capabilities = function(config)
				-- 	config.specificThingIDontWant = false
				-- 	return config
				-- end,
				-- see the link below for details on each option:
				-- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
				settings = {
					lineLength = 100,
					showTodos = true,
					completeFunctionCalls = true,
					-- analysisExcludedFolders = { "<path-to-flutter-sdk-packages>" },
					renameFilesWithClasses = "prompt", -- "always"
					enableSnippets = true,
				},
			},
		})


		require("telescope").load_extension("flutter")
	end,
}
