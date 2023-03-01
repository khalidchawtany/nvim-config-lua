return {
	"anuvyklack/hydra.nvim",
	event = "VeryLazy",
	config = function ()

		local handle = vim.loop.fs_scandir(vim.fn.stdpath("config") .. "/lua/plugins/util/hydras")
		while handle do
			local name, _ = vim.loop.fs_scandir_next(handle)
			name = name:match("(.+)%..+$")
			dump(name)

			if not name then
				break
			end

			require('plugins/util/hydras/' .. name )
		end
	end
}
