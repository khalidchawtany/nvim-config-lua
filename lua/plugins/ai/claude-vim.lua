return {
    "pasky/claude.vim",
    cmd = {
        'ClaudeImplement',
        'ClaudeChat'

    },
    config = function()
        local api_key
        local file = io.open("/Users/juju/.local/share/nvim/keys/claude.txt", "r")
        if file then
            api_key = file:read()
            file:close()
        end

        vim.g.claude_api_key = api_key
    end,
}
