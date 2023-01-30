
function OptimizePHPSyntax()
	" syntax off
	syn clear
  " syn clear phpHereDoc
  " syn clear phpNowDoc
  " syn clear phpParent
  " syn clear phpFloat
  " syn clear phpOperator
  " syn clear phpComparison
  " syn clear phpRelation
  " syn clear phpNumber
  " syn clear phpMethodsVar
  " syn clear phpComment
  " syn clear phpRegion
  " syn clear phpStringSingle
endfunction

augroup php_and_family
  au!
  au BufReadPre *.php call OptimizePHPSyntax()
augroup END


" The following function takes a command such as the following
" >>   Map !NV key <plug-name> command
"      !       -indiucates that the mapping is silent
"      CAPS    -capital letters indicate noremap
function! Map(mode, key, ...) abort"{{{
  let ops=""
  for op in a:000
    let ops = ops . ' ' .op
  endfor

  "echomsg a:mode "-" a:key "-" ops
  let silent=""
  for c in split(a:mode, '\zs')
    if c == "!"                       | let silent="<silent>"      | continue | endif
    if type(c)==1 && tolower(c) !=# c | let c=tolower(c)."noremap" | else     | let c=tolower(c)."map" | endif
    if stridx(c, "t") == 0 && !has("nvim") | continue | endif
    execute c silent a:key ops
    let silent=""
  endfor
endfunction


function! StripWhitespace()"{{{
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction"}}}


function! FindGitDirOrRoot()
  return system("git rev-parse --show-toplevel | tr -d '\\n'")
endfunction

command! -nargs=* Map call Map(<f-args>)


function! Preserve(command)"{{{
  " Save the last search.
  let search = @/

  " Save the current cursor position.
  let cursor_position = getpos('.')

  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)

  " Execute the command.
  execute a:command

  " Restore the last search.
  let @/ = search

  " Restore the previous window position.
  call setpos('.', window_position)
  normal! zt

  " Restore the previous cursor position.
  call setpos('.', cursor_position)
endfunction"}}}

function! BufOnly(buffer, bang) "{{{
  if a:buffer == ''
    " No buffer provided, use the current buffer.
    let buffer = bufnr('%')
  elseif (a:buffer + 0) > 0
    " A buffer number was provided.
    let buffer = bufnr(a:buffer + 0)
  else
    " A buffer name was provided.
    let buffer = bufnr(a:buffer)
  endif

  "if buffer == -1
  "  echohl ErrorMsg
  "  echomsg "No matching buffer for" a:buffer
  "  echohl None
  "  return
  "endif

  let last_buffer = bufnr('$')

  let delete_count = 0
  let n = 1
  while n <= last_buffer
    if n != buffer && buflisted(n)
      if a:bang == '' && getbufvar(n, '&modified')
        echohl ErrorMsg
        echomsg 'No write since last change for buffer'
              \ n '(add ! to override)'
        echohl None
      else
        silent exe 'bdel' . a:bang . ' ' . n
        if ! buflisted(n)
          let delete_count = delete_count+1
        endif
      endif
    endif
    let n = n+1
  endwhile

  if delete_count == 1
    echomsg delete_count "buffer deleted"
  elseif delete_count > 1
    echomsg delete_count "buffers deleted"
  endif

endfunction "}}}


function s:BW(BWStage) "{{{
  "here is a more exotic version of my original BW script
  "delete the buffer; keep windows; create a scratch buffer if no buffers left
  if(a:BWStage == 1)
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:BWBufNum = bufnr("%")
    let s:BWWinNum = winnr()
    windo call s:BW(2)
    execute s:BWWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:BWBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
    else
      enew
      let l:newBuf = bufnr("%")
      windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
  endif
  execute s:BWWinNum . 'wincmd w'
endif
if(buflisted(s:BWBufNum) || s:BWBufNum == bufnr("%"))
  execute "bd! " . s:BWBufNum
endif
if(!s:buflistedLeft)
  set buflisted
  set bufhidden=delete
  set buftype=
  setlocal noswapfile
endif
  else
    if(bufnr("%") == s:BWBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:BWBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction "}}}

command! BW call s:BW(1)
nnoremap <silent> <Plug>BW :<C-u>BW<CR>

function! s:wipeout() "{{{
  "wipe unmodified Buffers|Tabs|Windows
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  let wiped = 0
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1 && !getbufvar(v:val,"&mod")')
    " echom buf
    silent execute 'bdelete!' buf
    let wiped += 1
  endfor
  echom wiped . ' buffers deleted'
endfunction

command! WipeoutUnmodified call s:wipeout()

command! -nargs=? -complete=buffer -bang BufOnly
      \ :call BufOnly('<args>', '<bang>')





" send paragraph under curso to terminal
function! Exec_on_term(cmd)
  if a:cmd=="normal"
    exec "normal \"vyip"
  else
    exec "normal gv\"vy"
  endif
  let g:floaterm_autoinsert_bu = g:floaterm_autoinsert
  let g:floaterm_autoinsert = v:false
  execute ":FloatermNew --title='rest' --autoinsert=0 --autoclose=0 --wintype=vsplit "getreg('v')
  let g:floaterm_autoinsert = g:floaterm_autoinsert_bu
endfunction

nnoremap <leader><cr> :call Exec_on_term("normal")<CR>
vnoremap <leader><cr> :<c-u>call Exec_on_term("visual")<CR>

function InsertRestRequest() abort
  let text = "icurl \"http://www.mall.local/api/mall/categories/1\" \\ | jq -R '. as $raw | try fromjson catch $raw'0kf\"vi\""
  call feedkeys(text)
endfunction

nnoremap <leader>i<cr> :call InsertRestRequest()<cr>
