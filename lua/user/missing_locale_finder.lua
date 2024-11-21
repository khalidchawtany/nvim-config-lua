local M = {}

M.locate_all_translations = function(path, pattern)
    local list = {}
    -- search only in the path
    local cmd = string.format("/usr/local/bin/rg \"%s\" -INo --trim -C 0 --no-heading %s", pattern, path)
    local handle = io.popen(cmd)
    for line in handle:lines() do
        -- if line ends with ' then remove it
        if line:sub(-1) == "'" then
            line = line:sub(1, -2)
        end
        -- get unique values only
        if not vim.tbl_contains(list, line) then
            table.insert(list, line)
        end
        table.sort(list)
    end
    return list
end

M.get_current_translations = function(path, prefix)
    local file = path .. "/plugins/khalid/shipman/lang/en/lang.php"
    local flatten_array_script = string.format(
        [[
    function flatten(\$array, \$prefix = '%s') {
        \$result = array();
        foreach(\$array as \$key=>\$value) {
            if(is_array(\$value)) {
                \$result = \$result + flatten(\$value, \$prefix . \$key . '.');
            }
        else {
            \$result[\$prefix . \$key] = \$value;
        }
    }
    return \$result;
};
]], prefix)


    local cmd = string.format("php -r \" %s echo json_encode(flatten(require('%s')));\"", flatten_array_script,
        file)
    local handle = io.popen(cmd)
    local list = {}
    for line in handle:lines() do
        for word in line:gmatch("[^,]+") do
            word = word:gsub("{", "")
            word = word:gsub("}", "")
            word = word:gsub("\"", "")
            word = word:match("^(.*):")
            table.insert(list, word)
        end
    end
    return list
end

M.get_missing_translations = function(all_translations, current_translations)
    local missing_translations = {}
    for _, translation in ipairs(all_translations) do
        if not vim.tbl_contains(current_translations, translation) then
            table.insert(missing_translations, translation)
        end
    end

    return missing_translations
end



M.fzf_missing_translations = function(opts)
    opts = opts or {}

    local path = vim.loop.cwd()

    local all_translations = M.locate_all_translations(path, "khalid.shipman::lang.*.\\w+")
    local current_translations = M.get_current_translations(path, 'khalid.shipman::lang.')
    local missing_translations = M.get_missing_translations(all_translations, current_translations)


    -- dd(all_translations)
    -- dd(current_translations)
    -- dd(missing_translations)

    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local conf = require("telescope.config").values
    local actions = require "telescope.actions"
    local action_state = require "telescope.actions.state"


    pickers.new(opts, {
        prompt_title = "colors",
        finder = finders.new_table {
            results = missing_translations,
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                local process_field = function(entry)
                    entry                   = entry:gsub("\"", "")
                    entry                   = entry:match("::lang.(.*)")

                    local master            = entry:match("(.*)%..*")
                    local key               = entry:match(".*%.(.*)")

                    local file              = path .. "/plugins/khalid/shipman/lang/en/lang.php"

                    local file_already_open = vim.api.nvim_buf_get_name(0) == file
                    if not file_already_open then
                        vim.api.nvim_command("e " .. file)
                    end

                    local buf_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
                    local buf_line_nr = nil
                    local buf_line = ""
                    local str = string.format("'%s' => ", master) .. '%['
                    for i, line in ipairs(buf_lines) do
                        if line:find(str) then
                            buf_line_nr = i
                            buf_line = line
                            break
                        end
                    end

                    if buf_line_nr == nil then
                        vim.api.nvim_buf_set_lines(0, -2, -2, true, { string.rep(" ", 4) .. "'" .. master .. "' => [" })
                        key = key:match "^%s*(.*)":match "(.-)%s*$"
                        local value = require('textcase').api.to_title_case(key:gsub("'", ""))
                        vim.api.nvim_buf_set_lines(0, -2, -2, true,
                            { string.format("%s'%s' => '%s',", string.rep(" ", 8), key, value) })
                        vim.api.nvim_buf_set_lines(0, -2, -2, true, { string.rep(" ", 4) .. "]," })
                        vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_line_count(0) - 2, 0 })
                        return
                    end

                    local spaces = buf_line:match("^(%s+)'") .. string.rep(" ", 4)

                    local value = require('textcase').api.to_title_case(key)

                    vim.api.nvim_buf_set_lines(0, buf_line_nr, buf_line_nr, true,
                        { string.format("%s'%s' => '%s',", spaces, key, value) })
                    vim.api.nvim_win_set_cursor(0, { buf_line_nr + 1, 0 })

                    -- vim.api.nvim_put({ string.format("%s%s '%s',", spaces, key, value) }, "l", true, true)
                end

                local picker = action_state.get_current_picker(prompt_bufnr)
                local num_selections = #picker:get_multi_selection()
                local selections = picker:get_multi_selection()
                actions.close(prompt_bufnr)

                if num_selections > 1 then
                    for _, entry in ipairs(selections) do
                        process_field(entry[1])
                    end
                else
                    process_field(action_state.get_selected_entry()[1])
                end
            end)
            return true
        end,
    }):find()
end


-- M.fzf_missing_translations()

return M
