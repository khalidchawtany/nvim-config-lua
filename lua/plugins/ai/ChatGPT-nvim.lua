return {
    "jackMort/ChatGPT.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
    },
    cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTCompleteCode", "ChatGPTRun", "ChatGPTEditWithInstructions" },
    config = function()

        local home = vim.fn.expand("$HOME")
        require("chatgpt").setup({

            api_key_cmd = "cat " .. home .. "/.local/share/nvim/keys/chatgpt.txt"
            -- api_key_cmd = 'cat ~/.local/share/nvim/keys/chatgpt.txt',
        })
    end,
}
