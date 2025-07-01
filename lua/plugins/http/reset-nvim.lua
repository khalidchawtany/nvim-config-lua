return {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {

    },
    ft = { "http" },
    init = function()
        vim.g.rest_vim = {
            custom_dynamic_variables = {
                token = function() return vim.env.token end,
            },
        }
    end,
    config = function()
        vim.api.nvim_create_autocmd({ "FileType" }, {
            pattern = "http",
            callback = function()
                vim.keymap.set("n", "g=", function()
                    vim.cmd([[Rest run]])
                end, { silent = true, buffer = true, desc = "Rest Run" })
                vim.keymap.set("n", "<leader>g=", function()
                    vim.cmd([[Rest curl]])
                end, { silent = true, buffer = true, desc = "Rest Preview Curl" })
                vim.keymap.set("n", "<c-k><c-d>", function()
                    vim.cmd("wincmd w")
                    vim.cmd("set modifiable")
                    vim.cmd("/@_RES")
                    vim.cmd("normal jV")
                    vim.fn.feedkeys(":!jq\", "n", true)
                    -- vim.cmd("normal ;!jq")
                end, { silent = true, buffer = true, desc = "Rest Format" })
            end,
        })


        require("rest-nvim").setup({
            -- Open request results in a horizontal split
            result_split_horizontal = false,
            -- Keep the http file buffer above|left when split horizontal|vertical
            result_split_in_place = false,
            -- Skip SSL verification, useful for unknown certificates
            skip_ssl_verification = false,
            -- Encode URL before making request
            encode_url = true,
            -- Highlight request on run
            highlight = {
                enabled = true,
                timeout = 150,
            },
            -- result = {
            --     -- toggle showing URL, HTTP info, headers at top the of result window
            --     show_url = true,
            --     show_http_info = true,
            --     show_headers = true,
            --     -- executables or functions for formatting response body [optional]
            --     -- set them to false if you want to disable them
            --     formatters = {
            --         json = "jq",
            --         html = function(body)
            --             if vim.fn.executable("tidy") == 0 then
            --                 return body, { found = false, name = "tidy" }
            --             end
            --             local fmt_body = vim.fn.system({
            --                 "tidy",
            --                 "-i",
            --                 "-q",
            --                 "--tidy-mark", "no",
            --                 "--show-body-only", "auto",
            --                 "--show-errors", "0",
            --                 "--show-warnings", "0",
            --                 "-",
            --             }, body):gsub("\n$", "")
            --
            --             return fmt_body, { found = true, name = "tidy" }
            --         end,
            --     },
            -- },
            result = {
                split = {
                    in_place = false,
                    horizontal = false,
                    stay_in_current_window_after_split = true,
                },
                behavior = {
                    decode_url = true,
                    show_info = {
                        url = true,
                        headers = true,
                        http_info = true,
                        curl_command = true,
                    },
                    formatters = {
                        json = "jq",
                        html = function(body)
                            if vim.fn.executable("tidy") == 0 then
                                return body, { found = false, name = "tidy" }
                            end
                            local fmt_body = vim.fn.system({
                                "tidy",
                                "-i",
                                "-q",
                                "--tidy-mark", "no",
                                "--show-body-only", "auto",
                                "--show-errors", "0",
                                "--show-warnings", "0",
                                "-",
                            }, body):gsub("\n$", "")

                            return fmt_body, { found = true, name = "tidy" }
                        end,
                    },
                },
            },
            -- Jump to request line on run
            jump_to_request = false,
            env_file = ".env",
            -- custom_dynamic_variables = {},
            yank_dry_run = true,
        })
    end,
}



-- POST https://reqres.in/api/users
--
-- Content-Type: application/json
--
-- {
--     "useId": "{{ userId }}",
--     "array": [ "a", "b", "c"],
-- }
--
-- POST https://reqres.in/api/users
-- Content-Type: application/json
-- < ./users.json
--
-- ###
--
-- GET https://reqres.in/api/users?page=5
