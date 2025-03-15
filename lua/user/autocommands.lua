
require("user.autocmd_buffer_clean")

-- When cursor moves to a diagnostic line, open the diagnostic float window
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--     group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
--     callback = function()
--         vim.diagnostic.open_float(nil, {
--             focus = false,
--             border = "rounded",
--         })
--     end,
-- })

-- On exit if we don't have modified buffers confirm exit
-- vim.api.nvim_create_autocmd({ "ExitPre" }, {
-- 	callback = function()
-- 		local hasModifiedBuffers = false
-- 		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
-- 			if vim.api.nvim_buf_get_option(buf, "modified") then
-- 				hasModifiedBuffers = true
-- 				break
-- 			end
-- 		end
-- 		if hasModifiedBuffers == false then
-- 			vim.cmd([[echohl WarningMsg]])
-- 			vim.cmd([[echo "======================================================================"]])
-- 			vim.cmd([[echo "                                                                      "]])
-- 			vim.cmd([[echo "                             CONFIRM EXIT                             " | set modified]])
-- 			vim.cmd([[echo "                                                                      "]])
-- 			vim.cmd([[echo "======================================================================"]])
-- 			vim.cmd([[echohl None]])
-- 		end
-- 	end,
-- })

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150, on_visual = false })
    end,
})

-- local winbarAutoCommandId = nil
-- local setUpWinbarAutoCmd = function()
-- 	winbarAutoCommandId = vim.api.nvim_create_autocmd(
-- 		{ "CursorMoved", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost" },
-- 		{
-- 			callback = function()
-- 				require("user.winbar").get_winbar()
-- 			end,
-- 		}
-- 	)
-- end
--
-- -- if not vim.fn.has('gui_vimr') then
-- setUpWinbarAutoCmd()
-- -- end
--
-- vim.keymap.set("n", "yo<cr>", function()
-- 	if vim.api.nvim_get_option_value("winbar", { scope = "local" }) == "" then
-- 		setUpWinbarAutoCmd()
-- 		require("user.winbar").get_winbar()
-- 	else
-- 		vim.api.nvim_del_autocmd(winbarAutoCommandId)
-- 		pcall(vim.api.nvim_set_option_value, "winbar", "", { scope = "local" })
-- 	end
-- end, { desc = "Toggle Winbar" })

vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
    -- pattern = "*",
    callback = function()
        -- {"BufReadPost,FileReadPost", "*", "if !(empty(&filetype) || &filetype=='noice') | normal zR | endif"}
        if vim.bo.filetype == "noice" or vim.bo.buflisted == false then
            return
        end

        vim.cmd.normal("zR")
    end,
})
