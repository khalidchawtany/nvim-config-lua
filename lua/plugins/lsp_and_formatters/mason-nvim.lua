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

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		-- Enable signs
		signs = true,
		virtual_text = false,
		underline = true,
		update_in_insert = false,
	})

	local on_attach = function(client, bufnr)
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		local function buf_set_option(...)
			vim.api.nvim_buf_set_option(bufnr, ...)
		end

		-- Enable completion triggered by <c-x><c-o>
		buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

		-- Mappings.
		local opts = { noremap = true, silent = true }

		-- See `:help vim.lsp.*` for documentation on any of the below functions
		--?????????????????????????????????????????????????--
		buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
		buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
		buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		buf_set_keymap("n", "g<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
		buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
		buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
		buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
		buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
		buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		buf_set_keymap("n", "<space>dl", "<cmd>lua vim.diagnostic.open_float(0, {scope='line'}) <CR>", opts)
		buf_set_keymap("n", "<space>dc", "<cmd>lua vim.diagnostic.open_float(0, {scope='cursor'}) <CR>", opts)
		buf_set_keymap("n", "<space>df", "<cmd>lua vim.diagnostic.open_float(0, {}) <CR>", opts)

		buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
		buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
		buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.set_loclist()<CR>", opts)

		-- Set some keybinds conditional on server capabilities
		if client.server_capabilities.document_formatting then
			buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
		elseif client.server_capabilities.document_range_formatting then
			buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
		end

		if client.server_capabilities.colorProvider then
			-- Attach document colour support
			-- TODO: we need to attach the nvim-colorizer
			-- require("document-color").buf_attach(bufnr)
		end

		-- Set autocommands conditional on server_capabilities
		if client.server_capabilities.document_highlight then
			vim.api.nvim_exec(
				[[
          augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
    ]],
				false
			)
		end
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
