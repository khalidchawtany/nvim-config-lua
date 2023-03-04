local M = {
	"vhyrro/neorg",
	ft = { "norg" },
	cmd = { "Neorg" },
	-- tag = "*",
	dependencies = { "nvim-treesitter" }, -- You may want to specify Telescope here as well
	keys = {
		{ "<leader>oi", "<cmd>Neorg workspace work<cr>",  desc = "Neorg (Index)" },
		{ "<leader>ow", "<cmd>Neorg workspace work<cr>",  desc = "Neorg (Index)" },
		{ "<leader>or", "<cmd>Neorg return<cr>", desc = "Neorg (return)" },
	},
}

M.config = function()
	require("neorg").setup({
		load = {
				["core.defaults"] = {},
				["core.norg.concealer"] = {
				config = {
					icon_preset = "diamond",
				},
			},
				["core.export"] = {
				config = {},
			},
				["core.export.markdown"] = {
				config = {},
			},
				["core.norg.dirman"] = {
				config = {
					workspaces = {
						work = "~/notes/work/", -- Format: <name_of_workspace> = <path_to_workspace_root>
						research = "~/notes/research/",
					},
					default_workspace = "work",
					index = "index.norg", -- The name of the main (root) .norg file
				},
			},
		},
	})
end

return M
