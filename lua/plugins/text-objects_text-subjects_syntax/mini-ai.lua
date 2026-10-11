return {
	"echasnovski/mini.ai",
	event = "VeryLazy",
	-- keys = {
	--   { "a", mode = { "x", "o" } },
	--   { "i", mode = { "x", "o" } },
	-- },
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			init = function()
				-- no need to load the plugin, since we only need its queries
				require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
			end,
		},
	},
	opts = function()
		local ai = require("mini.ai")

		return {

			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				-- Main textobject prefixes
				around = "a",
				inside = "i",

				-- Next/last variants
				-- NOTE: This (deliberately) overrides Neovim>=0.12 built-in incremental
				-- selection mappings. See `:h MiniAi-default-an-in` for more details.
				around_next = "an",
				inside_next = "in",
				around_last = "aL",
				inside_last = "iL",

				-- Move cursor to corresponding edge of `a` textobject
				goto_left = "g[",
				goto_right = "g]",
			},

			-- Number of lines within which textobject is searched
			n_lines = 50,

			-- How to search for object (first inside current line, then inside
			-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
			-- 'cover_or_nearest', 'next', 'previous', 'nearest'.
			search_method = "cover_or_next",

			-- Whether to disable showing non-error feedback
			-- This also affects (purely informational) helper messages shown after
			-- idle time if user input is required.
			silent = false,
			custom_textobjects = {
				o = ai.gen_spec.treesitter({
					a = { "@block.outer", "@conditional.outer", "@loop.outer" },
					i = { "@block.inner", "@conditional.inner", "@loop.inner" },
				}, {}),
				b = ai.gen_spec.treesitter({ a = "@block.outer", i = "@block.inner" }, {}),
				f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
				["-"] = ai.gen_spec.function_call({ name_pattern = "[%:%w_%.]" }),
				c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
			},
		}
	end,
	config = function(_, opts)
		local ai = require("mini.ai")
		ai.setup(opts)
	end,
}
