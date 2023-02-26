local cmp = require("cmp")
local source = {}

---Return whether this source is available in the current context or not (optional).
---@return boolean
function source:is_available()
	return vim.b.xptemplateData ~= nil
end

---Return the debug name of this source (optional).
---@return string
function source:get_debug_name()
	return "XPT"
end

---Return LSP's PositionEncodingKind.
---@NOTE: If this method is ommited, the default value will be `utf-16`.
---@return lsp.PositionEncodingKind
function source:get_position_encoding_kind()
	return "utf-16"
end

---Return the keyword pattern for triggering completion (optional).
---If this is ommited, nvim-cmp will use a default keyword pattern. See |cmp-config.completion.keyword_pattern|.
---@return string
function source:get_keyword_pattern()
	return [[\k\+]]
end

---Return trigger characters for triggering completion (optional).
function source:get_trigger_characters()
	return { "." }
end

---Invoke completion (required).
---@param params cmp.SourceCompletionApiParams
---@param callback fun(response: lsp.CompletionResponse|nil)
function source:complete(params, callback)
	local items = vim.fn.GetXPTItems()
	for _, item in ipairs(items) do
		item.kind = cmp.lsp.CompletionItemKind.Snippet
		-- item.insertText = item.label
		-- item.insertTextFormat = vim.lsp.protocol.InsertTextFormat.PlainText
		-- item.sortText = item.label
		-- item.snippet = item.label
	end

	callback(items)
end

---Resolve completion item (optional). This is called right before the completion is about to be displayed.
---Useful for setting the text shown in the documentation window (`completion_item.documentation`).
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:resolve(completion_item, callback)
	completion_item.documentation = {
		kind = cmp.lsp.MarkupKind.PlainText,
		value = completion_item.hint,
	}
	callback(completion_item)
end

---Executed after the item was selected.
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:execute(completion_item, callback)
	vim.fn.XPTemplateStart(0, { k = "<C-++" })
	callback(completion_item)
end

vim.cmd.source('lua/user/xptsource.vim')

---Register your source to nvim-cmp.
require("cmp").register_source("xpt", source)
