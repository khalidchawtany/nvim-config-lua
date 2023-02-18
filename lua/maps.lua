--  delete all hidden, unmodified, non-terminal buffers
vim.keymap.set("n", "<c-;>wh", function()
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
end, { desc = "Delete all unmodified hidden buffers" })
