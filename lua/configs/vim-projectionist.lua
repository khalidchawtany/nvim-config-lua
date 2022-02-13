local M = {}

M.init = function()
end

M.config = function()
end

return M


  -- ", {'on_cmd': ['E', 'S', 'V', 'T', 'A', 'AS', 'AV', 'AT']} )
  --   let g:projectionist_heuristics = {
  --     \   "etc/rbenv.d/|bin/rbenv-*": {
  --     \     "bin/rbenv-*": {
  --     \        "type": "command",
  --     \        "template": ["#!/usr/bin/env bash"],
  --     \     },
  --     \     "etc/rbenv.d/*.bash": {"type": "hook"}
  --     \   },
  --     \   "gigant/accounting/": {
  --     \     "gigant/accounting/*.php": {"type": "v"},
  --     \     "gigant/accounting/php/*.php": {"type": "p"},
  --     \     "gigant/accounting/modals/*/": {"type": "m"},
  --     \     "gigant/accounting/js/*.js": {"type": "j"}
  --     \   },
  --     \   "abc_turtle/": {
  --     \     "abc_turtle/app/Http/Controllers/*Controller.php": {"type": "c"},
  --     \     "abc_turtle/app/*.php": {"type": "m"},
  --     \     "abc_turtle/resources/bread/*.php": {"type": "b"},
  --     \     "abc_turtle/resources/views/*s/": {"type": "v"}
  --     \   }
  --     \ }
  --   nnoremap <leader>pc :execute ":Ec ".expand("%:t:r")<cr>
  --   nnoremap <leader>pb :execute ":Eb ".expand("%:t:r")<cr>
  --   nnoremap <leader>pv :execute ":Ev ".expand("%:t:r")<cr>
  --   nnoremap <leader>pp :execute ":Ep ".expand("%:t:r")<cr>
  --   nnoremap <leader>pj :execute ":Ej ".expand("%:t:r")<cr>
  --   nnoremap <leader>pm :execute ":Em ".expand("%:t:r")<cr>
