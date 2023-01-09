return {
  "justinmk/vim-gtfo",
  keys = {
    {"gof", ':<c-u>call gtfo#open#file("%:p")<cr>', desc = "Open file in Finder"},
    {"got", ':<c-u>call gtfo#open#term("%:p:h", "")<cr>', desc = "Open file in term"},
    {"goF", ":<c-u>call gtfo#open#file(getcwd())<cr>", desc = "Open dir in Finder"},
    {"goT", ':<c-u>call gtfo#open#term(getcwd(), "")<cr>', desc = "Open term in cwd"}
  },
  config = function()
    vim.cmd [[ let g:gtfo#terminals = { 'mac' : 'iterm' } ]]
  end
}
