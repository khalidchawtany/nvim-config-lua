return {
    description = "Perform calculations",
    opts = {
        requires_approval = true,
    },
    callback = {
        name = "calculator",
        cmds = {
            function(self, actions, input)
                -- Get the numbers and operation requested by the LLM
                local num1 = tonumber(actions.num1)
                local num2 = tonumber(actions.num2)
                local operation = actions.operation

                -- Validate input
                if not num1 then
                    return { status = "error", data = "First number is missing or invalid" }
                end

                if not num2 then
                    return { status = "error", data = "Second number is missing or invalid" }
                end

                if not operation then
                    return { status = "error", data = "Operation is missing" }
                end

                -- Perform the calculation
                local result
                if operation == "add" then
                    result = num1 + num2
                elseif operation == "subtract" then
                    result = num1 - num2
                elseif operation == "multiply" then
                    result = num1 * num2
                elseif operation == "divide" then
                    if num2 == 0 then
                        return { status = "error", data = "Cannot divide by zero" }
                    end
                    result = num1 / num2
                else
                    return {
                        status = "error",
                        data = "Invalid operation: must be add, subtract, multiply, or divide",
                    }
                end

                return { status = "success", data = result }
            end,
        },
        schema = {
            _attr = { name = "calculator" },
            action = {
                num1 = "100",
                num2 = "50",
                operation = "multiply",
            },
        },
        system_prompt = function(schema, xml2lua)
            return string.format(
                [[## Calculator Tool (`calculator`) - Enhanced Guidelines

### Purpose:
- To do a mathematical operation on two numbers.

### When to Use:
- Only invoke the calculator tool when the user specifically asks you

### Execution Format:
- Always return an XML markdown code block

### XML Schema:
Each tool invocation should adhere to this structure:

```xml
%s
```

where:
- `num1` is the first number to do any calculations on
- `num2` is the second number to do any calculations on
- `operation` is the mathematical operation to do on the two numbers. It MUST be one of `add`, `subtract`, `multiply` or `divide`

### Reminder:
- Minimize extra explanations and focus on returning correct XML blocks.
- Always use the structure above for consistency.]],
                xml2lua.toXml(schema, "tool")
            )
        end,
        handlers = {
            setup = function(agent)
                return vim.notify("setup function called", vim.log.levels.INFO)
            end,
            on_exit = function(agent)
                return vim.notify("on_exit function called", vim.log.levels.INFO)
            end,
        },
        output = {
            ---@param agent CodeCompanion.Agent
            ---@param cmd table The command that was executed
            ---@param stdout table
            success = function(agent, cmd, stdout)
                local config = require("codecompanion.config")
                return agent.chat:add_buf_message({
                    role = config.constants.USER_ROLE,
                    content = string.format("The output from the calculator was %d", tonumber(stdout[1])),
                })
            end,
            error = function(agent)
                return vim.notify("An error occurred", vim.log.levels.ERROR)
            end,
        },
    },
}
