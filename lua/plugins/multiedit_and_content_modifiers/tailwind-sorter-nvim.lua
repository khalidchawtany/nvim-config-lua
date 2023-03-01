return {
	"laytan/tailwind-sorter.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
	build = "cd formatter && npm i && npm run build",
	cmd = { "TailwindSort", "TailwindSortOnSaveToggle" },
	keys = {
		{"<leader>ts", "<cmd>TailwindSort<CR>", desc="Tailwind Sort" },
		{"<leader>tsos", "<cmd>TailwindSortOnSaveToggle<CR>", desc="Tailwind Sort On Save Toggle" },
	},
	config = {
		on_save_enabled = false, -- If `true`, automatically enables on save sorting.
		on_save_pattern = {
			"*.vue",
			"*.blade.php",
			"*.html",
			"*.js",
			"*.jsx",
			"*.tsx",
			"*.twig",
			"*.hbs",
			"*.php",
			"*.heex",
		}, -- The file patterns to watch and sort.
		node_path = "node",
	},
}
