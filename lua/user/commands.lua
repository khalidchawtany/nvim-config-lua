
vim.api.nvim_create_user_command("FS", function(args)
    local functions = require("user.functions")
    local opts = functions.splitBy(args.args, "/")

    opts = {
        find = opts[1],
        replace = opts[2],
        substitute = opts[3],
    }
	require("user.fze").fze(opts)
end, { desc = "Fzf Edit", nargs = "*" })

vim.api.nvim_create_user_command("DiffKO", function()
	-- vim.cmd.wincmd{args={'v'}}
	-- vim.cmd.wincmd{args={'='}}
	-- vim.cmd.lcd(vim.fn.getreg('+'))
	-- vim.cmd.lcd("/Users/juju/Projects/PHP/orion")
	vim.cmd.tabnew()
	vim.cmd.edit("/Users/juju/Projects/PHP/knights/" .. vim.fn.getreg("+"))
	vim.cmd.vsplit("/Users/juju/Projects/PHP/orion/" .. vim.fn.getreg("+"))
	vim.cmd.diffthis()
	vim.cmd.wincmd({ args = { "w" } })
	vim.cmd.diffthis()
end, {})

vim.api.nvim_create_user_command("ClearSwaps", function()
	os.execute("rm -fr /Users/juju/.local/share/nvim/cache/swaps")
end, {})

local function can_autofix(client)
	return client.config.settings.autoFixOnSave or false
end

vim.api.nvim_create_user_command("EslintFixAll", function()
	local clients = vim.lsp.get_active_clients()
	local can_autofix_clients = vim.tbl_filter(can_autofix, clients)
	if #can_autofix_clients > 0 then
		vim.lsp.buf.formatting_seq_sync(nil, 2000)
	end
end, {})

vim.api.nvim_create_user_command("DiffOrig", function()
	-- Get start buffer
	local start = vim.api.nvim_get_current_buf()

	-- `vnew` - Create empty vertical split window
	-- `set buftype=nofile` - Buffer is not related to a file, will not be written
	-- `0d_` - Remove an extra empty start row
	-- `diffthis` - Set diff mode to a new vertical split
	vim.cmd("vnew | set buftype=nofile | read ++edit # | 0d_ | diffthis")

	-- Get scratch buffer
	local scratch = vim.api.nvim_get_current_buf()

	-- `wincmd p` - Go to the start window
	-- `diffthis` - Set diff mode to a start window
	vim.cmd("wincmd p | diffthis")

	-- Map `q` for both buffers to exit diff view and delete scratch buffer
	for _, buf in ipairs({ scratch, start }) do
		vim.keymap.set("n", "q", function()
			vim.api.nvim_buf_delete(scratch, { force = true })
			vim.keymap.del("n", "q", { buffer = start })
		end, { buffer = buf })
	end
end, {})
