return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,
					disable = {},
					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						-- refers to the code inside a markdown code block (as well as other things)
						["i["] = { query = "@block.inner", desc = "in block" },
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						-- ["af"] = "@function.outer",
						-- ["if"] = "@function.inner",
						["aC"] = "@class.outer",
						["iC"] = "@class.inner",
						-- ["ac"] = "@conditional.outer",
						-- ["ic"] = "@conditional.inner",
						["ae"] = "@block.outer",
						["ie"] = "@block.inner",
						["al"] = "@loop.outer",
						["il"] = "@loop.inner",
						["is"] = "@statement.inner",
						["as"] = "@statement.outer",
						["ad"] = "@comment.outer",
						["am"] = "@call.outer",
						["im"] = "@call.inner",
						-- you can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						-- ["iL"] = {
						--   -- you can define your own textobjects directly here
						--   python = "(function_definition) @function",
						--   cpp = "(function_definition) @function",
						--   c = "(function_definition) @function",
						--   java = "(method_declaration) @function"
						-- }
					},
					-- You can choose the select mode (default is charwise 'v')
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},
					-- If you set this to `true` (default is `false`) then any textobject is
					-- extended to include preceding xor succeeding whitespace. Succeeding
					-- whitespace has priority in order to act similarly to eg the built-in
					-- `ap`.
					include_surrounding_whitespace = true,
				},

				swap = {
					enable = true,
					swap_next = {
						["<leader>]]"] = { "@parameter.inner" },
					},
					swap_previous = {
						["<leader>[["] = { "@parameter.inner" },
					},
				},

				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},

				lsp_interop = {
					enable = true,
					border = "none",
					peek_definition_code = {
						["<leader>df"] = "@function.outer",
						["<leader>dF"] = "@class.outer",
					},
				},
			},
		})
	end,
}
