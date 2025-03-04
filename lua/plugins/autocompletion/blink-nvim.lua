return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = {
		"rafamadriz/friendly-snippets",
		"mikavilpas/blink-ripgrep.nvim",
		"fang2hou/blink-copilot",
		{
			"saghen/blink.compat",
			opts = {
				enable_events = true,
				impersonate_nvim_cmp = true,
			},
		},

		{
			"buschco/nvim-cmp-ts-tag-close",
			config = function()
				require("nvim-cmp-ts-tag-close").setup({ skip_tags = { "img" } })
			end,
		},
		{
			"Exafunction/codeium.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			config = function()
				require("codeium").setup({
					virtual_text = {
						enabled = true,
						map_keys = true,
						key_bindings = {
							-- Accept the current completion.
							accept = "<c-\\>",
							-- Accept the next word.
							accept_word = false,
							-- Accept the next line.
							accept_line = false,
							-- Clear the virtual text.
							clear = false,
							-- Cycle to the next completion.
							next = "<M-]>",
							-- Cycle to the previous completion.
							prev = "<M-[>",
						},
					},
				})
				require("codeium.notify").error = function(msg, ...)
					-- dd(msg)
				end
			end,
			cmd = "Codeium",
			build = ":Codeium Auth",
		},
	},

	-- use a release tag to download pre-built binaries
	version = "*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = {
			-- set to 'none' to disable the 'default' preset
			preset = "default",

			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },

			-- disable a keymap from the preset
			-- ["<C-e>"] = {},
			-- ["u"] = {},

			-- ["<Cr>"] = {},
			["<CR>"] = { "accept", "fallback" },

			-- show with a list of providers
			["<C-space>"] = {
				function(cmp)
					cmp.show({})
				end,
			},
			["<C-s>"] = {
				function(cmp)
					cmp.show({ providers = { "snippets" } })
				end,
			},
			["<C-l>"] = {
				function(cmp)
					cmp.show({ providers = { "copilot", "codeium", "codecompanion" } })
				end,
			},

			-- control whether the next command will be run when using a function
			-- ["<C-n>"] = {
			-- 	function(cmp)
			-- 		if some_condition then
			-- 			return
			-- 		end -- runs the next command
			-- 		return true -- doesn't run the next command
			-- 	end,
			-- 	"select_next",
			-- },

			-- term = {}

			-- 👇🏻👇🏻 (optional) add a keymap to invoke the search manually
			["<c-g>"] = {
				function()
					-- invoke manually, requires blink >v0.8.0
					require("blink-cmp").show({ providers = { "ripgrep" } })
				end,
			},
		},
		-- Disable for some filetypes
		enabled = function()
			return not vim.tbl_contains({ "oil", "minifiles" }, vim.bo.filetype)
				and vim.bo.buftype ~= "prompt"
				and vim.b.completion ~= false
		end,

		-- optionally, separate cmdline and terminal keymaps
		cmdline = {
			-- Disable cmdline
			enabled = false,
			keymap = {
				-- sets <CR> to accept the item and run the command immediately
				-- use `select_accept_and_enter` to accept the item or the first item if none are selected
				["<CR>"] = { "accept_and_enter", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
			},
		},
		signature = { enabled = true },
		completion = {
			-- accept = { dot_repeat = false },

			menu = {
				-- Don't show completion menu automatically in cmdline mode
				-- Don't show completion menu automatically when searching
				auto_show = function(ctx)
					return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
				end,

				draw = {
					treesitter = { "lsp" },

					columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "source_name" } },
					-- columns = { {"kind_icon", "label", "label_description", gap = 1 }, { "kind", "source_name" } },
					-- columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
			ghost_text = { enabled = false },
			list = {
				-- Change selection type per mode
				selection = {
					preselect = function(ctx)
						return ctx.mode ~= "cmdline"
					end,
					auto_insert = function(ctx)
						return ctx.mode ~= "cmdline"
					end,
				},
			},
		},
		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = {
				"path",
				"snippets",
				"lsp",
				"copilot",
				"codeium",
				"buffer",
				"ripgrep",
				"codecompanion",
			},
			per_filetype = {
				sql = {
					"dadbod",
					"path",
					"snippets",
					"lsp",
					"copilot",
					"codeium",
					"buffer",
					"ripgrep",
					"codecompanion",
				},
				htm = {
					"path",
					"snippets",
					"lsp",
					"copilot",
					"codeium",
					"buffer",
					"ripgrep",
					"codecompanion",
					"nvim-cmp-ts-tag-close",
				},
				html = {
					"path",
					"snippets",
					"lsp",
					"copilot",
					"codeium",
					"buffer",
					"ripgrep",
					"codecompanion",
					"nvim-cmp-ts-tag-close",
				},
				php = {
					"path",
					"snippets",
					"lsp",
					"copilot",
					"codeium",
					"buffer",
					"ripgrep",
					"codecompanion",
					"nvim-cmp-ts-tag-close",
				},
				blade = {
					"path",
					"snippets",
					"lsp",
					"copilot",
					"codeium",
					"buffer",
					"ripgrep",
					"codecompanion",
					"nvim-cmp-ts-tag-close",
				},
			},
			-- If you'd prefer the menu doesn't popup when typing abbreviations like wq, you may set the minimum keyword length to 2 when typing the command.
			min_keyword_length = function(ctx)
				-- only applies when typing a command, doesn't apply to arguments
				-- if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
				--     return 2
				-- end
				return 0
			end,
			providers = {
				["nvim-cmp-ts-tag-close"] = {
					name = "nvim-cmp-ts-tag-close",
					module = "blink.compat.source",
				},
				cmdline = {
					-- ignores cmdline completions when executing shell commands
					enabled = function()
						return vim.fn.getcmdtype() ~= ":" or not vim.fn.getcmdline():match("^[%%0-9,'<>%-]*!")
					end,
				},

				dadbod = {
					score_offset = 800,
					name = "Dadbod",
					module = "vim_dadbod_completion.blink",
				},

				path = {
					opts = {
						get_cwd = function(_)
							return vim.fn.getcwd()
						end,
					},
					score_offset = 700,
				},

				snippets = {
					score_offset = 600,
				},

				lsp = {
					name = "LSP",
					module = "blink.cmp.sources.lsp",
					opts = {}, -- Passed to the source directly, varies by source

					--- NOTE: All of these options may be functions to get dynamic behavior
					--- See the type definitions for more information
					enabled = true, -- Whether or not to enable the provider
					async = false, -- Whether we should wait for the provider to return before showing the completions
					timeout_ms = 2000, -- How long to wait for the provider to return before showing completions and treating it as asynchronous
					transform_items = nil, -- Function to transform the items before they're returned
					should_show_items = true, -- Whether or not to show the items
					max_items = nil, -- Maximum number of items to display in the menu
					min_keyword_length = 0, -- Minimum number of characters in the keyword to trigger the provider
					-- If this provider returns 0 items, it will fallback to these providers.
					-- If multiple providers falback to the same provider, all of the providers must return 0 items for it to fallback
					fallbacks = {},
					score_offset = 500, -- Boost/penalize the score of the items
					override = nil, -- Override the source's functions
				},

				codecompanion = {
					name = "CodeCompanion",
					module = "codecompanion.providers.completion.blink",
					score_offset = 500,
				},

				copilot = {
					name = "copilot",
					module = "blink-copilot",
					score_offset = 400,
					async = true,
					opts = {
						-- Local options override global ones
						-- Final settings: max_completions = 3, max_attempts = 2, kind = "Copilot"
						max_completions = 3, -- Override global max_completions
						max_attempts = 4,
						kind = "Copilot",
						debounce = 750, ---@type integer | false
						auto_refresh = {
							backward = true,
							forward = true,
						},
					},
				},

				codeium = {
					name = "codeium",
					module = "blink.compat.source",
					score_offset = 300,
				},

				buffer = {
					score_offset = 200,
					opts = {
						-- get all buffers, even ones like neo-tree
						-- get_bufnrs = vim.api.nvim_list_bufs,
						-- or (recommended) filter to only "normal" buffers
						get_bufnrs = function()
							return vim.tbl_filter(function(bufnr)
								return vim.bo[bufnr].buftype == ""
							end, vim.api.nvim_list_bufs())
						end,
					},
				},

				-- 👇🏻👇🏻 add the ripgrep provider config below
				ripgrep = {
					module = "blink-ripgrep",
					name = "Ripgrep",

					score_offset = 100,
					-- the options below are optional, some default values are shown
					---@module "blink-ripgrep"
					---@type blink-ripgrep.Options
					opts = {
						-- For many options, see `rg --help` for an exact description of
						-- the values that ripgrep expects.

						-- the minimum length of the current word to start searching
						-- (if the word is shorter than this, the search will not start)
						prefix_min_len = 3,

						-- The number of lines to show around each match in the preview
						-- (documentation) window. For example, 5 means to show 5 lines
						-- before, then the match, and another 5 lines after the match.
						context_size = 5,

						-- The maximum file size of a file that ripgrep should include in
						-- its search. Useful when your project contains large files that
						-- might cause performance issues.
						-- Examples:
						-- "1024" (bytes by default), "200K", "1M", "1G", which will
						-- exclude files larger than that size.
						max_filesize = "1M",

						-- Specifies how to find the root of the project where the ripgrep
						-- search will start from. Accepts the same options as the marker
						-- given to `:h vim.fs.root()` which offers many possibilities for
						-- configuration. If none can be found, defaults to Neovim's cwd.
						--
						-- Examples:
						-- - ".git" (default)
						-- - { ".git", "package.json", ".root" }
						project_root_marker = ".git",

						-- Enable fallback to neovim cwd if project_root_marker is not
						-- found. Default: `true`, which means to use the cwd.
						project_root_fallback = true,

						-- The casing to use for the search in a format that ripgrep
						-- accepts. Defaults to "--ignore-case". See `rg --help` for all the
						-- available options ripgrep supports, but you can try
						-- "--case-sensitive" or "--smart-case".
						search_casing = "--ignore-case",

						-- (advanced) Any additional options you want to give to ripgrep.
						-- See `rg -h` for a list of all available options. Might be
						-- helpful in adjusting performance in specific situations.
						-- If you have an idea for a default, please open an issue!
						--
						-- Not everything will work (obviously).
						additional_rg_options = {},

						-- When a result is found for a file whose filetype does not have a
						-- treesitter parser installed, fall back to regex based highlighting
						-- that is bundled in Neovim.
						fallback_to_regex_highlighting = true,

						-- Absolute root paths where the rg command will not be executed.
						-- Usually you want to exclude paths using gitignore files or
						-- ripgrep specific ignore files, but this can be used to only
						-- ignore the paths in blink-ripgrep.nvim, maintaining the ability
						-- to use ripgrep for those paths on the command line. If you need
						-- to find out where the searches are executed, enable `debug` and
						-- look at `:messages`.
						ignore_paths = {},

						-- Any additional paths to search in, in addition to the project
						-- root. This can be useful if you want to include dictionary files
						-- (/usr/share/dict/words), framework documentation, or any other
						-- reference material that is not available within the project
						-- root.
						additional_paths = {},

						-- Features that are not yet stable and might change in the future.
						-- You can enable these to try them out beforehand, but be aware
						-- that they might change. Nothing is enabled by default.
						future_features = {
							-- Keymaps to toggle features on/off. This can be used to alter
							-- the behavior of the plugin without restarting Neovim. Nothing
							-- is enabled by default.
							toggles = {
								-- The keymap to toggle the plugin on and off from blink
								-- completion results. Example: "<leader>tg"
								on_off = "<leader>tg",
							},
						},

						-- Show debug information in `:messages` that can help in
						-- diagnosing issues with the plugin.
						debug = false,
					},
					-- (optional) customize how the results are displayed. Many options
					-- are available - make sure your lua LSP is set up so you get
					-- autocompletion help
					transform_items = function(_, items)
						for _, item in ipairs(items) do
							-- example: append a description to easily distinguish rg results
							item.labelDetails = {
								description = "(rg)",
							}
						end
						return items
					end,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
