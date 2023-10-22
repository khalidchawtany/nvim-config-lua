return {
	"buschco/nvim-cmp-ts-tag-close",
	event = "InsertEnter",

	config = function()
		require("nvim-cmp-ts-tag-close").setup({ skip_tags = { "img" } })
	end,
}
