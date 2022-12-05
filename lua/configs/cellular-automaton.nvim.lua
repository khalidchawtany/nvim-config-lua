local M = {
    cmd = { "CellularAutomaton" },
    module = "cellular-automation"

}

M.init = function()


    vim.keymap.set(
        "n",
        "<leader>ar",
        function()
            require("cellular-automaton").start_animation("make_it_rain")
        end,
        { desc = "Rain" }
    )

    vim.keymap.set(
        "n",
        "<leader>ag",
        function()
            require("cellular-automation").start_animation("game_of_life")
        end,
        { desc = "GOF" }
    )

end


return M
