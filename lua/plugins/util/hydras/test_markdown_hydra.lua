 vim.api.nvim_create_autocmd({ "FileType" }, {
	group = InitGroupId,
	pattern = { "markdown" },
	callback = function(args)
		local Hydra = require("hydra")

		Hydra({
			name = "Test",
			mode = "n",
			body = "b",
			config = {
				buffer = true,
				-- buffer = args.buf,
			},
			desc = "TRACING FROM SF",
			heads = {
				{
					"h",
					function()
						vim.pretty_print("Hello!")
					end,
				},
			},
		})
	end,
})
