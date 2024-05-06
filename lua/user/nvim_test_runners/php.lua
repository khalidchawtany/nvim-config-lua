local Runner = require("nvim-test.runner")
local utils = require("nvim-test.utils")

-- local query = [[
-- ((method_declaration
--    name: (name) @test-name
--    (#match? @test-name "^(describe|test|it)")
--    ) @scope-root)
-- ]]

local query = [[

((function_call_expression
    function: (name) @test-func-name (#match? @test-func-name "^(describe|test|it)")
    arguments: (arguments (argument (string (string_content) @test-name)))
) @scope-root)

]]

local php = Runner:init({
    -- command = { "./vendor/phpunit/phpunit/phpunit", "phpunit" },
    command = { "./vendor/bin/pest", "pest" },
    file_pattern = "\\v(__tests__/.*|(spec|test))\\.(php)$",
    find_files = { "{name}Test.{ext}", "Test{name}.{ext}" },
}, {
    php = query,
})

function php:parse_testname(name)
    return name:gsub("^[\"'`]", ""):gsub("[\"'`]$", "")
end

function php:build_test_args(args, tests)
    if #tests > 1 then
        -- table.insert(args, "--group")
        -- table.insert(args, '"' .. tests[1] .. '"') -- used for pest
        table.insert(args, "--filter")
        table.insert(args, '"' .. tests[2] .. '"') -- used for pest
        return
    end
    table.insert(args, "--filter")
    -- table.insert(args, "^" .. table.concat(tests, " ") .. "$") -- used for phpunit
    table.insert(args, '"' .. table.concat(tests, " ") .. '"') -- used for pest
end

function php:find_working_directory(filename)
    local root = self.config.working_directory
    if not root then
        root = utils.find_relative_root(filename, "composer.json")
    end
    return root
end

return php
