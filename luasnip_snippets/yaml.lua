local ls = require("luasnip")
local s = ls.s
local f = ls.function_node

local snippets, autosnippets = {}, {}

local fmt = require("luasnip.extras.fmt").fmt

local group = vim.api.nvim_create_augroup("YAML Snippets", { clear = true })
local file_pattern = "*.yaml"

local function cs(trigger, nodes, opts)
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

    table.insert(target_table, snippet)
end

-- cs(
--     "brt",{
--     f(function(args, snip)
--             local time = os.time(os.date("!*t"))
--             return "br_" .. time
--         end
--
--     }
--     , {})
-- )

cs(
    "br",
    fmt(
        [[
{}:
    type: br
]],
        {
            f(function(_, _)
                local time = os.time(os.date("!*t"))
                return "br_" .. time
            end),
        }
    ),
    {}
)

cs(
    "brr",
    fmt(
        [[
{}
]],
        {
            f(function(_, _)
                local time = os.time(os.date("!*t"))
                return "br_" .. time
            end),
        }
    ),
    {}
)

return snippets, autosnippets
