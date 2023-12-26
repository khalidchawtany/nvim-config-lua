return {
	"vhyrro/neorg",
	ft = { "norg" },
	cmd = { "Neorg" },
	-- tag = "*",
	dependencies = { "nvim-treesitter" }, -- You may want to specify Telescope here as well
	keys = {
		{ "<leader>oi", "<cmd>Neorg workspace work<cr>", desc = "Neorg (Index)" },
		{ "<leader>ow", "<cmd>Neorg workspace work<cr>", desc = "Neorg (Index)" },
		{ "<leader>or", "<cmd>Neorg return<cr>",         desc = "Neorg (return)" },
	},
	config = function()
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
			pattern = { "*.norg" },
			command = "set conceallevel=3",
		})

		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.keybinds"] = {

					config = {
						default_keybinds = true,
						hook = function(keybinds)
							keybinds.map("norg", "i", "<C-9>", "<cmd>Neorg keybind norg core.promo.demote<CR>")
							keybinds.map("norg", "i", "<C-0>", "<cmd>Neorg keybind norg core.promo.promote<CR>")
							keybinds.map("norg", "n", "<leader>oc", "<cmd>Neorg toggle-concealer<CR>")

							-- Unmaps any Neorg key from the `norg` mode
							-- keybinds.unmap("norg", "n", "gtd")

							-- Binds the `gtd` key in `norg` mode to execute `:echo 'Hello'`
							-- keybinds.map("norg", "n", "gtd", "<cmd>echo 'Hello!'<CR>")

							-- Remap unbinds the current key then rebinds it to have a different action
							-- associated with it.
							-- The following is the equivalent of the `unmap` and `map` calls you saw above:
							-- keybinds.remap("norg", "n", "gtd", "<cmd>echo 'Hello!'<CR>")

							-- Sometimes you may simply want to rebind the Neorg action something is bound to
							-- versus remapping the entire keybind. This remap is essentially the same as if you
							-- did `keybinds.remap("norg", "n", "<C-Space>, "<cmd>Neorg keybind norg core.norg.qol.todo_items.todo.task_done<CR>")
							-- keybinds.remap_event("norg", "n", "<C-Space>", "core.norg.qol.todo_items.todo.task_done")

							-- Want to move one keybind into the other? `remap_key` moves the data of the
							-- first keybind to the second keybind, then unbinds the first keybind.
							-- keybinds.remap_key("norg", "n", "<C-Space>", "<Leader>t")
						end,
					},
				},
				["core.concealer"] = {
					config = {
						folds = true,
						icon_preset = "diamond", -- diamond, basic, varied
					},
				},
				["core.esupports.indent"] = {
					config = {
						tweaks = {
							list = 4,
						},
					},
				},
				["core.export"] = {
					config = {},
				},
				["core.export.markdown"] = {
					config = {},
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							work = "~/notes/work/", -- Format: <name_of_workspace> = <path_to_workspace_root>
							research = "~/notes/research/",
						},
						default_workspace = "work",
						index = "index.norg", -- The name of the main (root) .norg file
					},
				},
                ["core.summary"] ={},
                ["core.ui.calendar"] = {},
			},
		})
	end,
}
