return {
    "dbinagi/nomodoro",
    cmd = {
        "NomoWork",
        "NomoBreak",
        "NomoStop",
        "NomoStatus",
        "NomoTimer",
    },
    keys = {
        { "<leader>pow", "<cmd>NomoWork<cr>",  desc = "Pomodoro (Work)" },
        { "<leader>pob", "<cmd>NomoBreak<cr>", desc = "Pomodoro (Break)" },
        { "<leader>pos", "<cmd>NomoStop<cr>",  desc = "Pomodoro (Stop)" },
    },
    init = function()
        local wk = require("which-key")
        wk.register({
            mode = { "n" },
            ["<leader>po"] = { name = "+Pomodoro" },
        })
    end,

    config = function()
        require("nomodoro").setup({
            work_time = 25,
            break_time = 5,
            menu_available = true,
            texts = {
                on_break_complete = "TIME IS UP!",
                on_work_complete = "TIME IS UP!",
                status_icon = "羽",
                timer_format = "!%0M:%0S", -- To include hours: '!%0H:%0M:%0S'
            },
            on_work_complete = function()
                vim.fn.jobstart({ "afplay", "/Users/juju/Development/Sounds/Bebebebeeep.mp3" }, {
                    on_stdout = function(j, d, e) end,
                })
            end,
            on_break_complete = function()
                vim.fn.jobstart({ "afplay", "/Users/juju/Development/Sounds/tic_short.mp3" }, {
                    on_stdout = function(j, d, e) end,
                })
            end,
        })
    end,
}
