return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"j-hui/fidget.nvim",
	},
	init = function()
		require("plugins.ai.codecompanion.fidget-spinner"):init()
	end,
	config = function()
		vim.keymap.set(
			{ "n", "v" },
			"<LocalLeader>l",
			"<cmd>CodeCompanionActions<cr>",
			{ noremap = true, silent = true }
		)
		vim.keymap.set(
			{ "n", "v" },
			"<LocalLeader>c",
			"<cmd>CodeCompanionChat Toggle<cr>",
			{ noremap = true, silent = true }
		)
		vim.keymap.set("v", "<LocalLeader>a", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

		-- Expand 'cc' into 'CodeCompanion' in the command line
		vim.cmd([[cab cc CodeCompanion]])

		require("codecompanion").setup({
			strategies = {
				chat = {
					adapter = "copilot",
					keymaps = {
						send = {
							modes = { n = "<C-s>", i = "<C-s>" },
						},
						close = {
							modes = { n = "<C-c>", i = "<C-c>" },
						},
						-- Add further custom keymaps here
					},
					slash_commands = {
						["Think_AND_Reason"] = require("plugins.ai.codecompanion.reasoning_slash_command"),
						["file"] = {
							-- Location to the slash command in CodeCompanion
							callback = "strategies.chat.slash_commands.file",
							description = "Select a file using Telescope",
							opts = {
								provider = "telescope", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
								contains_code = true,
							},
						},
						["buffer"] = {
							callback = "strategies.chat.slash_commands.buffer",
							description = "Insert open buffers",
							opts = {
								contains_code = true,
								provider = "telescope", -- default|telescope|mini_pick|fzf_lua
							},
						},
						["fetch"] = {
							callback = "strategies.chat.slash_commands.fetch",
							description = "Insert URL contents",
							opts = {
								adapter = "jina",
							},
						},
						["file"] = {
							callback = "strategies.chat.slash_commands.file",
							description = "Insert a file",
							opts = {
								contains_code = true,
								max_lines = 1000,
								provider = "telescope", -- default|telescope|mini_pick|fzf_lua
							},
						},
						["files"] = {
							callback = "strategies.chat.slash_commands.files",
							description = "Insert multiple files",
							opts = {
								contains_code = true,
								max_lines = 1000,
								provider = "telescope", -- default|telescope|mini_pick|fzf_lua
							},
						},
						["help"] = {
							callback = "strategies.chat.slash_commands.help",
							description = "Insert content from help tags",
							opts = {
								contains_code = false,
								provider = "telescope", -- telescope|mini_pick|fzf_lua
							},
						},
						["now"] = {
							callback = "strategies.chat.slash_commands.now",
							description = "Insert the current date and time",
							opts = {
								contains_code = false,
							},
						},
						["symbols"] = {
							callback = "strategies.chat.slash_commands.symbols",
							description = "Insert symbols for a selected file",
							opts = {
								contains_code = true,
								provider = "telescope", -- default|telescope|mini_pick|fzf_lua
							},
						},
						["terminal"] = {
							callback = "strategies.chat.slash_commands.terminal",
							description = "Insert terminal output",
							opts = {
								contains_code = false,
							},
						},
					},
				},
			},

			inline = {
				adapter = "copilot",
				keymaps = {
					accept_change = {
						modes = { n = "<LocalLeader>ea" },
						description = "Accept the suggested change",
					},
					reject_change = {
						modes = { n = "<LocalLeader>er" },
						description = "Reject the suggested change",
					},
				},
			},
			adapters = {
				-- copilot = function()
				-- 	return require("codecompanion.adapters").extend("copilot", {
				-- 		schema = {
				-- 			model = {
				-- 				default = "claude-3.5-sonnet",
				-- 			},
				-- 		},
				-- 	})
				-- end,
				-- anthropic = function()
				-- 	return require("codecompanion.adapters").extend("copilot", {
				-- 		env = {
				-- 			-- api_key = "cmd:op read op://personal/OpenAI/credential --no-newline",,
				-- 			-- api_key = "cmd:op read op://personal/OpenAI/credential --no-newline",,
				-- 		},
				-- 	})
				-- end,
				kimi = require("plugins.ai.codecompanion.kimi"),
				anthropic = function()
					return require("codecompanion.adapters").extend("anthropic", {
						env = {
							api_key = "cmd:cat ~/.local/share/nvim/keys/claude.txt",
						},
					})
				end,
			},
			display = {
				chat = {
					intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
					show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
					separator = "─", -- The separator between the different messages in the chat buffer
					show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
					show_settings = false, -- Show LLM settings at the top of the chat buffer?
					show_token_count = true, -- Show the token count for each response?
					start_in_insert_mode = false, -- Open the chat buffer in insert mode?
				},
				inline = {
					layout = "vertical", -- vertical|horizontal|buffer
				},
				action_palette = {
					width = 100,
					height = 15,
					prompt = "Prompt ", -- Prompt used for interactive LLM calls
					provider = "default", -- default|telescope|mini_pick
					opts = {
						show_default_actions = true, -- Show the default actions in the action palette?
						show_default_prompt_library = true, -- Show the default prompt library in the action palette?
					},
				},
				diff = {
					enabled = true,
					close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
					layout = "vertical", -- vertical|horizontal split for default provider
					opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
					provider = "mini_diff", -- default|mini_diff
				},
			},
			--  vim.keymap.set("n", "<LocalLeader>d", function()
			--   require("codecompanion").prompt("docs")
			-- end, { noremap = true, silent = true })
			prompt_library = {
				-- ["My New Prompt"] = {
				--     strategy = "chat",
				--     description = "Some cool custom prompt you can do",
				--     prompts = {
				--         {
				--             role = "system",
				--             content = "You are an experienced developer with Lua and Neovim",
				--         },
				--         {
				--             role = "user",
				--             content = "Can you explain why ..."
				--         }
				--     },
				-- },
				["Docusaurus"] = {
					strategy = "chat",
					description = "Write documentation for me",
					opts = {
						index = 11,
						is_slash_cmd = false,
						auto_submit = false,
						short_name = "docs",
					},
					references = {
						{
							type = "file",
							path = {
								"doc/.vitepress/config.mjs",
								"lua/codecompanion/config.lua",
								"README.md",
							},
						},
					},
					prompts = {
						{
							role = "user",
							content = [[I'm rewriting the documentation for my plugin CodeCompanion.nvim, as I'm moving to a vitepress website. Can you help me rewrite it?

                                                        I'm sharing my vitepress config file so you have the context of how the documentation website is structured in the `sidebar` section of that file.

                                                        I'm also sharing my `config.lua` file which I'm mapping to the `configuration` section of the sidebar.
                                                        ]],
						},
					},
				},
			},
		})
	end,
}
