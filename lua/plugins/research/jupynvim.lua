return {
	"sheng-tse/jupynvim",
	build = function(plugin)
		local install = loadfile(plugin.dir .. "/lua/jupynvim/install.lua")()
		install.run(plugin)
	end,
	config = function()
		require("jupynvim").setup({
			-- Verbosity for both the Rust backend and the Lua frontend.
			log_level = "info", -- trace, debug, info, warn, or error

			-- How code-cell outputs and embedded markdown images are rendered.
			--   "placeholder" uses the Kitty Unicode placeholder protocol. The image
			--                 is anchored to buffer text and stays put when scrolling.
			--                 Required for animated GIFs.
			--   "kitty"       uses direct kitty placement. Lives at fixed screen
			--                 coordinates and doesn't follow scroll.
			--   "chafa"       is an ASCII-art fallback. Use this on terminals without
			--                 graphics support.
			image_renderer = "placeholder",

			-- Inline image grid size in terminal cells (rows x cols). Default 32x96
			-- works for typical matplotlib plots; bump for sharper output on large
			-- terminals or shrink for compact display.
			image_rows = 32,
			image_cols = 96,

			-- Override the path to the jupynvim-core binary. Auto-detected from the
			-- plugin directory if unset.
			core_path = nil,

			-- Per-action keymap overrides. Pass a string to replace the default lhs
			-- (mode and description preserved), `false` to disable a binding. The
			-- full action list lives in lua/jupynvim/keymaps.lua.
			keymaps = {
				-- run_advance = "<leader>jr",  -- example: rebind run-and-advance
				-- move_up = false,             -- example: disable move-cell-up
			},

			-- Skip the entire default keymap set if you want to bind everything yourself.
			disable_default_keymaps = false,

			-- Walk up from the notebook's directory to find a `.venv/bin/python` (or
			-- `.venv/Scripts/python.exe` on Windows) and use it as the kernel
			-- interpreter when ipykernel is installed there. Bypasses needing to
			-- register a per-project user kernel. Set false to use only registered
			-- kernelspecs.
			auto_venv = true,

			-- LSP servers to skip on jupynvim buffers. Useful for servers that
			-- misbehave on `.ipynb` URIs without advertising notebook capability.
			-- Notebook-aware servers (anything with notebookDocumentSync) are
			-- handled correctly via the LSP notebook protocol and don't need to be
			-- listed here.
			lsp_blocklist = {},
		})
	end,
}

-- Kernels location: /Users/juju/Library/Jupyter/kernels/jupynivm
