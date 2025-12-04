local f = function(lhs, session_name, desc)
	return {
		lhs,
		function()
			local sk = require("session-keys")
			sk:toggle(session_name)
			sk:show_active()
		end,
		mode = { "n" },
		desc = desc,
	}
end

return {

	"https://gitlab.com/shmerl/session-keys.git",

	keys = {
		f("dof", "file", "session keys toggle (file)"),
		-- {
		-- 	"dod",
		-- 	function()
		-- 		local sk = require("session-keys")
		-- 		sk:toggle("dap")
		-- 		sk:show_active()
		-- 	end,
		-- 	mode = { "n" },
		-- 	desc = "Session keys toggle (DAP)",
		-- },
	},

	config = function()
		local sk = require("session-keys")

		sk.sessions = {
			file = {
				n = { -- mode 'n'
					{ lhs = "w", rhs = function() vim.cmd("w") end, },
				},
			},
			-- dap = {
			-- 	n = { -- mode 'n'
			-- 		{ lhs = "<F5>", rhs = require("dap").continue },
			-- 		{ lhs = "<F9>", rhs = require("dap").toggle_breakpoint },
			-- 		{ lhs = "<F10>", rhs = require("dap").step_over },
			-- 		{ lhs = "<F11>", rhs = require("dap").step_into },
			-- 		{ lhs = "<F23>", rhs = require("dap").step_out },
			--
			-- 		{ lhs = "<F6>", rhs = require("dap").down },
			-- 		{ lhs = "<F18>", rhs = require("dap").up },
			--
			-- 		{ lhs = "<F8>", rhs = require("dap").disconnect },
			-- 		{ lhs = "<F20>", rhs = require("dap").terminate },
			--
			-- 		{ lhs = "<F17>", rhs = require("dap").run_last },
			--
			-- 		{ lhs = "<F7>", rhs = require("dap").pause },
			-- 		{ lhs = "<F29>", rhs = require("dap").reverse_continue },
			-- 		{ lhs = "<F22>", rhs = require("dap").step_back },
			-- 	},
			-- },
		}
	end,
}

-- :lua require('session-keys'):start('dap')
-- :lua require('session-keys'):stop('dap')
-- :lua require('session-keys'):toggle('dap')
-- :lua require('session-keys'):show_active()
-- Meta + F11 (= F59) for toggling dap session keys itself
--vim.keymap.set('n', '<F59>', function() require('session-keys'):toggle('dap') end)
