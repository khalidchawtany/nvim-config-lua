-- lazy.nvim
return {
	"chrisgrieser/nvim-recorder",
    keys = {
        -- these must match the keys in the mapping config below
        { "q", desc = " Start Recording" },
        { "Q", desc = " Play Recording" },
    },
	config = function()
		require("recorder").setup({
			-- Named registers where macros are saved. The first register is the default
			-- register/macro-slot used after startup.
			slots = { "a", "b" },
			-- default keymaps, see README for description what the commands do
			mapping = {
				startStopRecording = "œ", -- option-q
				playMacro = "Q",
				switchSlot = "<C-2>",
				editMacro = "cq",
				yankMacro = "yq", -- also decodes it for turning macros to mappings
				addBreakPoint = "##", -- ⚠️ this should be a string you don't use in insert mode during a macro
			},
			-- clears all macros-slots on startup
			clear = false,
			-- log level used for any notification, mostly relevant for nvim-notify
			-- (note that by default, nvim-notify does not show the levels trace and debug.)
			logLevel = vim.log.levels.INFO,
			-- experimental, see README
			dapSharedKeymaps = false,
		})
	end,
}
