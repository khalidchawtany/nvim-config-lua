return { -- lazy
    "ccaglak/phptools.nvim",
    -- keys = {
    --     { "<leader>lm", "<cmd>PhpMethod<cr>" },
    --     { "<leader>lc", "<cmd>PhpClass<cr>" },
    --     { "<leader>ls", "<cmd>PhpScripts<cr>" },
    --     { "<leader>ln", "<cmd>PhpNamespace<cr>" },
    --     { "<leader>lg", "<cmd>PhpGetSet<cr>" },
    --     { "<leader>lf", "<cmd>PhpCreate<cr>" },
    -- },
    ft = { "php" },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("phptools").setup({
            ui = {
                enable = true,                            -- default:true; false only if you have a UI enhancement plugin
                fzf = false,                              -- default:false; requires fzf used only in tests module otherwise there might long list  of tests
            },
            create = false,                               -- default:false autorun PhpTools Create when creating a new php file
            drupal_autoloader = {                         -- delete if you dont use it
                scan_paths = { "/web/modules/contrib/" }, -- Paths to scan for modules
                root_markers = { ".git" },                -- Project root markers
                autoload_file = "/vendor/composer/autoload_psr4.php", -- Autoload file path
            },
            custom_toggles = {
                -- { "foo", "bar", "baz" }, -- Add more custom toggle groups here
            },
        })

        vim.api.nvim_create_autocmd({ "FileType" }, {
            pattern = "php",
            callback = function()
                vim.keymap.set( "v", "<localleader>]rr", "<cmd>PhpTools Refactor<CR>", { silent  = true, buffer = true, desc = "Refactor" })
                vim.keymap.set( "n", "<localleader>]im", "<cmd>PhpTools Method<CR>", { silent    = true, buffer = true, desc = "Generate Method" })
                vim.keymap.set( "n", "<localleader>]xs", "<cmd>PhpTools Scripts<CR>", { silent   = true, buffer = true, desc = "Run Compose Scripts" })
                vim.keymap.set( "n", "<localleader>]in", "<cmd>PhpTools Namespace<CR>", { silent = true, buffer = true, desc = "Generate Namespace" })
                vim.keymap.set( "n", "<localleader>]ig", "<cmd>PhpTools GetSet<CR>", { silent    = true, buffer = true, desc = "Generate GetSet" })
                vim.keymap.set( "n", "<localleader>]ia", "<cmd>PhpTools Create<CR>", { silent    = true, buffer = true, desc = "Create" })
            end,
        })
    end,
}
