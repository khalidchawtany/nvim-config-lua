return {
	"SmiteshP/nvim-navbuddy",
	dependencies = {
		"neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>nb",
			function()
				require("nvim-navbuddy").open()
			end,
			desc = "Navbuddy",
		},
	},
	-- cmd = { "Navbuddy" },
	-- :lua require("nvim-navbuddy").open()
	init = function()
		local navbuddy_augroup = vim.api.nvim_create_augroup("navbuddy", { clear = false })
		vim.api.nvim_clear_autocmds({
			group = navbuddy_augroup,
		})
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client.server_capabilities.documentSymbolProvider then
					require("nvim-navbuddy").attach(client, bufnr)
				else
					-- dump(client)
				end
			end,
		})
	end,
	config = function()
		local actions = require("nvim-navbuddy.actions")

		require("nvim-navbuddy").setup({
			lsp = {
				auto_attach = false, -- If set to true, you don't need to manually use attach function
				-- preference = nil  -- list of lsp server names in order of preference
			},
			use_default_mappings = true, -- If set to false, only mappings set
			-- by user are set. Else default
			-- mappings are used for keys
			-- that are not set by user
			mappings = {
				["<esc>"] = actions.close(), -- Close and cursor to original location
				["q"] = actions.close(),

				["j"] = actions.next_sibling(), -- down
				["k"] = actions.previous_sibling(), -- up

				["h"] = actions.parent(), -- Move to left panel
				["l"] = actions.children(), -- Move to right panel
				["0"] = actions.root(), -- Move to first panel

				["v"] = actions.visual_name(), -- Visual selection of name
				["V"] = actions.visual_scope(), -- Visual selection of scope

				["y"] = actions.yank_name(), -- Yank the name to system clipboard "+
				["Y"] = actions.yank_scope(), -- Yank the scope to system clipboard "+

				["i"] = actions.insert_name(), -- Insert at start of name
				["I"] = actions.insert_scope(), -- Insert at start of scope

				["a"] = actions.append_name(), -- Insert at end of name
				["A"] = actions.append_scope(), -- Insert at end of scope

				["r"] = actions.rename(), -- Rename currently focused symbol

				["d"] = actions.delete(), -- Delete scope

				["f"] = actions.fold_create(), -- Create fold of current scope
				["F"] = actions.fold_delete(), -- Delete fold of current scope

				["c"] = actions.comment(), -- Comment out current scope

				["<enter>"] = actions.select(), -- Goto selected symbol
				["o"] = actions.select(),

				["J"] = actions.move_down(), -- Move focused node down
				["K"] = actions.move_up(), -- Move focused node up

				["t"] = actions.telescope({ -- Fuzzy finder at current level.
					layout_config = { -- All options that can be
						height = 0.60, -- passed to telescope.nvim's
						width = 0.60, -- default can be passed here.
						prompt_position = "top",
						preview_width = 0.50,
					},
					layout_strategy = "horizontal",
				}),

				["g?"] = actions.help(), -- Open mappings help window
			},
		})
	end,
}
