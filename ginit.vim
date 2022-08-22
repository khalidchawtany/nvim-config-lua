
hi Title guibg=#afd7ff


" Support ligature
call rpcnotify(0, 'Gui', 'Option', 'RenderLigatures', 0)
let g:render_ligatures = 0
nnoremap <silent> <leader>o<cr> :let g:render_ligatures =  (g:render_ligatures + 1) % 2 \| call rpcnotify(0, 'Gui', 'Option', 'RenderLigatures', g:render_ligatures)<cr>

let g:gui_fonts = [
      \ 'PT\ Mono:17',
      \ 'Operator\ Mono\ Lig:h17',
      \ 'RobotoMono\ Nerd\ Font:h18',
      \ 'Monaco:h17',
      \ 'Source\ Code\ Pro\ for\ PowerLine:h17',
      \ 'Fura\ Mono\ Nerd\ Font:17'
      \ ]

let g:current_gui_font_index = 0
function! ToggleFont(dir)
  let g:current_gui_font_index += a:dir
  let g:current_gui_font_index = g:current_gui_font_index % len(g:gui_fonts)
  execute 'set guifont='. fnameescape(g:gui_fonts[g:current_gui_font_index])
  echo g:gui_fonts[g:current_gui_font_index]
endfunction

command! NextFont call ToggleFont(1)
command! PrevFont call ToggleFont(-1)
nnoremap c]f :<c-u>NextFont<cr>
nnoremap c[f :<c-u>PrevFont<cr>


function! SetLineSpace(inc)
  let linespace = &linespace + a:inc
  exec 'set linespace='. linespace
  call rpcnotify(0, 'Gui', 'Linespace', linespace)
endfunction
set linespace=10
call SetLineSpace(10)

" command! Bigger  :let &guifont = substitute(&guifont, '\d\+', '\=submatch(0)+1', '')
" command! Smaller :let &guifont = substitute(&guifont, '\d\+', '\=submatch(0)-1', '')

command! Bigger  :exec "GuiFont!" substitute(&guifont, '\d\+', '\=submatch(0)+1', '')
command! Smaller  :exec "GuiFont!" substitute(&guifont, '\d\+', '\=submatch(0)-1', '')


nnoremap <silent> <D-=> :Bigger<cr>
nnoremap <silent> <D--> :Smaller<cr>

 nnoremap <silent> <M-D--> :let &linespace = substitute(&linespace, '\d\+$', '\=submatch(0)-1', '')<cr>:execute "GuiLinespace " substitute(&linespace, '\d\+$', '\=submatch(0)-1', '')<cr>
 nnoremap <silent> <M-D-=> :let &linespace = substitute(&linespace, '\d\+$', '\=submatch(0)+1', '')<cr>:execute "GuiLine" substitute(&linespace, '\d\+$', '\=submatch(0)+1', '')<cr>


nnoremap <silent> <c-w>m :call GuiWindowMaximized((g:GuiWindowMaximized + 1) % 2)<cr>
nnoremap <silent> <c-w>f :call GuiWindowFullScreen((g:GuiWindowFullScreen + 1) % 2)<cr>
let g:WindowFrameless=0
nnoremap <silent> <c-w><bs>   :let g:WindowFrameless=(g:WindowFrameless + 1) % 2<cr>:call rpcnotify(0, 'Gui', 'WindowFrameless', g:WindowFrameless)<cr>

set mouse=a
set nottimeout

if &background == "light"
    hi PmenuSel guibg=darkorange guifg=#B34826
else
    hi PmenuSel guibg=darkorange guifg=#B34826
endif

"Make c-^ consitent between terminal and GUI
map <c-6> <c-^>

nnoremap <D-s> <cmd>w<cr>

"Make CMD+V paste from external clipboard
inoremap <D-v> <c-\><c-n>:set paste<cr>"+p:set nopaste<cr>li
nnoremap <D-v> <c-\><c-n>"+p
tnoremap <D-v> <c-\><c-n>"+pi
cnoremap <D-v> <c-r>+
vnoremap <D-v> "+p
inoremap <D-v> <c-\><c-n>:set paste<cr>"+p:set nopaste<cr>li

vnoremap <D-c> "+y
vnoremap <D-y> "+y
" tnoremap <D-v> <C-\><C-N>"+pA
" noremap <D-p> <nop>

"Prevent neovim-qt to map HYPER
noremap <M-C-D-Space> <nop>
noremap <M-C-D-S-Space> <nop>
"Map CMD-# to tabs
for i in [1,2,3,4,5,6,7,8,9]
  execute "nnoremap <silent> <D-" . i . ">            :tabnext " . i . "<cr>"
  execute "vnoremap <silent> <D-" . i . ">       <c-u>:tabnext " . i . "<cr>"
  execute "tnoremap <silent> <D-" . i . "> <c-\\><c-n>:tabnext " . i . "<cr>"
endfor

let i = 0
execute "nnoremap <silent> <D-" . i . ">            :tabnext 10<cr>"
execute "vnoremap <silent> <D-" . i . ">       <c-u>:tabnext 10<cr>"
execute "tnoremap <silent> <D-" . i . "> <c-\\><c-n>:tabnext 10<cr>"


"Fix the lldb path
" ln -s /usr/local/Cellar/llvm/HEAD-f63894b/lib/liblldb.4.0.0.dylib /usr/local/Cellar/llvm/HEAD-f63894b/lib/python2.7/site-packages/_lldb.so
" if has('mac')
"     let $PYTHONPATH="/usr/local/Cellar/llvm/HEAD-f63894b/lib/python2.7/site-packages/lldb:$PYTHONPATH"
" endif

" let $PATH=$PATH.":/Users/juju/.config/nvim_lua/lsp/phpactor/bin"

let $PATH=$PATH.":/Users/juju/Development/Libraries/zf/zig-out/bin/"

if $NVIM_LISTEN_ADDRESS == '/tmp/nvimsocket'
  "***************MUST BE LAST LINE*******
  "Start neovim-qt as maximized borderless.
    GuiTabline 0
    GuiPopupmenu 0
    call GuiWindowMaximized(2)
    cd ~/.config/nvim/
" let NVIM_QT_RUNTIME_PATH="./Contents/Resources/runtime"

 " GuiFont! FiaCode Nerd Font Mine:h18
 GuiFont! OperatorMonoLig Nerd Font:h18

endif

hi NonText guifg=#333355
