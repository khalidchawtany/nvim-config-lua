return {
    "martineausimon/nvim-bard",
    dependencies = "MunifTanjim/nui.nvim",
    cmd = {
        "Bard",
        "BardNewChat",
        "BardSend",
        "BardHide",
        "BardToggle",
    },
    config = function()
        local api_key
        local file = io.open("/Users/juju/.local/share/nvim/keys/bard.txt", "r")
        if file then
            api_key = file:read()
            file:close()
        end

        require("nvim-bard").setup({
            bard_api_key = {
                psid = api_key,
                psidcc = "ABTWhQGxNBUGjCkDR8wEg-0bQaGeDwnDUE93iBFv-fQ2NmPwRT9jzvIhlMpvu2VxrY6qLtx-zjCi",
                psidts = "sidts-CjIBPVxjSqgGteOxnXV4DdX1dnplXZEN5qD2J1iCDfhNRA53taUYQq1bf3N4Y0YOdmEhVxAA",
            },
            display_mode = "popup", -- "popup", "vsplit" or "tabnew"
            mappings = {
                toggle_bard = "<D-b>",
                hide_bard = { "q", "<esc>" },
                send_bard = "<cr>",
                new_chat = "<c-n>",
            },
            options = {
                ui = {
                    question = {
                        signs = {
                            sign = "",
                            hi = "Function",
                            style = "single", -- "double", "none", "rounded", "solid"
                        },
                        border = { -- only for "popup" mode
                            style = "single", -- "double", "none", "shadow", "rounded", "solid"
                            text = {
                                top = "[Prompt]",
                            },
                        },
                    },
                    bard = {
                        signs = {
                            sign = "🟆",
                            hi = "Statement",
                            style = "single",
                        },
                        border = {
                            style = "single",
                            text = {
                                top = "[Bard]",
                            },
                        },
                    },
                },
                buffer_options = {
                    signcolumn = "yes:1",
                    filetype = "markdown",
                    conceallevel = 3,
                    buftype = "nofile",
                },
            },
        })
    end,
}
