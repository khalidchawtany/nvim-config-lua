local ls = require("luasnip") --{{{
local s = ls.s
local i = ls.i
local t = ls.t

s("nav", {
	t("Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const "),
	i(1, ""),
	t("()))"),
}) -- Navigator
