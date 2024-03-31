local Runner = require("nvim-test.runner")
local utils = require("nvim-test.utils")

-- local query = [[
-- ((method_declaration
--    name: (name) @test-name
--    (#match? @test-name "^(describe|test|it)")
--    ) @scope-root)
-- ]]

local query = [[
((expression_statement
   (function_call_expression
     arguments: (
        arguments (
            argument (string (string_value)@test-name))
        )
     )) @scope-root)
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
    table.insert(args, "--filter")
    -- table.insert(args, "^" .. table.concat(tests, " ") .. "$") -- used for phpunit
    table.insert(args, table.concat(tests, " ")) -- used for pest
end

function php:find_working_directory(filename)
    local root = self.config.working_directory
    if not root then
        root = utils.find_relative_root(filename, "composer.json")
    end
    return root
end

return php
