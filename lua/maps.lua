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
        vim.lsp.inlay_hint(0, nil)
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
