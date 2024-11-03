return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
        debug = false,
        ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | "groq" | [string]
        provider = "groq", -- Only recommend using Claude
        auto_suggestions_provider = "copilot",
        ---@alias Tokenizer "tiktoken" | "hf"
        -- Used for counting tokens and encoding text.
        -- By default, we will use tiktoken.
        -- For most providers that we support we will determine this automatically.
        -- If you wish to use a given implementation, then you can override it here.
        tokenizer = "tiktoken",
        ---@alias AvanteSystemPrompt string
        -- Default system prompt. Users can override this with their own prompt
        -- You can use `require('avante.config').override({system_prompt = "MY_SYSTEM_PROMPT"}) conditionally
        -- in your own autocmds to do it per directory, or that fit your needs.
        system_prompt = [[
Act as an expert software developer.
Always use best practices when coding.
Respect and use existing conventions, libraries, etc that are already present in the code base.
]],
        ---@type AvanteSupportedProvider
        openai = {
            endpoint = "https://api.openai.com/v1",
            model = "gpt-4o",
            timeout = 30000, -- Timeout in milliseconds
            temperature = 0,
            max_tokens = 4096,
            ["local"] = false,
        },
        ---@type AvanteSupportedProvider
        copilot = {
            endpoint = "https://api.githubcopilot.com",
            model = "gpt-4o-2024-05-13",
            proxy = nil,   -- [protocol://]host[:port] Use this proxy
            allow_insecure = false, -- Allow insecure server connections
            timeout = 30000, -- Timeout in milliseconds
            temperature = 0,
            max_tokens = 4096,
        },
        ---@type AvanteAzureProvider
        azure = {
            endpoint = "", -- example: "https://<your-resource-name>.openai.azure.com"
            deployment = "", -- Azure deployment name (e.g., "gpt-4o", "my-gpt-4o-deployment")
            api_version = "2024-06-01",
            timeout = 30000, -- Timeout in milliseconds
            temperature = 0,
            max_tokens = 4096,
            ["local"] = false,
        },
        ---@type AvanteSupportedProvider
        claude = {
            endpoint = "https://api.anthropic.com",
            model = "claude-3-5-sonnet-20240620",
            timeout = 30000, -- Timeout in milliseconds
            temperature = 0,
            max_tokens = 8000,
            ["local"] = false,
        },
        ---@type AvanteSupportedProvider
        gemini = {
            endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
            model = "gemini-1.5-flash-latest",
            timeout = 30000, -- Timeout in milliseconds
            temperature = 0,
            max_tokens = 4096,
            ["local"] = false,
        },
        ---@type AvanteSupportedProvider
        cohere = {
            endpoint = "https://api.cohere.com/v1",
            model = "command-r-plus-08-2024",
            timeout = 30000, -- Timeout in milliseconds
            temperature = 0,
            max_tokens = 4096,
            ["local"] = false,
        },
        ---To add support for custom provider, follow the format below
        ---See https://github.com/yetone/avante.nvim/README.md#custom-providers for more details
        ---@type {[string]: AvanteProvider}
        vendors = {
            ---@type AvanteProvider
            groq = {
                endpoint = "https://api.groq.com/openai/v1/chat/completions",
                model = "llama-3.1-70b-versatile",
                api_key_name = "GROQ_API_KEY",
                parse_curl_args = function(opts, code_opts)
                    return {
                        url = opts.endpoint,
                        headers = {
                            ["Accept"] = "application/json",
                            ["Content-Type"] = "application/json",
                            ["Authorization"] = "Bearer " .. os.getenv(opts.api_key_name),
                        },
                        body = {
                            model = opts.model,
                            messages = { -- you can make your own message, but this is very advanced
                                { role = "system", content = code_opts.system_prompt },
                                {
                                    role = "user",
                                    content = require("avante.providers.openai").get_user_message(code_opts),
                                },
                            },
                            temperature = 0,
                            max_tokens = 4096,
                            stream = true, -- this will be set by default.
                        },
                    }
                end,
                parse_response_data = function(data_stream, event_state, opts)
                    require("avante.providers").openai.parse_response(data_stream, event_state, opts)
                end,
            },
        },
        ---Specify the behaviour of avante.nvim
        ---1. auto_apply_diff_after_generation: Whether to automatically apply diff after LLM response.
        ---                                     This would simulate similar behaviour to cursor. Default to false.
        ---2. auto_set_keymaps                : Whether to automatically set the keymap for the current line. Default to true.
        ---                                     Note that avante will safely set these keymap. See https://github.com/yetone/avante.nvim/wiki#keymaps-and-api-i-guess for more details.
        ---3. auto_set_highlight_group        : Whether to automatically set the highlight group for the current line. Default to true.
        ---4. support_paste_from_clipboard    : Whether to support pasting image from clipboard. This will be determined automatically based whether img-clip is available or not.
        behaviour = {
            auto_suggestions = false, -- Experimental stage
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = false,
            support_paste_from_clipboard = false,
        },
        history = {
            storage_path = vim.fn.stdpath("state") .. "/avante",
            paste = {
                extension = "png",
                filename = "pasted-%Y-%m-%d-%H-%M-%S",
            },
        },
        highlights = {
            ---@type AvanteConflictHighlights
            diff = {
                current = "DiffText",
                incoming = "DiffAdd",
            },
        },
        mappings = {
            ---@class AvanteConflictMappings
            diff = {
                ours = "co",
                theirs = "ct",
                all_theirs = "ca",
                both = "cb",
                cursor = "cc",
                next = "]x",
                prev = "[x",
            },
            suggestion = {
                accept = "<M-l>",
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
            },
            jump = {
                next = "]]",
                prev = "[[",
            },
            submit = {
                normal = "<CR>",
                insert = "<C-s>",
            },
            -- NOTE: The following will be safely set by avante.nvim
            ask = "<leader>aa",
            edit = "<leader>ae",
            refresh = "<leader>ar",
            focus = "<leader>af",
            toggle = {
                default = "<leader>at",
                debug = "<leader>ad",
                hint = "<leader>ah",
                suggestion = "<leader>as",
                repomap = "<leader>aR",
            },
            sidebar = {
                apply_all = "A",
                apply_cursor = "a",
                switch_windows = "<Tab>",
                reverse_switch_windows = "<S-Tab>",
            },
        },
        windows = {
            ---@alias AvantePosition "right" | "left" | "top" | "bottom" | "smart"
            position = "right",
            wrap = true, -- similar to vim.o.wrap
            width = 30, -- default % based on available width in vertical layout
            height = 30, -- default % based on available height in horizontal layout
            sidebar_header = {
                enabled = true, -- true, false to enable/disable the header
                align = "center", -- left, center, right for title
                rounded = true,
            },
            input = {
                prefix = "> ",
            },
            edit = {
                border = "rounded",
                start_insert = true, -- Start insert mode when opening the edit window
            },
            ask = {
                floating = false, -- Open the 'AvanteAsk' prompt in a floating window
                border = "rounded",
                start_insert = true, -- Start insert mode when opening the ask window
            },
        },
        --- @class AvanteConflictConfig
        diff = {
            autojump = true,
        },
        --- @class AvanteHintsConfig
        hints = {
            enabled = true,
        },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua", -- for providers='copilot'
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = {
                    -- "markdown",
                    "Avante",
                },
            },
            ft = {
                -- "markdown",
                "Avante",
            },
        },
    },
}
