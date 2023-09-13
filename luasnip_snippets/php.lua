local ls = require("luasnip") --{{{
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("PHP Snippets", { clear = true })
local file_pattern = "*.php"

local function camelCase(str)
	return string.gsub(str, "_%a+", function(word)
		local first = string.sub(word, 2, 2)
		local rest = string.sub(word, 3)
		return string.upper(first) .. rest
	end)
end

local function pasCalcase(str)
	str = camelCase(str)
	return string.upper(string.sub(str, 1, 1)) .. string.sub(str, 2)
end

local function cs(trigger, nodes, opts) --{{{
	local snippet = s(trigger, nodes)
	local target_table = snippets

	local pattern = file_pattern
	local keymaps = {}

	if opts ~= nil then
		-- check for custom pattern
		if opts.pattern then
			pattern = opts.pattern
		end

		-- if opts is a string
		if type(opts) == "string" then
			if opts == "auto" then
				target_table = autosnippets
			else
				table.insert(keymaps, { "i", opts })
			end
		end

		-- if opts is a table
		if opts ~= nil and type(opts) == "table" then
			for _, keymap in ipairs(opts) do
				if type(keymap) == "string" then
					table.insert(keymaps, { "i", keymap })
				else
					table.insert(keymaps, keymap)
				end
			end
		end

		-- set autocmd for each keymap
		if opts ~= "auto" then
			for _, keymap in ipairs(keymaps) do
				vim.api.nvim_create_autocmd("BufEnter", {
					pattern = pattern,
					group = group,
					callback = function()
						vim.keymap.set(keymap[1], keymap[2], function()
							ls.snip_expand(snippet)
						end, { noremap = true, silent = true, buffer = true })
					end,
				})
			end
		end
	end

	table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- Start Refactoring --


cs(
	"file",
	f(function(args, snip)
		local file_name = vim.fn.fnamemodify(vim.fn.expand('%'),':t:r')
		return pasCalcase(file_name)
	end, {})
)

cs(
	"fnm",
	f(function(args, snip)
		local file_name = vim.fn.fnamemodify(vim.fn.expand('%'),':t:r')
		file_name = string.match(file_name, "%d+_%d+_%d+_%d+_(.*)")
		return pasCalcase(file_name)
	end, {})
)

cs(
	"fnc",
	f(function(args, snip)
		local file_name = vim.fn.fnamemodify(vim.fn.expand('%'),':t:r')
		return pasCalcase(file_name)
	end, {})
)

-- End Refactoring --

return snippets, autosnippets
