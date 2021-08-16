local M = {even = {'InsertEnter'}}

M.init = function()

    -- require'snippets'.use_suggested_mappings()
    --
    -- <c-k> will either expand the current snippet at the word or try to jump to
    -- the next position for the snippet.
    vim.cmd([[ inoremap <D-CR> <cmd>lua return require'snippets'.expand_or_advance(1)<CR> ]])
    -- <c-j> will jump backwards to the previous field.
    -- If you jump before the first field, it will cancel the snippet.
    vim.cmd([[ inoremap <D-Bslash> <cmd>lua return require'snippets'.advance_snippet(-1)<CR> ]])

    --  local path = require 'path'
    local format = string.format
    local insert = table.insert

    require'snippets'.debug(false)
    local U = require 'snippets.utils'

    local function from_file(fname)
        return function()
            local file = io.open(fname)
            local data = "FAILED TO LOAD " .. fname
            if file then
                data = file:read "*a"
                file:close()
            end
            return data
        end
    end

    function git_project_name()
        -- TODO:
        --  git root is an extension of mine.
        --    - ashkan, Thu 19 Aug 2020 04:00:46 AM JST
        return io.popen("git root"):read("*l"):match("[^/]+$")
    end

    function github_project_url()
        for line in io.popen("git remote -v"):lines() do
            local n = line:match("^origin.*:([^/:]+/[^/]+)%.git")
            if not n then n = line:match("^origin.*/([^/]+/[^/%s]+)") end
            if n then return "https://github.com/" .. n end
        end
    end

    local function note_snippet(header)
        -- local S = [[$-1(ashkan, ${=snippet_date()}) ]]
        -- local S = [[$-1(ashkan): ]]
        -- Put a dummy value for -1 and add a default later.
        local S = [[
${-1}:
 $0
   - ashkan, ${=os.date()}]]
        S = U.force_comment(S)
        S = U.match_indentation(S)
        return U.iterate_variables_by_id(S, -1, function(v)
            v.default = header
        end)
    end

    require'snippets'.snippets = {
        lua = {
            ["for"] = U.match_indentation [[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
	$0
end]],
            -- ["for"] = [[
            -- for ${1:i}, ${2:v} in ipairs(${3:t}) do
            -- ${-1=line_indent()}	$0
            -- ${-1}end]];
            fori = U.match_indentation [[
for ${1:i} = ${2:1}, ${3:#t} do
	$0
end]],
            forp = U.match_indentation [[
for ${1:k}, ${2:v} in pairs(${3:t}) do
	$0
end]],
            -- func = [[function${1|test123}(${2|vim.trim})$0 end]]; 
            func = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]],
            req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']],
            luv = "local uv = require 'luv'",
            loc = "local $1 = $0",
            exp = "$1 = $1;",
            ["local"] = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = ${1}]],
            prelude = U.match_indentation [[
local uv = require 'luv'
local format = string.format
local concat = table.concat
local insert = table.insert
]]
        },
        [""] = {
            -- TODO(ashkan): test this.
            -- date = { {1}, {{placeholder = function()return "$1"end}}; };
            silly = {
                {1, 2}, {
                    {}, {
                        placeholder = function()
                            return "$1"
                        end
                    }
                }
            }
        },
        c = {
            guard = [[
#ifndef AK_${1|S.v:gsub("%s+", "_")}_H_
#define AK_${|S[1]:gsub("%s+", "_")}_H_

$0

#endif // AK_${|S[1]:gsub("%s+", "_")}_H_
]],
            ["#if"] = [[
#if $1
$0
#endif // $1
]],
            ["inc"] = [[#include "$1"]],
            ["sinc"] = [[#include <$1>]],
            ["struct"] = U.match_indentation [[
typedef struct $1 {
  $0
} $1;
]],
            ["enum"] = U.match_indentation [[
typedef enum $1 {
  $0
} $1;
]],
            ["union"] = U.match_indentation [[
union $1 {
  $0
}
]],
            ["def"] = [[#define ]],
            ["for"] = U.match_indentation [[
for ($1; $2; $3) {
  $0
}]],
            ["fori"] = U.match_indentation [[
for (int ${1:i}; $1 < $2; $1++) {
  $0
}]]
        },
        rust = {
            macro = U.match_indentation [[
macro_rules! ${1:name} {
  ($2) => {
    $0
  }
}
]],
            type = [[type $1 = $2;]],
            struct = U.match_indentation [[
struct $1 {
  $0
}]],
            enum = U.match_indentation [[
enum $1 {
  $0
}]],
            -- TODO(ashkan, 2020-08-19 05:33:54+0900) case change from TitleCase to snake_case for last element of ::
            field = [[$1: $2,]],
            -- field = [[${2=R.case_change.S[1]..}: $1,]];
            impl = U.match_indentation [[
impl $1 {
  $0
}
]],
            hashmap = [[use std::collections::HashMap;]],
            hashset = [[use std::collections::HashSet;]],
            collections = [[use std::collections::$1;]],
            match = U.match_indentation [[
match $1 {
  $0
}]],
            bcase = U.match_indentation [[
$1 => {
  $0
}]],
            case = U.match_indentation [[$1 => $0,]]
        },
        latex = {
            gfx = [[
\begin{figure}[$1]
  \centering
  \includegraphics[${3:width=$2cm}]{$2}
  \caption{$4}
  \label{fig:$5}
\end{figure}
]]
        },
        _global = {
            ooo = [[\usepackage[$2]{$1}]],
            ooo1 = [[\usepackage[${2:a$1b}]{$1}]],
            ooo2 = [[\usepackage[${2:a${1|S.v:gsub("a","b")}b}]{$1}]],
            -- fasd = [[321${-1="123"|"13"}]];
            fasd = [[${1|""}${2|""}${|S[1].."_"..S[2]}]],
            -- fasd = [[${1|""}${2|""}${|S[1].."_"..S[2]..vim.fn.input(">")}]];
            asdf = [[${|"aasdf"..S[1]} ${1|""}]],
            -- asdf = [[${|"aasdf"..S[1]} $1]];
            -- double = [[here ${-1=os.date()} and $-1 here]];

            date = "${=os.date()}",
            ymd = [[${=os.date("%Y-%m-%d")}]],
            -- ymd = function() return os.date("%Y-%m-%d") end;
            epoch = "${=os.time()}",
            uname = function()
                return vim.loop.os_uname().sysname
            end,

            todo = note_snippet "TODO",
            note = note_snippet "NOTE",
            idea = note_snippet "IDEA",
            important = note_snippet "IMPORTANT",

            copyright = U.force_comment [[Copyright (C) Ashkan Kiani ${=os.date("%Y")}]],
            randcolor = function()
                return format("#%06X", math.floor(math.random() * 0xFFFFFF))
            end,
            -- GPL_full = from_file(path.join(vim.fn.stdpath "config", "GPLv3.license")),
            GPL = (function()
                local S, indent_var = U.match_indentation(U.force_comment [[
Copyright (C) ${=os.date("%Y")} Ashkan Kiani
This is part of the ${=git_project_name()} distribution.
${=github_project_url()}

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.]])
                insert(S, '\n')
                insert(S, indent_var)
                return S
            end)()
        }
    }

    do
        local snippets = require'snippets'.snippets
        snippets.cpp = vim.tbl_extend("error", snippets.cpp or {}, snippets.c)
        require'snippets'.snippets = snippets
    end
end

return M
