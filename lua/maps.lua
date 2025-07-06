vim.keymap.set("n", "<leader>xl", "<cmd>.lua<CR>", { desc = "Execute current line" })
vim.keymap.set("v", "<leader>xl", "<cmd>'<,'>lua<CR>", { desc = "Execute visual line" })


vim.keymap.set("n", "<D-p>e", function()
	require("user.fze").fze({})
end, { desc = "FZE Search" })

vim.keymap.set("n", "<D-p><D-e>", function()
	require("user.fze").fze({})
end, { desc = "FZE Search" })

-- toggle % and '<,'> in command line'
vim.keymap.set("c", "<c-t>", function()
	local cmd = vim.fn.getcmdline()
	if cmd:sub(1, 1) == "%" then
		cmd = "'<,'>" .. cmd:sub(2)
	elseif cmd:sub(1, 5) == "'<,'>" then
		cmd = "%" .. cmd:sub(6)
	end
	vim.fn.setcmdline(cmd)
end, { noremap = true })

-- toggle command execute
vim.keymap.set("c", "<c-y>", function()
	local cmd = vim.fn.getcmdline()
	if cmd:sub(1, 3) == "exe" then
		local start = cmd:find("[\"']")

		local finish = cmd:reverse():find("[\"']")

		if start and finish then
			cmd = cmd:sub(start + 1, -finish - 1)
		end

		cmd = cmd:gsub("\\([\"'])", "%1")
		vim.fn.setcmdline(cmd)
	else
		cmd = cmd:gsub('"', '\\"')
		cmd = 'exe "' .. cmd .. '"'
		vim.fn.setcmdline(cmd)
	end
end, { noremap = true })

-- On going to insert mode auto indent
vim.keymap.set("n", "i", function()
	if #vim.fn.getline(".") == 0 then
		return [["_cc]]
	else
		return "i"
	end
end, { expr = true, desc = "properly indent on empty line when insert" })

vim.keymap.set("n", "<m-cr>", function()
	vim.lsp.buf.code_action()
end, { desc = "Code Actions" })

if vim.lsp.inlay_hint then
	vim.keymap.set("n", "coi", function()
		-- vim.lsp.inlay_hint()
		vim.lsp.inlay_hint.enable(0, nil)
	end, { desc = "Toggle Inlay Hints" })
end

--
--  delete all hidden, unmodified, non-terminal buffers
vim.keymap.set("n", "<leader>bwh", function()
	local api = vim.api
	local active_buffers = {}
	for _, win in ipairs(api.nvim_list_wins()) do
		active_buffers[api.nvim_win_get_buf(win)] = true
	end
	local count = 0
	local buffers = api.nvim_list_bufs()
	for _, buf in ipairs(buffers) do
		if
			active_buffers[buf] ~= true
			and api.nvim_buf_get_option(buf, "modified") ~= true
			and api.nvim_buf_get_option(buf, "buftype") ~= "terminal"
		then
			api.nvim_buf_delete(buf, {})
			count = count + 1
		end
	end
	api.nvim_out_write(string.format("Deleted %d hidden and unmodified buffers\n", count))
	-- dump(string.format("Deleted %d hidden and unmodified buffers\n", count))
end, { desc = "Delete all unmodified hidden buffers" })


vim.keymap.set("n", "<leader>yff", function()
    local rel_path = require('functions').to_relative_path(vim.fn.expand('%:p'))
    local line_num = vim.api.nvim_win_get_cursor(0)[1]
    -- format the path and line number
    local path_with_line = rel_path .. ":" .. line_num
    -- copy to system clipboard
    vim.fn.setreg('+', path_with_line)
    vim.fn.setreg('*', path_with_line)
    print(path_with_line)
end, { desc = "Copy file path to root" })
