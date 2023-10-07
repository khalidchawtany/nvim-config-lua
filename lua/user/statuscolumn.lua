local gitsigns_bar = '⎥'

local gitsigns_hl_pool = {
	GitSignsAdd          = "DiagnosticOk",
	GitSignsChange       = "DiagnosticWarn",
	GitSignsChangedelete = "DiagnosticWarn",
	GitSignsDelete       = "DiagnosticError",
	GitSignsTopdelete    = "DiagnosticError",
	GitSignsUntracked    = "NonText",
}

local diag_signs_icons = {
	DiagnosticSignError = " ",
	DiagnosticSignWarn = " ",
	DiagnosticSignInfo = " ",
	DiagnosticSignHint = "",
	DiagnosticSignOk = " "
}


local function get_sign_name(cur_sign)
	if (cur_sign == nil) then
		return nil
	end

	cur_sign = cur_sign[1]

	if (cur_sign == nil) then
		return nil
	end

	cur_sign = cur_sign.signs

	if (cur_sign == nil) then
		return nil
	end

	cur_sign = cur_sign[1]

	if (cur_sign == nil) then
		return nil
	end

	return cur_sign["name"]
end

local function mk_hl(group, sym)
	return table.concat({ "%#", group, "#", sym, "%*" })
end

local function get_name_from_group(bufnum, lnum, group)
	local cur_sign_tbl = vim.fn.sign_getplaced(bufnum, {
		group = group,
		lnum = lnum
	})

	return get_sign_name(cur_sign_tbl)
end

_G.get_name_from_group = get_name_from_group

_G.git_signs_name_space = vim.api.nvim_create_namespace("gitsigns_extmark_signs_")

_G.get_statuscol_gitsign = function(bufnr, lnum)
	-- local cur_sign_nm = get_name_from_group(bufnr, lnum, "gitsigns_vimfn_signs_")
	local cur_sign_nm = ""

    local marks = vim.api.nvim_buf_get_extmarks(bufnr, _G.git_signs_name_space, 0, -1, {details = true})

    for _, mark in ipairs(marks) do
        if mark[1] == lnum then
            cur_sign_nm = mark[4]['sign_hl_group']
            break
        end
    end


    -- lua dump(vim.api.nvim_buf_get_extmarks(vim.api.nvim_win_get_buf(0), vim.api.nvim_create_namespace("gitsigns_extmark_signs_"), 0, -1, { details = true }))

	if cur_sign_nm ~= nil and cur_sign_nm ~= "" then
		return mk_hl(gitsigns_hl_pool[cur_sign_nm], gitsigns_bar)
	else
		return " "
	end
end

_G.get_statuscol_diag = function(bufnum, lnum)
	local cur_sign_nm = get_name_from_group(bufnum, lnum, "*")

	if cur_sign_nm ~= nil and vim.startswith(cur_sign_nm, "DiagnosticSign") then
		return mk_hl(cur_sign_nm, diag_signs_icons[cur_sign_nm])
	else
		return " "
	end
end

_G.get_statuscol = function()
	local str_table = {}

	local parts = {
		["diagnostics"] = "%{%v:lua.get_statuscol_diag(bufnr(), v:lnum)%}",
		["fold"] = "%C",
		["gitsigns"] = "%{%v:lua.get_statuscol_gitsign(bufnr(), v:lnum)%}",
		["num"] = "%{v:relnum?v:relnum:v:lnum}",
		["sep"] = "%=",
		["signcol"] = "%s",
		["space"] = " "
	}

	local order = {
		"diagnostics",
		"sep",
		"num",
		-- "space",
		"gitsigns",
		-- "space",
		"fold",
	}

	for _, val in ipairs(order) do
		table.insert(str_table, parts[val])
	end

	return table.concat(str_table)
end

vim.o.statuscolumn = "%!v:lua.get_statuscol()"

