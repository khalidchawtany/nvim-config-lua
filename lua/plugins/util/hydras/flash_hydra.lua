local Hydra = require("hydra")

local window_hint = [[
 Seek/Flash
 --------------
 _a_: *
 _w_: Word start
 _f_: Forward
 _b_: Backward
 _l_: Line
 _c_: CWord

 _tj_: TS jump
 _ts_: TS select

 _o_: Toggle
 _<Space>_: Resume

 Swap
 --------------
 _sl_: Swap left


 _<BS>_: quit
]]

local fj = function(functionName, args)
	return function()
		require("flash")[functionName](args)
	end
end

local fs = function(functionName, args)
	return function()
		require("flash")[functionName](args)
	end
end

Hydra({
	name = "Flash",
	hint = window_hint,
	config = {
		color = "pink",
		invoke_on_body = true,
		hint = {
			position = "bottom-right",
			float_opts = {
				-- row, col, height, width, relative, and anchor should not be overridden
				-- style = "minimal",
				-- border = 'rounded',
				focusable = false,
				noautocmd = true,
				title = "Flash",
				title_pos = "center",
			},
		},
	},
	mode = { "n", "x", "o" },
	body = "ss",
	heads = {

		{
			"a",
			fj("jump", nil),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"o",
			fj("toggle", nil),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"<Space>",
			fj("jump", { continue = true }),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"f",
			fj("jump", { search = { forward = true, wrap = false, multi_window = false } }),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"b",
			fj("jump", { search = { forward = false, wrap = false, multi_window = false } }),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"w",
			fj("jump", {
				search = {
					mode = function(str)
						return "\\<" .. str
					end,
				},
			}),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"l",
			fj("jump", {
				search = { mode = "search", max_length = 0 },
				label = { after = { 0, 0 } },
				pattern = "^",
			}),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"c",
			fj("jump", { { pattern = vim.fn.expand("<cword>") } }),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"ts",
			fj("treesitter_search", nil),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"tj",
			fj("treesitter", nil),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"tj",
			fs("treesitter", nil),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"<BS>",
			nil,
			{ exit_before = true, nowait = true },
		},
	},
})
