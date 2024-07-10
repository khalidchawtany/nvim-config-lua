return {
    "frankroeder/parrot.nvim",
    tag = "v0.3.2",
    cmd = {
        "PrtNew",
        "PrtChatNew",
        "PrtImplement",
        "PrtProvider",
        "PrtAgent",
        "PrtChatToggle",
        "PrtInfo",
        "PrtContext",
        "PrtAsk",
        "PrtChatFinder",
        "PrtChatPaste",
    },
    dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
    config = function()
        local claude_api_key
        local file = io.open("/Users/juju/.local/share/nvim/keys/claude.txt", "r")
        if file then
            claude_api_key = file:read()
            file:close()
        end
        require("parrot").setup({
            providers = {
                pplx = {
                    api_key = os.getenv("PERPLEXITY_API_KEY"),
                    -- OPTIONAL
                    -- gpg command
                    -- api_key = { "gpg", "--decrypt", vim.fn.expand("$HOME") .. "/pplx_api_key.txt.gpg"  },
                    -- macOS security tool
                    -- api_key = { "/usr/bin/security", "find-generic-password", "-s pplx-api-key", "-w" },
                },
                openai = {
                    api_key = os.getenv("OPENAI_API_KEY"),
                },
                anthropic = {
                    api_key = claude_api_key,
                },
                mistral = {
                    api_key = os.getenv("MISTRAL_API_KEY"),
                },
            },
        })
    end,
}
