return {
	"smjonas/duplicate.nvim",
	opts = {
		-- set any operator to `nil` to disable it
		operator = {
			normal_mode = "yd", -- duplicate in normal mode, expects a text-object
			visual_mode = nil, -- duplicate in visual mode, unmapped by default
			line = "ydd", -- duplicate the current line
		},
		-- A function with signature `transform(lines: table<string>): table<string>`.
		-- Can be used to modify the text to be duplicated.
		transform = nil,
	},
}
