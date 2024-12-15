return {
	"chrisgrieser/nvim-various-textobjs",
	config = function()
		require("various-textobjs").setup({
			lookForwardLines = 5, -- Set to 0 to only look in the current line.
			-- useDefaultKeymaps = false, -- Use suggested keymaps (see README).
			keymaps = {
				useDefaults = false,
			},
		})

		--  	-- example: `?` for diagnostic textobj
		--  	vim.keymap.set({ "o", "x" }, "?", function() require("various-textobjs").diagnostic() end)
		--
		--  	-- example: `an` for outer number, `in` for inner number
		--  	vim.keymap.set({ "o", "x" }, "an", function() require("various-textobjs").number(false) end)
		--  	vim.keymap.set({ "o", "x" }, "in", function() require("various-textobjs").number(true) end)
		--
		--  	-- exception: indentation textobj requires two parameters, first for exclusion of the
		--  	-- starting border, second for the exclusion of ending border
		--  	vim.keymap.set({ "o", "x" }, "ii", function() require("various-textobjs").indentation(true, true) end)
		--  	vim.keymap.set({ "o", "x" }, "ai", function() require("various-textobjs").indentation(false, true) end)
	end,
}
