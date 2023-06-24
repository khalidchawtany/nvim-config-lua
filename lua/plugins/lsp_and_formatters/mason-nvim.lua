local M = {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	event = "BufReadPre",
}

M.config = function()
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
			},
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = { "lua_ls" },
	})

	-- local lspconfig = require('lspconfig')
	-- local lsp_defaults = lspconfig.util.default_config
	--
	-- lsp_defaults.capabilities = vim.tbl_deep_extend(
	-- 	'force',
	-- 	lsp_defaults.capabilities,
	-- 	require('cmp_nvim_lsp').default_capabilities()
	-- )

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		-- Enable signs
		signs = true,
		virtual_text = false,
		underline = true,
		update_in_insert = false,
	})

	local on_attach = function(client, bufnr)
		require("user.on_attach").on_attach(client, bufnr)
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()

	-- You are now capable!
	capabilities.textDocument.colorProvider = {
		dynamicRegistration = true,
	}

	-- Lsp servers that support documentColor
	require("lspconfig").tailwindcss.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	require("mason-lspconfig").setup_handlers({
		-- The first entry (without a key) will be the default handler
		-- and will be called for each installed server that doesn't have
		-- a dedicated handler.
		function(server_name) -- default handler (optional)
			local opts = {}
			opts.on_attach = on_attach
			require("lspconfig")[server_name].setup(opts)
		end,
		-- Next, you can provide targeted overrides for specific servers.
		-- For example, a handler override for the `rust_analyzer`:
		-- ["rust_analyzer"] = function()
		--   require("rust-tools").setup {}
		-- end,
		["texlab"] = function()
			require("lspconfig").texlab.setup({
				settings = {
					texlab = {
						build = {
							onSave = true,
							executable = "tectonic",
							args = vim.split("%f --synctex", " "),
						},
						forwardSearch = {
							executable = "zathura",
							args = { "--synctex-forward", "%l:1:%f", "%p" },
						},
					},
				},
			})
		end,
		["unocss"] = function()
			require("lspconfig").unocss.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				-- filetypes = { ... },
				root_dir = function(fname)
					return require("lspconfig.util").root_pattern(".git")(fname)
				end,
			})
		end,
		["lua_ls"] = function()
			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {
						-- completion = {
						-- 	keywordSnippet  = "Disable"  -- prevent duplicate snippets from luasnip and LSP
						-- },
						diagnostics = {
							globals = { "vim", "use", "require" },
						},
						hint = {
							enable = true,
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
							-- prevent lua being asked to configure workspace
							checkThirdParty = false,
						},
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = {
							enable = false,
						},
					},
				},
			})
		end,
		["tailwindcss"] = function()
			-- Lsp servers that support documentColor
			require("lspconfig").tailwindcss.setup({
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = {
								"cva\\(([^)]*)\\)",
								"[\"'`]([^\"'`]*).*?[\"'`]",
							},
						},
					},
				},
			})
		end,
	})
end
return M
