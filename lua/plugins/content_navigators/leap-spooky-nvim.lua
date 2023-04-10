return {
  "ggandor/leap-spooky.nvim",
  dependencies = {"ggandor/leap.nvim"},
  keys = {
    {"ir`", mode="o"},
    {"ir'", mode="o"},
    {'ir"', mode="o"},
    {"irB", mode="o"},
    {"ir}", mode="o"},
    {"ir{", mode="o"},
    {"irt", mode="o"},
    {"ir<", mode="o"},
    {"ir>", mode="o"},
    {"irb", mode="o"},
    {"ir)", mode="o"},
    {"ir(", mode="o"},
    {"ir]", mode="o"},
    {"ir[", mode="o"},
    {"irp", mode="o"},
    {"irs", mode="o"},
    {"irW", mode="o"},
    {"irw", mode="o"},
    {"iR`", mode="o"},
    {"iR'", mode="o"},
    {'iR"', mode="o"},
    {"iRB", mode="o"},
    {"iR}", mode="o"},
    {"iR{", mode="o"},
    {"iRt", mode="o"},
    {"iR<", mode="o"},
    {"iR>", mode="o"},
    {"iRb", mode="o"},
    {"iR)", mode="o"},
    {"iR(", mode="o"},
    {"iR]", mode="o"},
    {"iR[", mode="o"},
    {"iRp", mode="o"},
    {"iRs", mode="o"},
    {"iRW", mode="o"},
    {"iRw", mode="o"},
    {"im`", mode="o"},
    {"im'", mode="o"},
    {'im"', mode="o"},
    {"imB", mode="o"},
    {"im}", mode="o"},
    {"im{", mode="o"},
    {"imt", mode="o"},
    {"im<", mode="o"},
    {"im>", mode="o"},
    {"imb", mode="o"},
    {"im)", mode="o"},
    {"im(", mode="o"},
    {"im]", mode="o"},
    {"im[", mode="o"},
    {"imp", mode="o"},
    {"ims", mode="o"},
    {"imW", mode="o"},
    {"imw", mode="o"},
    {"iM`", mode="o"},
    {"iM'", mode="o"},
    {'iM"', mode="o"},
    {"iMB", mode="o"},
    {"iM}", mode="o"},
    {"iM{", mode="o"},
    {"iMt", mode="o"},
    {"iM<", mode="o"},
    {"iM>", mode="o"},
    {"iMb", mode="o"},
    {"iM)", mode="o"},
    {"iM(", mode="o"},
    {"iM]", mode="o"},
    {"iM[", mode="o"},
    {"iMp", mode="o"},
    {"iMs", mode="o"},
    {"iMW", mode="o"},
    {"iMw", mode="o"}
  },
  config = function()
    require("leap-spooky").setup {
      affixes = {
        -- These will generate mappings for all native text objects, like:
        -- (ir|ar|iR|aR|im|am|iM|aM){obj}.
        -- Special line objects will also be added, by repeating the affixes.
        -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
        -- window.
        -- You can also use 'rest' & 'move' as mnemonics.
        remote = {window = "r", cross_window = "R"},
        magnetic = {window = "m", cross_window = "M"}
      },
      -- If this option is set to true, the yanked text will automatically be pasted
      -- at the cursor position if the unnamed register is in use (and the object is
      -- "non-magnetic").
      yank_paste = false
    }
  end
}
--  require('leap').leap {
--   target_windows = { vim.fn.win_getid() }
--   action = require('leap-spooky').spooky_action(
--     function () return "viw" end,
--     { keeppos = true, on_return = (vim.v.operator == 'y') and 'p', },
--   ),
-- }
