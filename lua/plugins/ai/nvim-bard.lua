return {
	"martineausimon/nvim-bard",
	dependencies = "MunifTanjim/nui.nvim",
	config = function()
		local api_key
		local file = io.open("/Users/juju/.local/share/nvim/keys/bard.txt", "r")
		if file then
			api_key = file:read()
			file:close()
		end



		require("nvim-bard").setup({
			bard_api_key = api_key, --required
			display_mode = "popup", -- "popup", "vsplit" or "tabnew"
			mappings = {
				toggle_bard = "<D-b>",
				hide_bard = { "q", "<esc>" },
				send_bard = "<cr>",
				new_chat = "<c-n>",
			},
			options = {
				ui = {
					question = {
						signs = {
							sign = "",
							hi = "Function",
							style = "single", -- "double", "none", "rounded", "solid"
						},
						border = { -- only for "popup" mode
							style = "single", -- "double", "none", "shadow", "rounded", "solid"
							text = {
								top = "[Prompt]",
							},
						},
					},
					bard = {
						signs = {
							sign = "🟆",
							hi = "Statement",
							style = "single",
						},
						border = {
							style = "single",
							text = {
								top = "[Bard]",
							},
						},
					},
				},
				buffer_options = {
					signcolumn = "yes:1",
					filetype = "markdown",
					conceallevel = 3,
					buftype = "nofile",
				},
			},
		})
	end,
}
