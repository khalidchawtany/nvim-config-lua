return {
	"zeioth/garbage-day.nvim",
	dependencies = "neovim/nvim-lspconfig",
	event = "VeryLazy",
    enabled = true,
	opts = {
		-- your options here
	},
}
-- require("garbage-day.utils").stop_lsp()  -- stop all lsp clients.
-- require("garbage-day.utils").start_lsp() -- start lsp clients for the current buffer.
