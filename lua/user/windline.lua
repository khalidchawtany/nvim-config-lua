local windline = require("windline")
local helper = require("windline.helpers")
local b_components = require("windline.components.basic")
local state = _G.WindLine.state

local lsp_comps = require("windline.components.lsp")
local git_comps = require("windline.components.git")

local hl_list = {
	Black = { "white", "black" },
	White = { "black", "white" },
	Inactive = { "InactiveFg", "InactiveBg" },
	Active = { "ActiveFg", "ActiveBg" },
}

local function printf(format, current, total)
	if current == 0 and total == 0 then
		return ""
	end
	return vim.fn.printf(format, current, total)
end

local basic = {}

local breakpoint_width = 90
basic.divider = { b_components.divider, "" }
basic.bg = { " ", "StatusLine" }

local colors_mode = {
	Normal = { "red", "black" },
	Insert = { "green", "black" },
	Visual = { "yellow", "black" },
	Replace = { "blue_light", "black" },
	Command = { "magenta", "black" },
}

basic.vi_mode = {
	name = "vi_mode",
	hl_colors = colors_mode,
	text = function()
		return { { "  ", state.mode[2] } }
	end,
}
basic.square_mode = {
	hl_colors = colors_mode,
	text = function()
		return { { "▊", state.mode[2] } }
	end,
}

basic.lsp_diagnos = {
	name = "diagnostic",
	hl_colors = {
		red = { "red", "black" },
		yellow = { "yellow", "black" },
		blue = { "blue", "black" },
	},
	width = breakpoint_width,
	text = function(bufnr)
		if lsp_comps.check_lsp(bufnr) then
			return {
				{ lsp_comps.lsp_error({ format = "  %s", show_zero = true }), "red" },
				{ lsp_comps.lsp_warning({ format = "  %s", show_zero = true }), "yellow" },
				{ lsp_comps.lsp_hint({ format = "  %s", show_zero = true }), "blue" },
			}
		end
		return ""
	end,
}
basic.file = {
	name = "file",
	hl_colors = {
		default = hl_list.Black,
		white = { "white", "black" },
		magenta = { "magenta", "black" },
	},
	text = function(_, _, width)
		if width > breakpoint_width then
			return {
				{ b_components.cache_file_size(), "default" },
				{ " ", "" },
				{ b_components.cache_file_name("[No Name]", "unique"), "magenta" },
				{ b_components.line_col_lua, "white" },
				{ b_components.progress_lua, "" },
				{ " ", "" },
				{ b_components.file_modified(" "), "magenta" },
			}
		else
			return {
				{ b_components.cache_file_size(), "default" },
				{ " ", "" },
				{ b_components.cache_file_name("[No Name]", "unique"), "magenta" },
				{ " ", "" },
				{ b_components.file_modified(" "), "magenta" },
			}
		end
	end,
}
basic.file_right = {
	hl_colors = {
		default = hl_list.Black,
		white = { "white", "black" },
		magenta = { "magenta", "black" },
	},
	text = function(_, _, width)
		if width < breakpoint_width then
			return {
				{ b_components.line_col_lua, "white" },
				{ b_components.progress_lua, "" },
			}
		end
	end,
}
basic.git = {
	name = "git",
	hl_colors = {
		green = { "green", "black" },
		red = { "red", "black" },
		blue = { "blue", "black" },
	},
	width = breakpoint_width,
	text = function(bufnr)
		if git_comps.is_git(bufnr) then
			return {
				{ git_comps.diff_added({ format = "  %s", show_zero = true }), "green" },
				{ git_comps.diff_removed({ format = "  %s", show_zero = true }), "red" },
				{ git_comps.diff_changed({ format = " 柳%s", show_zero = true }), "blue" },
			}
		end
		return ""
	end,
}

local quickfix = {
	filetypes = { "qf", "Trouble" },
	active = {
		{ "🚦 Quickfix ", { "white", "black" } },
		{ helper.separators.slant_right, { "black", "black_light" } },
		{
			function()
				return vim.fn.getqflist({ title = 0 }).title
			end,
			{ "cyan", "black_light" },
		},
		{ " Total : %L ", { "cyan", "black_light" } },
		{ helper.separators.slant_right, { "black_light", "InactiveBg" } },
		{ " ", { "InactiveFg", "InactiveBg" } },
		basic.divider,
		{ helper.separators.slant_right, { "InactiveBg", "black" } },
		{ "🧛 ", { "white", "black" } },
	},

	always_active = true,
	show_last_status = true,
}

local explorer = {
	filetypes = { "fern", "NvimTree", "lir" },
	active = {
		{ "  ", { "black", "red" } },
		{ helper.separators.slant_right, { "red", "NormalBg" } },
		{ b_components.divider, "" },
		{ b_components.file_name(""), { "white", "NormalBg" } },
	},
	always_active = true,
	show_last_status = true,
}

basic.lsp_name = {
	width = breakpoint_width,
	name = "lsp_name",
	hl_colors = {
		magenta = { "magenta", "black" },
	},
	text = function(bufnr)
		if lsp_comps.check_lsp(bufnr) then
			return {
				{ lsp_comps.lsp_name(), "magenta" },
			}
		end
		return {
			{ b_components.cache_file_type({ icon = true }), "magenta" },
		}
	end,
}

basic.pomo = {
	name = "pomo",
	hl_colors = {
		green = { "green", "black" },
		red = { "red", "black" },
		blue = { "blue", "black" },
	},
	width = breakpoint_width,
	text = function(bufnr)
		-- return "󰄉 " .. tostring(timer)

		local ok, pomo = pcall(require, "pomo")
		if not ok then
			return "⨯ 00:00" -- Fallback icon and time
		end

		local timer = pomo.get_first_to_finish()
		if timer == nil then
			return "⨯ 00:00" -- Fallback icon and time
		end

		local timer_name = timer.name
		local icon = "󰄉" -- Default icon

		if timer_name == "Work" then
			icon = "󰄉"
		elseif timer_name == "Short Break" then
			icon = "◌"
		elseif timer_name == "Long Break" then
			icon = "◡"
		end

		local time_remaining_seconds = timer:time_remaining()
		if time_remaining_seconds == nil then
			return icon .. " 00:00"
		end

		if timer.paused then
			icon = "⏸︎"
		end

		local minutes = math.floor(time_remaining_seconds / 60)
		local seconds = time_remaining_seconds % 60
		local formatted_time = string.format("%02d:%02d", minutes, seconds)

		return icon .. " " .. formatted_time .. " #" .. timer.id
	end,
}

basic.search_count = {
	name = "search_count",
	hl_colors = {
		green = { "green", "black" },
		red = { "red", "black" },
		blue = { "blue", "black" },
	},
	width = breakpoint_width,
	text = function(bufnr)
		if vim.v.hlsearch == 0 then
			return ""
		end
		vim.fn.searchcount({ recompute = 1, maxcount = 0, timeout = 100 })
		local result = vim.fn.searchcount({ recompute = 0 })
		if vim.tbl_isempty(result) then
			return ""
		end
		---NOTE: the search term can be included in the output
		--- using [%s] but this value seems flaky
		-- local search_reg = fn.getreg("@/")
		if result.incomplete == 1 then -- timed out
			return printf(" ?/?? ")
		elseif result.incomplete == 2 then -- max count exceeded
			if result.total > result.maxcount and result.current > result.maxcount then
				return printf(" >%d/>%d ", result.current, result.total)
			elseif result.total > result.maxcount then
				return printf(" %d/>%d ", result.current, result.total)
			end
		end
		return printf(" %d/%d ", result.current, result.total)
	end,
}

basic.multicursor = {

	name = "multicursor",
	hl_colors = {
		green = { "green", "black" },
		red = { "red", "black" },
		blue = { "blue", "black" },
	},
	width = breakpoint_width,
	text = function(bufnr)
		if not require("user.functions").plugin_is_loaded("multicursor.nvim") then
			return ""
		end

		local mc = require("multicursor-nvim")

		if mc.hasCursors() then
			if vim.fn.mode() == "v" then
				return "󰚕 (V)"
			else
				return "󰬸 (N)"
			end
		end
		return ""
		-- local status = {}
		-- if mc.hasCursors() then
		--     status.enabled = true
		--     if vim.fn.mode() == "v" then
		--         status.icon = "󰚕 "
		--         status.short_text = "V"
		--         status.text = "VISUAL"
		--         status.color = "lualine_a_visual"
		--     else
		--         status.icon = "󰬸 "
		--         status.short_text = "N"
		--         status.text = "NORMAL"
		--         status.color = "lualine_a_normal"
		--     end
		-- else
		--     status.enabled = false
		--     status.icon = "󰘪 "
		--     status.short_text = "NO"
		--     status.text = "SINGLE"
		--     status.color = "lualine_a_normal"
		-- end
		-- status.icon_short_text = status.icon .. status.short_text
		-- status.icon_text = status.icon .. status.text
		-- return status
	end,
}

basic.reg_recording = {
	name = "reg_recording",
	hl_colors = {
		red = { "white", "red" },
	},
	width = breakpoint_width,
	text = function(bufnr)
		if vim.fn.reg_recording() == "" then
			return ""
		end
		local result = vim.fn.reg_recording()
		return { { " recrodgin @" .. result, "red" } }
	end,
}

-- basic.doing = {
--     name = "doing",
--     hl_colors = {
--         blue = { "white", "blue" },
--     },
--     width = breakpoint_width,
--     text = function(bufnr)
--         local doing = require("doing")
--         local text = " " .. doing.status() .. " +" .. tostring(doing.tasks_left())
--         return { { text, "red" } }
--     end,
-- }

local default = {
	filetypes = { "default" },
	active = {
		basic.square_mode,
		basic.vi_mode,
		basic.file,
		basic.lsp_diagnos,
		basic.reg_recording,
		basic.divider,
		-- basic.doing,
		basic.multicursor,
		basic.pomo,
		basic.search_count,
		basic.divider,
		basic.file_right,
		basic.lsp_name,
		basic.git,
		{ git_comps.git_branch(), { "magenta", "black" }, breakpoint_width },
		{ " ", hl_list.Black },
		basic.square_mode,
	},
	inactive = {
		{ b_components.full_file_name, hl_list.Inactive },
		basic.file_name_inactive,
		basic.divider,
		basic.divider,
		{ b_components.line_col, hl_list.Inactive },
		{ b_components.progress, hl_list.Inactive },
	},
}

windline.setup({
	colors_name = function(colors)
		-- print(vim.inspect(colors))
		-- ADD MORE COLOR HERE ----
		return colors
	end,
	statuslines = {
		default,
		quickfix,
		explorer,
	},
})

local function reset_windline_bg()
	-- get set colors
	local highlights = vim.api.nvim__get_hl_defs(0)

	-- remove empty names
	vim.tbl_filter(function(key)
		return type(key) == "string" and #key > 0
	end, highlights)

	for name, highlight in pairs(highlights) do
		if type(name) == "string" and #name > 0 then
			if name:startswith("WL") then
				vim.cmd("hi " .. name .. " guibg=#111827")
			end
		end
	end
end

-- reset_windline_bg()
