" let NVIM_QT_RUNTIME_PATH="./Contents/Resources/runtime"

"GuiFont! Source Code Pro for PowerLine:h18
 " set guifont=Operator\ Mono\ Lig:h18
 " set guifont=OperatorMonoLig\ Nerd\ Font:h18
 " GuiFont! OperatorMonoLig Nerd Font:h18
 " GuiFont! Fira Code:h20
 GuiFont! FiraCode Nerd Font:h18
" set guifont=OperatorMono\ Nerd\ Font:h18
" set guifont=PT\ Mono:h20
" set guifont=RobotoMono\ Nerd\ Font:h19

hi Title guibg=#afd7ff

" Support ligature
call rpcnotify(0, 'Gui', 'Option', 'RenderLigatures', 1)
let g:render_ligatures = 1
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
set linespace=14
call SetLineSpace(0)


nnoremap <silent> <D-=> :exec 'GuiFont' substitute(fnameescape(&guifont), '\d\+$', '\=submatch(0)+1', '')<cr>
nnoremap <silent> <D--> :exec 'GuiFont' substitute(fnameescape(&guifont), '\d\+$', '\=submatch(0)-1', '')<cr>

nnoremap <silent> <M-D--> :call SetLineSpace(-1)<cr>
nnoremap <silent> <M-D-=> :call SetLineSpace(1)<cr>

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

"Make CMD+V paste from external clipboard
nnoremap <D-V> <c-\><c-n>"+p
tnoremap <D-V> <c-\><c-n>"+pi
cnoremap <D-V> <c-r>+
vnoremap <D-V> "+p

nnoremap <D-S> <cmd>w<cr>

inoremap <D-V> <c-\><c-n>:set paste<cr>"+p:set nopaste<cr>li
nnoremap <D-P> <c-\><c-n>"+p
tnoremap <D-P> <c-\><c-n>"+pi
cnoremap <D-P> <c-r>+
vnoremap <D-P> "+p
inoremap <D-P> <c-\><c-n>:set paste<cr>"+p:set nopaste<cr>li

vnoremap <D-C> "+y
vnoremap <D-Y> "+y
" tnoremap <D-v> <C-\><C-N>"+pA
nnoremap <D-v> <C-\><C-N>"+pA
vnoremap <D-c> "+y

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
if has('mac')
    let $PYTHONPATH="/usr/local/Cellar/llvm/HEAD-f63894b/lib/python2.7/site-packages/lldb:$PYTHONPATH"
endif


if $NVIM_LISTEN_ADDRESS == '/tmp/nvimsocket'
  "***************MUST BE LAST LINE*******
  "Start neovim-qt as maximized borderless.
    GuiTabline 0
    GuiPopupmenu 0
    call GuiWindowMaximized(2)
    cd ~/.config/nvim/
endif
