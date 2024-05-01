local M = {
	"drmingdrmer/xptemplate",
	event = { "InsertEnter" },
    enabled=false,
	-- keys = {{"<c-\\>", mode = "i"}}
}

M.config = function()
	vim.cmd([[
  set runtimepath+=/Users/juju/.config/nvim/xpt-personal
  fun! ListSnippetsStartingWithPrefix()
	return XPTemplateStart(0, {"forcePum": 1})
  endfunction

  fun! ListAll()
	return XPTemplateStart(0, {"forcePum": 1, "popupOnly": 1})
  endfunction

  " i<C-r>=ListAll()<CR>

  " i<C-r>=ListSnippetsStartingWithPrefix()<CR>
  ]])

	vim.keymap.set({ "i" }, "<c-s><c-\\>", function()
		vim.fn.feedkeys("=ListAll()")
	end, { silent = true })

	vim.keymap.set({ "n" }, "<leader>es", function()
		local snippetDir = vim.fn.stdpath("config") .. "/xpt-personal/ftplugin/" .. vim.bo.filetype .. "/"
		local snippetFile = snippetDir .. vim.o.filetype .. ".xpt.vim"
		if vim.fn.isdirectory(snippetDir) == 0 then
			vim.fn.mkdir(snippetDir, "p")
		end
		if vim.fn.filereadable(snippetFile) == 0 then
			vim.fn.writefile({}, snippetFile)
		end

		vim.cmd.edit(snippetFile)
	end, { silent = true })

	vim.g.xptemplate_key = "<c-\\>"
	vim.g.xptemplate_nav_next = "<C-]>"
	vim.g.xptemplate_nav_prev = "<C-[>"
	vim.g.xptemplate_minimal_prefix = 0
end
return M
