return {
	"Wansmer/treesj",
	keys = { "gS", "gJ" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		local tsj = require("treesj")

		local langs = { --[[ configuration for languages ]]
			"Javascript",
			"Typescript",
			"Tsx",
			"Jsx",
			"Lua",
			"CSS",
			"SCSS",
			"HTML",
			"Pug",
			"Vue",
			"Svelte",
			"JSON",
			"JSONC",
			"Toml",
			"Yaml",
			"PHP",
			"Ruby",
			"Python",
			"Starlark",
			"Go",
			"Java",
			"Rust",
			"R",
			"C/C++",
			"Nix",
			"Kotlin",
			"Bash",
			"SQL",
			"Dart",
		}

		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = "*",
			callback = function()
				local opts = { buffer = true }
				if langs[vim.bo.filetype] then
					vim.keymap.set("n", "gS", "<Cmd>TSJSplit<CR>", opts)
					vim.keymap.set("n", "gJ", "<Cmd>TSJJoin<CR>", opts)
				else
					vim.keymap.set("n", "gS", "<Cmd>SplitjoinSplit<CR>", opts)
					vim.keymap.set("n", "gJ", "<Cmd>SplitjoinJoin<CR>", opts)
				end
			end,
		})

		tsj.setup({
			-- Use default keymaps
			-- (<space>m - toggle, <space>j - join, <space>s - split)
			use_default_keymaps = false,

			-- Node with syntax error will not be formatted
			check_syntax_error = true,

			-- If line after join will be longer than max value,
			-- node will not be formatted
			max_join_length = 120,

			-- hold|start|end:
			-- hold - cursor follows the node/place on which it was called
			-- start - cursor jumps to the first symbol of the node being formatted
			-- end - cursor jumps to the last symbol of the node being formatted
			cursor_behavior = "hold",

			-- Notify about possible problems or not
			notify = true,
			langs = langs,

			-- Use `dot` for repeat action
			dot_repeat = true,
		})
	end,
}
