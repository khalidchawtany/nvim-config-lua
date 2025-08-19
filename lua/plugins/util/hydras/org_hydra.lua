local Hydra = require("hydra")

local hint = [[
 Doing
 --------------
 _dn_: New
 _de_: Edit
 _do_: Done
 _dt_: Toggle


 Pomodoro
 --------------
 _sp_: Pomodoro
 _sr_: Repeat
 _st_: Stop

 _<BS>_: quit
]]

local pomo = function(functionName, args)
	return function()
		require("pomo.commands")[functionName](args)
	end
end

local doing = function(functionName, args)
	return function()
		require("doing")[functionName](args)
	end
end

Hydra({
	name = "Org",
	hint = hint,
	config = {
		color = "blue",
		invoke_on_body = true,
		hint = {
			position = "middle",
			float_opts = {
				-- row, col, height, width, relative, and anchor should not be overridden
				-- style = "minimal",
				-- border = 'rounded',
				focusable = false,
				noautocmd = true,
				title = "Org",
				title_pos = "center",
			},
		},
	},
	mode = { "n" },
	body = "coo",
	heads = {
		{
			"dn",
            function() vim.cmd.Do() end,
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"de",
			doing("edit", nil),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"do",
			doing("done", nil),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"dt",
            function() vim.cmd.DoToggle() end,
			{ nowait = true, mode = { "n" }, exit_before = true },
		},


		{
			"sp",
			pomo("TimerSession", { fargs = { "pomodoro" } }),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"st",
			pomo("TimerStop", nil),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},
		{
			"sr",
			pomo("TimerRepeat", nil),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"<BS>",
			nil,
			{ nowait = true, exit_before = true, exit = true },
		},
	},
})
