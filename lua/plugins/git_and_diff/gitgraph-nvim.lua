return {
    "isakbm/gitgraph.nvim",

    dependencies = { "sindrets/diffview.nvim" },
    ---@type I.GGConfig
    opts = {
        symbols = {
            merge_commit = "M",
            commit = "*",
        },
        format = {
            timestamp = "%H:%M:%S %d-%m-%Y",
            fields = { "hash", "timestamp", "author", "branch_name", "tag" },
        },
        -- hooks = {
        --   on_select_commit = function(commit)
        --     print('selected commit:', commit.hash)
        --   end,
        --   on_select_range_commit = function(from, to)
        --     print('selected range:', from.hash, to.hash)
        --   end,
        -- },
        hooks = {
            -- Check diff of a commit
            on_select_commit = function(commit)
                vim.notify("DiffviewOpen " .. commit.hash .. "^!")
                vim.cmd(":DiffviewOpen " .. commit.hash .. "^!")
            end,
            -- Check diff from commit a -> commit b
            on_select_range_commit = function(from, to)
                vim.notify("DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
                vim.cmd(":DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
            end,
        },
    },
    keys = {
        {
            "<leader>glg",
            function()
                require("gitgraph").draw({}, { all = true, max_count = 5000 })
            end,
            desc = "GitGraph - Draw",
        },
    },
}
