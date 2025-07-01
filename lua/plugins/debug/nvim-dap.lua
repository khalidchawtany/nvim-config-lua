-- Quickstart
-- Launch the server in the debuggee using F5
-- Open another Neovim instance with the source file
-- Place breakpoint with F8
-- Connect using the DAP client with F9
-- Run your script/plugin in the debuggee
-- Alternaltively you can:
--
-- Open a lua file
-- Place breakpoint
-- Invoke require"osv".run_this()
-- See osv.txt for more detailed instructions.

return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "nvim-telescope/telescope-dap.nvim",
        "theHamsta/nvim-dap-virtual-text",
        "mfussenegger/nvim-dap-python",
        "jbyuki/one-small-step-for-vimkind",
    },
    cmd = { "DapLoad" },
    config = function()
        vim.api.nvim_create_user_command("DapLoad", function()
            dump("Quickstart")
            dump("Launch the server in the debuggee using F5, <leader>dds")
            dump("Open another Neovim instance with the source file")
            dump("Place breakpoint with F8, <leader>ddb")
            dump("Connect using the DAP client with F9, <leader>ddC")
            dump("Run your script/plugin in the debuggee")
            dump("Alternaltively you can:")
            dump("----------------------------------------------")
            dump("Open a lua file")
            dump("Place breakpoint")
            dump('Invoke require"osv".run_this()')
            dump("See osv.txt for more detailed instructions.")
        end, {})

        local dap = require("dap")


        -- PHP
        dap.adapters.php = {
            type = "executable",
            command = "node",
            args = { "/Users/juju/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
        }
        dap.configurations.php = {
            {
                type = "php",
                request = "launch",
                name = "Listen for Xdebug",
                port = 9003,
                -- pathMappings = {
                --     ["/var/www/html"] = "${workspaceFolder}",
                -- },
            },
        }
        -- dap.configurations.php = {
        --     { type = "php", request = "launch", name = "Listen for Xdebug", server = "127.0.0.1", port = 9003 },
        -- }

        -- PHP
        dap.adapters.nlua = function(callback, config)
            callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
        end
        dap.configurations.lua = {
            {
                type = "nlua",
                request = "attach",
                name = "Attach to running Neovim instance",
            },
        }

        -- dap.configurations.lua = {
        --     {
        --         name = "Current file (local-lua-dbg, nlua)",
        --         type = "local-lua",
        --         request = "launch",
        --         cwd = "${workspaceFolder}",
        --         program = {
        --             lua = "nlua.lua",
        --             file = "${file}",
        --         },
        --         verbose = true,
        --         args = {},
        --     },
        -- }

        -- vim.api.nvim_set_keymap("n", "<F9>", [[:lua require"dap".continue()<CR>]], { noremap = true })
        -- vim.api.nvim_set_keymap("n", "<leader>ddc", [[:lua require"dap".continue()<CR>]], { noremap = true })
        --
        -- vim.api.nvim_set_keymap("n", "<F8>", [[:lua require"dap".toggle_breakpoint()<CR>]], { noremap = true })
        -- vim.api.nvim_set_keymap("n", "<leader>ddb", [[:lua require"dap".toggle_breakpoint()<CR>]], { noremap = true })
        --
        -- vim.api.nvim_set_keymap("n", "<F5>", [[:lua require"osv".launch({port = 8086})<CR>]], { noremap = true })
        -- vim.api.nvim_set_keymap("n", "<leader>dds", [[:lua require"osv".launch({port = 8086})<CR>]], { noremap = true })
        --
        --
        -- vim.api.nvim_set_keymap("n", "<F10>", [[:lua require"dap".step_over()<CR>]], { noremap = true })
        -- vim.api.nvim_set_keymap("n", "<D-j>", [[:lua require"dap".step_over()<CR>]], { noremap = true })
        --
        -- vim.api.nvim_set_keymap("n", "<S-F10>", [[:lua require"dap".step_into()<CR>]], { noremap = true })
        -- vim.api.nvim_set_keymap("n", "<leader>ddi", [[:lua require"dap".step_into()<CR>]], { noremap = true })
        -- vim.api.nvim_set_keymap("n", "<leader>ddo", [[:lua require"dap".step_out()<CR>]], { noremap = true })
        --
        --
        -- vim.api.nvim_set_keymap("n", "<leader>ddS", [[:lua require"dap".stop()<CR>]], { noremap = true })
        --
        -- vim.api.nvim_set_keymap("n", "<leader>ddk", [[:lua require"dap".up()<CR>]], { noremap = true })
        -- vim.api.nvim_set_keymap("n", "<leader>ddj", [[:lua require"dap".down()<CR>]], { noremap = true })
        --
        -- vim.api.nvim_set_keymap("n", "<leader>ddl", [[:lua require"dap".run_last()<CR>]], { noremap = true })
        -- vim.api.nvim_set_keymap("n", "<leader>ddr", [[:lua require"dap".repl.open()<CR>]], { noremap = true })
        --
        -- vim.api.nvim_set_keymap("n", "<leader>ddiv", [[:lua require'dap.ui.variables'.hover()<CR>]], { noremap = true })
        -- vim.api.nvim_set_keymap( "v", "<leader>ddiv", [[:lua require'dap.ui.variables'.visual_hover()<CR>]], { noremap = true })
        -- vim.api.nvim_set_keymap("n", "<leader>ddis", [[:lua require'dap.ui.variables'.scopes()<CR>]], { noremap = true })
        --
        -- vim.api.nvim_set_keymap( "n", "<leader>dde", [[:lua require'dap'.set_exception_breakpoints({"all"})<CR>]], { noremap = true })
        -- vim.api.nvim_set_keymap("n", "<leader>dda", [[:lua require'debugHelper'.attach()<CR>]], { noremap = true })
        -- vim.api.nvim_set_keymap( "n", "<leader>ddA", [[:lua require'debugHelper'.attachToRemote()<CR>]], { noremap = true })
        --
        -- vim.api.nvim_set_keymap("n", "<F12>", [[:lua require"dap.ui.widgets".hover()<CR>]], { noremap = true })
        -- vim.api.nvim_set_keymap("n", "<leader>ddk", [[:lua require"dap.ui.widgets".hover()<CR>]], { noremap = true })
        -- vim.api.nvim_set_keymap( "n", "<leader>ddK", [[:lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>]], { noremap = true })
        --
        -- vim.api.nvim_set_keymap("n", "<leader>ddtf", [[:Telescope dap frames<CR>]], { noremap = true })
        -- vim.api.nvim_set_keymap("n", "<leader>ddtc", [[:Telescope dap commands<CR>]], { noremap = true })
        -- vim.api.nvim_set_keymap("n", "<leader>ddtb", [[:Telescope dap list_breakpoints<CR>]], { noremap = true })
        --
        -- vim.api.nvim_set_keymap("n", "<leader>ddq", [[:lua require("dapui").toggle()<CR>]], { noremap = true })
        -- vim.api.nvim_set_keymap("n", "<leader>ddd", [[:lua require("dapui").toggle()<CR>]], { noremap = true })


        -- Signs
        vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "ErrorMsg", linehl = "", numhl = "" })

        vim.fn.sign_define(
            "DapBreakpointCondition",
            { text = "", texthl = "Error", linehl = "WarningMsg", numhl = "Substitute" }
        )

        vim.fn.sign_define(
            "DapLogPoint",
            { text = "", texthl = "Error", linehl = "WarningMsg", numhl = "Substitute" }
        )

        vim.fn.sign_define("DapStopped", { text = "", texthl = "ErrorMsg", linehl = "SpellRare", numhl = "Todo" })

        vim.fn.sign_define(
            "DapBreakpointRejected",
            { text = "", texthl = "Error", linehl = "WarningMsg", numhl = "Substitute" }
        )

        -- revert the original statuscolumn
        vim.o.statuscolumn = ""

        vim.g.dap_virtual_text = true

        require("telescope").setup()
        require("telescope").load_extension("dap")
        require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
    end,
}
