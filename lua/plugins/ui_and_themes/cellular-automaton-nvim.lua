return {
  "Eandrju/cellular-automaton.nvim",
  cmd = {"CellularAutomaton"},
  module = "cellular-automation",
  keys = {
    {
      "<leader>ar",
      '<cmd>lua require("cellular-automaton").start_animation("make_it_rain")<cr>"',
      desc = "Rain (Animate)"
    },
    {
      "<leader>ag",
      '<cmd>lua require("cellular-automaton").start_animation("game_of_life")<cr>"',
      desc = "GoL (Animate)"
    }
  }
}
