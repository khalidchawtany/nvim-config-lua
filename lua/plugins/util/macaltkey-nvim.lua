return {
	"clvnkhr/macaltkey.nvim",
	config = function()
		require("macaltkey").setup()
	end,
}


-- local mak = require"macaltkey"
-- mak.keymap.set("n", "<a-a>", function () dump("Hello") end)
