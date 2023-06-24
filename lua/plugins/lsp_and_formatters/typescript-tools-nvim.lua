return {
	"pmizio/typescript-tools.nvim",
    event = { "BufReadPre", "BufNewFile" },
	ft = { "typescript", "typescriptreact" },
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("typescript-tools").setup({

			on_attach = function(client, bufnr)
				require("user.on_attach").on_attach(client, bufnr)
			end,
			settings = {
				-- spawn additional tsserver instance to calculate diagnostics on it
				separate_diagnostic_server = true,
				-- "change"|"insert_leave" determine when the client asks the server about diagnostic
				publish_diagnostic_on = "insert_leave",
				-- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
				-- (see 💅 `styled-components` support section)
				tsserver_plugins = { "typescript-styled-plugin" },
				-- described below
				tsserver_format_options = {
					insertSpaceAfterCommaDelimiter = true,
					insertSpaceAfterConstructor = false,
					insertSpaceAfterSemicolonInForStatements = true,
					insertSpaceBeforeAndAfterBinaryOperators = true,
					insertSpaceAfterKeywordsInControlFlowStatements = true,
					insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
					insertSpaceBeforeFunctionParenthesis = false,
					insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
					insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
					insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
					insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
					insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
					insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
					insertSpaceAfterTypeAssertion = false,
					placeOpenBraceOnNewLineForFunctions = false,
					placeOpenBraceOnNewLineForControlBlocks = false,
					semicolons = "ignore",
					indentSwitchCase = true,
				},
				tsserver_file_preferences = {
					quotePreference = "auto",
					importModuleSpecifierEnding = "auto",
					jsxAttributeCompletionStyle = "auto",
					allowTextChangesInNewFiles = true,
					providePrefixAndSuffixTextForRename = true,
					allowRenameOfImportPath = true,
					includeAutomaticOptionalChainCompletions = true,
					provideRefactorNotApplicableReason = true,
					generateReturnInDocTemplate = true,
					includeCompletionsForImportStatements = true,
					includeCompletionsWithSnippetText = true,
					includeCompletionsWithClassMemberSnippets = true,
					includeCompletionsWithObjectLiteralMethodSnippets = true,
					useLabelDetailsInCompletionEntries = true,
					allowIncompleteCompletions = true,
					displayPartsForJSDoc = true,
					disableLineTextInReferences = true,
					includeInlayParameterNameHints = "none",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = false,
					includeInlayVariableTypeHints = false,
					includeInlayVariableTypeHintsWhenTypeMatchesName = false,
					includeInlayPropertyDeclarationTypeHints = false,
					includeInlayFunctionLikeReturnTypeHints = false,
					includeInlayEnumMemberValueHints = false,
				},
			},
		})
	end,
}
