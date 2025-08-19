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
 _sw_: Wrok 15m
 _s._: Repeat
 _st_: Stop
 _sr_: Resume
 _s<Space>_: Pause

 _<BS>_: quit
]]

local pomo = function(functionName, args)
	return function()
        if args['pass_id'] ~= nil then
            local timer = require("pomo").get_first_to_finish()
            if timer == nil then
                require("snacks").notify.warn("No timer is active")
                return
            end
            args.args = tostring(timer.id)
        end
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

        -- doing
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


        -- pomodoro
		{
			"sp",
			pomo("TimerSession", { fargs = { "pomodoro" } }),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"sw",
			pomo("TimerStart", { fargs = { 900 } }), -- 15mins
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"s.",
			pomo("TimerRepeat", nil),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"st",
            pomo("TimerStop", { pass_id = true }),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"sr",
			pomo("TimerResume", {pass_id = true }),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"s<Space>",
            pomo("TimerPause", {  pass_id = true }),
			{ nowait = true, mode = { "n" }, exit_before = true },
		},

		{
			"<BS>",
			nil,
			{ nowait = true, exit_before = true, exit = true },
		},

	},
})
