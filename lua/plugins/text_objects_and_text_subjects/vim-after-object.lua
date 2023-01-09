return {
  "junegunn/vim-after-object",
  keys = {
    {"a]",    mode = "o"},
    {"a[",    mode = "o"},
    {"a=",    mode = "o"},
    {"a:",    mode = "o"},
    {"a-",    mode = "o"},
    {"a#",    mode = "o"},
    {"a ",    mode = "o"},
    {"a>",    mode = "o"},
    {"a<",    mode = "o"},
    {"aa]",   mode = "o"},
    {"aa[",   mode = "o"},
    {"aa=",   mode = "o"},
    {"aa:",   mode = "o"},
    {"aa-",   mode = "o"},
    {"aa#",   mode = "o"},
    {"aa ",   mode = "o"},
    {"aa>",   mode = "o"},
    {"aa<",   mode = "o"}
  },
  config = function()
    vim.cmd[[call after_object#enable(']', '[', '=', ':', '-', '#', ' ', '>', '<')]]
  end
}
