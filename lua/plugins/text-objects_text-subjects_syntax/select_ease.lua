return {
	"ziontee113/SelectEase",
	event = "VeryLazy",

	config = function()
		local select_ease = require("SelectEase")

		local lua_query = [[
            ;; query
            ((identifier) @cap)
            ("string_content" @cap)
            ((true) @cap)
            ((false) @cap)
        ]]
		local python_query = [[
            ;; query
            ((identifier) @cap)
            ((string) @cap)
        ]]
		local php_query = [[
            ;; query
            ((variable_name) @cap)
            ((string_value) @cap)
        ]]

		local queries = {
			lua = lua_query,
			python = python_query,
			php = php_query,
		}

		vim.keymap.set({ "n", "s", "i" }, "<D-[>", function()
			select_ease.select_node({
				queries = queries,
				direction = "previous",
				vertical_drill_jump = true,
			})
		end, {})
		vim.keymap.set({ "n", "s", "i" }, "<D-]>", function()
			select_ease.select_node({
				queries = queries,
				direction = "next",
				vertical_drill_jump = true,
			})
		end, {})
		vim.keymap.set({ "n", "s", "i" }, "<D-;>", function()
			select_ease.select_node({
				queries = queries,
				direction = "previous",
				current_line_only = true,
			})
		end, {})
		vim.keymap.set({ "n", "s", "i" }, "<D-'>", function()
			select_ease.select_node({
				queries = queries,
				direction = "next",
				current_line_only = true,
			})
		end, {})

		vim.keymap.set({ "n", "s", "i" }, "<D-k>", function()
			select_ease.select_node({ queries = queries, direction = "previous" })
		end, {})
		vim.keymap.set({ "n", "s", "i" }, "<D-j>", function()
			select_ease.select_node({ queries = queries, direction = "next" })
		end, {})
	end,
}
