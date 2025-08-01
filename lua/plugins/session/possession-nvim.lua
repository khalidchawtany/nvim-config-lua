local M = {
	"jedrzejboczar/possession.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VimEnter",
	cmd = {
		"SSave",
		"SLoad",
		"SClose",
		"SDelete",
		"SShow",
		"SList",
		"SMigrate",
	},
	keys = {
		{ "<c-s>\\", "<cmd>Telescope possession list<cr>", desc = "Sessions (Telescope)" },
	},
}

-- Usage
-- commands or require('telescope').load_extension('possession')
-- :Telescope possession list
-- require('telescope').extensions.possession.list()

M.config = function()
	local Path = require("plenary.path")

	require("possession").setup({
		session_dir = (Path:new(vim.fn.stdpath("data")) / "possession"):absolute(),
		silent = true,
		load_silent = true,
		debug = false,
		prompt_no_cr = false,
		autoload = false, --false | string | function(): string => last, auto_cwd, last_cwd

		autosave = {
			current = true, -- or fun(name): boolean
			cwd = true,
			tmp = true, -- or fun(): boolean
			tmp_name = "tmp",
			on_load = true,
			on_quit = true,
		},
		commands = {
			save = "SSave",
			load = "SLoad",
			close = "SClose",
			delete = "SDelete",
			show = "SShow",
			list = "SList",
			migrate = "SMigrate",
		},
		hooks = {
			before_save = function(name)
				return {}
			end,
			after_save = function(name, user_data, aborted) end,
			before_load = function(name, user_data)
				return user_data
			end,
			after_load = function(name, user_data) end,
		},
		plugins = {
			close_windows = {
				hooks = { "before_save", "before_load" },
				preserve_layout = true, -- or fun(win): boolean
				match = {
					floating = true,
					buftype = {},
					filetype = {'DiffViewFiles'},
					custom = false, -- or fun(win): boolean
				},
			},
			delete_hidden_buffers = {
				hooks = {
					"before_load",
					vim.o.sessionoptions:match("buffer") and "before_save",
				},
				force = false, -- or fun(buf): boolean
			},
			nvim_tree = true,
			tabby = true,
			delete_buffers = false,
		},
	})

	require("telescope").load_extension("possession")
end
return M
