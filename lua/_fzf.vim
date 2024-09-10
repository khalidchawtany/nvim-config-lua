
au FileType fzf set nonu nornu

" autocmd! FileType fzf set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" autocmd! User FzfStatusLine execute("set statusline=". &statusline )
"
autocmd! User FzfStatusLine execute("")

au OptionSet background call s:SetFzfColors()

function s:SetFzfColors()

	if has('mac')
		let s:fzf_history = "/Users/JuJu/.fzf_history"
		let s:null = 'null'
	elseif has('win64')
		let s:fzf_history = "C:/Users/juju/.fzf_history"
		let s:null = 'nul'
	endif

	if &background == 'dark'
					" \." --bind 'ctrl-r:reload:$FZF_DEFAULT_COMMAND'"
		let $FZF_DEFAULT_OPTS=" --history=".s:fzf_history." --pointer=' ▶'"
                    \." --preview-window down,50%,border-top"
					\." --marker='◉ ' --reverse"
					\." --bind 'ctrl-w:select-all,ctrl-l:jump,ctrl-f:toggle-preview'"
					\." --bind 'ctrl-x:change-preview-window(right,50%,border-right|hidden|down,50%,border-top)'"
					\." --bind 'ctrl-r:change-preview-window(right,45%|right,40%|right,35%|right,30%|right,25%|right,20%|right,15%|)'"
					\." --color=bg:#24283b,bg+:#234F84,fg+:#B9CDF7,hl:#00C8E0,hl+:#44ff44,gutter:#24283b,marker:#00ffff,border:#00A9BF,separator:#24283b"
	else

		hi Normal guibg=white
		hi NormalFloat guibg=white
		hi NormalNC guibg=white
		hi NormalSB guibg=white

        let normal_bg = synIDattr(synIDtrans(hlID("Normal")), "bg#")

		let $FZF_DEFAULT_OPTS=" --history=".s:fzf_history." --pointer=' ▶'"
					\." --marker='◉ ' --reverse"
					\." --bind 'ctrl-r:reload:$FZF_DEFAULT_COMMAND'"
					\." --bind 'ctrl-w:select-all,ctrl-l:jump,ctrl-f:toggle-preview'"
					\." --bind 'ctrl-x:change-preview-window(down,40%,border-top|hidden|)'"
					\." --bind 'ctrl-r:change-preview-window(right,45%|right,40%|right,35%|right,30%|right,25%|right,20%|right,15%|)'"
					\." --color=bg:" . normal_bg . ",bg+:#B9CDF7,fg+:#234F84,hl:#00C8E0,hl+:#44ff44,gutter:" . normal_bg . ",marker:#00ffff,border:#00A9BF,separator:#e1e2e7"
					" \." --color=bg:#e1e2e7,bg+:#B9CDF7,fg+:#234F84,hl:#00C8E0,hl+:#44ff44,gutter:#e1e2e7,marker:#00ffff,border:#00A9BF,separator:#e1e2e7"


	endif

endfunction
call s:SetFzfColors()

let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules}/*" --glob "!*{.jpg,png}" 2> /dev/'.s:null

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

let g:fzf_nvim_statusline=0


let g:fzf_command_prefix = 'Fzf'

"Show FZF in a floating window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
" let $FZF_DEFAULT_OPTS='--layout=reverse'
"let g:fzf_layout = { 'window': 'execute (tabpagenr()-1)."tabnew"' }
"let g:fzf_layout = { 'window': '-tabnew' }

" only show MRU files from within your cwd
let g:fzf_mru_relative = 1

" to enable found references displayed in fzf
let g:LanguageClient_selectionUI = 'fzf'

" Command Local Options {{{
" [Files] Extra options for fzf
"         e.g. File preview using coderay (http://coderay.rubychan.de/)
let g:fzf_files_options =
      \ '--preview "(coderay {} || cat {}) 2> /dev/' . s:null . ' | head -'.&lines.'"'


" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options =
      \ '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
"let g:fzf_commands_expect = 'alt-enter,ctrl-x'
"}}} _Command Local Options

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)

nnoremap silent! <c-p><c-a> <cmd>Rg<cr>
nnoremap silent! <c-p>a <cmd>Rg <c-r><c-w><cr>



command! -bang -nargs=* FZFAg call fzf#vim#grep('rg --column --no-ignore --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!{.git,node_modules,vendor}/*" --color "always" '.shellescape(<q-args>) . ' 2> /dev/'.s:null, 1, <bang>0)

command! -bang -nargs=* FzfHelpOctober call fzf#vim#grep('rg --column --no-ignore --line-number --no-heading --color=always --smart-case --glob "!{.git,node_modules,vendor}/*" --glob  "!**/lang/*" --glob "!**/{ru,zh-cn}/*" '.shellescape(<q-args>) . ' ~/Development/Libraries/october', 1,fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

command! -bang -nargs=* FzfHelpTic call fzf#vim#grep('rg --column --no-ignore --line-number --no-heading --color=always --smart-case --glob "!{.git,node_modules,vendor}/*" --glob  "!**/lang/*" --glob "!**/{ru,zh-cn}/*" '.shellescape(<q-args>) . ' ~/Projects/PHP/tic/plugins/lox/tic/', 1,fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" nnoremap <silent> <leader>hoo <cmd>FzfHelpOctober<cr>
" nnoremap <silent> <leader>hot <cmd>FzfHelpTic<cr>


command! -bang -nargs=* Rg2 call fzf#vim#grep("rg --column --no-ignore --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <silent> <c-p><c-a> :Rg2 <CR>
nnoremap <silent> <c-p>a :Rg2 <C-R><C-W><CR>
nnoremap <silent> <c-p><c-j> :FzfAg <CR>
nnoremap <silent> <c-p>j :FzfAg <C-R><C-W><CR>


nnoremap <silent> <c-p><c-u> :FzfHistory<cr>
nnoremap <silent> <c-p>u     :FZFMru<cr>

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/' . s:null)[:-2]
endfunction

function! Map_FZF(cmd, key, options, cword)
  exe "nnoremap <silent> <c-p><c-" . a:key . "> :" . a:cmd . a:options . "<cr>"
  "This type is where no args passed
  if a:cword == 0
    exe "nnoremap <silent> <c-p>" . a:key . " :" . a:cmd . a:options . "<cr>"

    "This type is where -q used pass args
  elseif a:cword == 1
    exe "nnoremap <silent> <c-p>" . a:key . " :" . a:cmd . a:options .
          \ " -q <c-r>=shellescape(expand('<cword>'))<cr>" . "<cr>"
    exe "vnoremap <silent> <c-p>" . a:key . " :<c-u>" . a:cmd . a:options .
          \ " -q <c-r>=shellescape(GetVisualSelection())<cr>" . "<cr>"

    "This type is where 'word DOES produce results
  elseif a:cword == 2
    exe "nnoremap <silent> <c-p>" . a:key . " :" . a:cmd . a:options .
          \ " '<c-r>=expand('<cword>')<cr><cr>"
    exe "vnoremap <silent> <c-p>" . a:key . " :<c-u>" . a:cmd . a:options .
          \ " '<c-r>=GetVisualSelection()<cr><cr>"

    "This type is where 'word does NOT produce results
  elseif a:cword == 3
    exe "nnoremap <silent> <c-p>" . a:key . " :" . a:cmd . a:options .
          \ " <c-r>=expand('<cword>')<cr><cr>"
    exe "vnoremap <silent> <c-p>" . a:key . " :<c-u>" . a:cmd . a:options .
          \ " <c-r>=GetVisualSelection()<cr><cr>"
  endif
  if has('nvim')
    exe "tnoremap <silent> <c-p><c-" . a:key . "> <c-\\><c-n>:" . a:cmd . a:options "<cr>"
  endif

endfunction


"call Map_FZF  ( "COMMAND"   , "KEY"   , "OPTIONS"                                                                        , cw )
call Map_FZF  ( "FZF "     , "d"     , " --reverse %:p:h "                                                              , 0  )
call Map_FZF  ( "FZF "     , "r"     , " --reverse <c-r>=FindGitDirOrRoot()<cr>"                                        , 0  )
call Map_FZF  ( "FzfFiles "    , "p"   , ''                                                                               , 2  )
" call Map_FZF  ( "FzfAg"       , "a"     , ""                                                                               , 3  )
call Map_FZF  ( "FzfLines"    , "L"     , ""                                                                               , 2  )
call Map_FZF  ( "FzfBLines"   , "l"     , ""                                                                               , 2  )
call Map_FZF  ( "FzfBTags"    , "t"     , ""                                                                               , 0  )
call Map_FZF  ( "FzfTags"     , "]"     , ""                                                                               , 0  )
"call Map_FZF  ( "FzfLocate"    , "<cr>"  , "--reverse  %:p:h"                                                               , 0  )
call Map_FZF  ( "FzfGitFiles"  , "v"     , ''                                                                               , 0  )
call Map_FZF  ( "FzfCommits"  , "C"     , ""                                                                               , 0  )
call Map_FZF  ( "FzfBCommits!" , "c"     , ""                                                                               , 0  )
call Map_FZF  ( "FzfSnippets" , "s"     , ""                                                                               , 0  )
call Map_FZF  ( "FzfMarks"    , "<c-'>" , ""                                                                               , 0  )
call Map_FZF  ( "FzfMarks"    , "'"     , ""                                                                               , 0  )
call Map_FZF  ( "FzfWindows"  , "w"     , ""                                                                               , 0  )
call Map_FZF  ( "FzfHelptags" , "k"     , ""                                                                               , 0  )
" call Map_FZF  ( "FzfHistory" , "h"     , ""                                                                               , 0  )

function! GetFunctions()
  let query = ''
  if &ft == 'php'
    let query = 'function'
  endif
  exe ':FzfBLines!' query
endfunction
nnoremap <silent> <c-p><c-f> <cmd>call GetFunctions()<cr>

nnoremap <silent> <c-p><c-g> <cmd>FzfGitFiles?<cr>
nnoremap <silent> <c-p>g <cmd>FzfGitFiles?<cr>

"The last param is <bang>0 to make it fullscreen
nnoremap <silent> <c-p>p :silent! call fzf#vim#files(getcwd(), {'options': '--reverse -q '.shellescape(expand('<cword>'))}, 1)<cr>


"nmap <c-p><c-i> <plug>(fzf-maps-n)
nnoremap <silent> <c-p><c-m> :FzfMaps!<cr>
xmap <silent> <c-p><c-m> <plug>(fzf-maps-x)
omap <silent> <c-p><c-m> <plug>(fzf-maps-o)

imap <silent> <c-x><c-k> <plug>(fzf-complete-word)
imap <silent> <c-x><c-f> <plug>(fzf-complete-path)
imap <silent> <c-x><c-a> <plug>(fzf-complete-file-ag)
imap <silent> <c-x><c-l> <plug>(fzf-complete-line)
imap <silent> <c-x><c-i> <plug>(fzf-complete-buffer-line)
imap <silent> <c-x><c-\> <plug>(fzf-complete-file)


nnoremap <silent> <c-p><c-h> :call fzf#run({"source":"git diff --name-only HEAD HEAD~1 " , "sink":"edit"})<cr>

"Get all files including git ignore
nnoremap <silent> <c-p><space> :call fzf#run({"source":"ag -all -l  \"\" \| sort -u " , "sink":"edit"})<cr>
" nnoremap <silent> <c-p><space> :call fzf#run({"source":"ag -all -l  \"\" \| sort -u " , "sink":"edit"})<cr>
" nnoremap <silent> <c-p><c-space> <cmd>FzfHistory!<cr>

function! s:get_directories()
  call fzf#run({"source":"ag -l --nocolor -g \"\" | gawk 'NF{NF-=1};1' FS=/ OFS=/ | sort -u | uniq" , "sink":"e"})
  "find . -type d   -not -iwholename \"./.phpcd*\" -not -iwholename \"./node_modules*\" -not -iwholename \".\" -not -iwholename \"./vendor*\" -not -iwholename \"./.git*\"
  "ag -l --nocolor -g "" | awk 'NF{NF-=1};1' FS=/ OFS=/ | sort -u | uniq
endfunction
nnoremap <silent> <c-p>[ :call fzf#run({"source":"find . -type d", "sink":"e"})<cr>
nnoremap <silent> <c-p><c-[> :cal <SID>get_directories()<cr>

" Replace the default dictionary completion with fzf-based fuzzy completion
" inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')

function! PrintPathFunction(myParam)
  execute ":normal i".a:myParam
endfunction
command! -nargs=1 PrintPath call PrintPathFunction(<f-args>)

function! PrintPathInNextLineFunction(myParam)
  put=a:myParam
endfunction

command! -nargs=1 PrintPathInNextLine call PrintPathInNextLineFunction(<f-args>)

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

function! s:build_location_list(lines)
  call setloclist(0, map(copy(a:lines), '{ "filename": v:val }'))
  lopen
  ll
endfunction


let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-l': function('s:build_location_list'),
      \ 'ctrl-t': 'tabedit!',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }
" \ 'ctrl-i': 'PrintPath',
" \ 'ctrl-o': 'PrintPathInNextLine',

command! FZFMru call fzf#run({
      \ 'source':  reverse(s:all_files()),
      \ 'sink':    'edit',
      \ 'options': '--no-sort -x',
      \ 'window': { 'width': 0.9, 'height': 0.7 } })
      " \ 'options': ' --reverse -m --no-sort -x',

function! s:all_files()
  return extend(
        \ filter(copy(v:oldfiles),
        \        "v:val !~ 'term:\\|fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
        \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

" Tabs {{{
function! s:tablist()
  redir => tabs
  silent tabs
  redir END
  let new_tabs = filter(split(tabs, '\n'), 'v:val =~ "Tab page"')
  let i = 0
  while i < len(new_tabs)
    let current_tab_buffers = map(tabpagebuflist(i + 1), "bufname(v:val)")
    let current_tab_buffers = map(current_tab_buffers, "substitute(v:val, 'term:.*', ':term:', '') ")
    let current_tab_buffers = map(current_tab_buffers, "substitute(v:val, '^.*/', '', '')")
    let new_tabs[i] = new_tabs[i] . '             '.join(current_tab_buffers, ' | ')
    let i = i + 1
  endwhile
  return new_tabs
endfunction

function! s:tabopen(e)
  "echomsg 'bufname='bufname("")
  "echomsg ':normal! '. matchstr(a:e, 'Tab page \zs[0-9]*\ze .*$').'gt'
  "execute 'normal! ' . matchstr(a:e, 'Tab page \zs[0-9]*\ze .*$').'gt'
  execute ':tabnext ' . matchstr(a:e, 'Tab page \zs[0-9]*\ze .*$')
  "let g:fzf_cmd='normal! ' . matchstr(a:e, 'Tab page \zs[0-9]*\ze .*$').'gt'
  "call timer_start(50, '<sid>SwitchTab', {'repeat': 1})
endfunction
"func! s:SwitchTab(timer)
"execute g:fzf_cmd
"endfunc

if has('nvim')
  tmap <silent> <c-p><c-i> <c-\><c-n><c-p><c-i>
endif

command! FzfTabs :call fzf#run({
      \   'source':  reverse(<sid>tablist()),
      \   'sink':    function('<sid>tabopen'),
      \   'options': " --preview-window right:50%  --preview 'echo {}'  --bind ?:toggle-preview",
      \ })

nnoremap <silent> <c-p><c-i>  <cmd>FzfTabs<cr>

"}}} _Tabs

"open_buffers -term {{{
function! s:buflist()
  redir => ls
  silent ls
  redir END
  "get all buffers excpt the ones that has term:// in them
  return  filter(split(ls, '\n'), 'v:val !~ "term://"')
endfunction

function! s:bufopen(e)
  let g:bufopen_cmd = get({'ctrl-s': 'split |',
        \ 'ctrl-v': 'vertical split |',
        \ 'ctrl-t': 'tabnew | '}, a:e[0], '')

  let bufferNumber = matchstr(a:e[1], '^[ 0-9]*')
  execute g:bufopen_cmd 'buffer' bufferNumber
  " execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction


" nnoremap <silent> <c-p><c-o> :call fzf#run({
"       \   'source':  reverse(<sid>buflist()),
"       \   'sink':    function('<sid>bufopen'),
"       \   'options': '+m --reverse',
"       \   'window':    '-tabnew'
"       \ })<CR>
nnoremap <silent> <c-p><c-o> <cmd>call fzf#run({
      \   'source':  reverse(<sid>buflist()),
      \   'sink*':    function('<sid>bufopen'),
      \   'options': '+m --reverse --expect=ctrl-t,ctrl-v,ctrl-s',
      \   'window': { 'width': 0.9, 'height': 0.7 }
      \ })<CR>

"}}} _open_buffers -term

"FzfNeighbor {{{
function! s:fzf_neighbouring_files()
  let current_file =expand("%")
  let cwd = fnamemodify(current_file, ':p:h')
  let command = 'ag -g "" -f ' . cwd . ' --depth 0'

  call fzf#run({
        \ 'source': command,
        \ 'sink':   'e',
        \ 'options': '-m -x +s',
      \   'window': { 'width': 0.9, 'height': 0.7 }
        \ })
endfunction

command! FZFNeigh call s:fzf_neighbouring_files()
nnoremap <silent> <c-p><c-n> <cmd>FZFNeigh<cr>
"}}} _FzfNeighbor

"Ag {{{
function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-s': 'split',
        \ 'ctrl-v': 'vertical split',
        \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* AgCustom call fzf#run({
      \ 'source':  printf('ag --nogroup --column --color "%s"',
      \                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
      \ 'sink*':    function('<sid>ag_handler'),
      \ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
      \            '--multi --bind=ctrl-w:select-all,ctrl-d:deselect-all '.
      \            '--color hl:68,hl+:110',
      \   'window': { 'width': 0.9, 'height': 0.7 }
      \ })
nnoremap <silent> <c-p><c-q> <cmd>FZFNeigh<cr>
"}}} _Ag

"open_terms {{{
function! s:termlist()
  redir => ls
  silent ls!
  redir END
  "get term:// buffers
  return  filter(filter(split(ls, '\n'), 'v:val =~ "term://"'), 'v:val !~ "fzf"')
endfunction

function! s:termtabopen(e)
  let l:term_buffer_id = str2nr(matchstr(a:e, '^[ 0-9]*'))
  let l:buffers_parent_tab = -1
  for i in range(tabpagenr('$'))
    if (index(tabpagebuflist(i + 1), l:term_buffer_id) >= 0)
      let l:buffers_parent_tab = i + 1
    endif
  endfor
  if (buffers_parent_tab >= 0)
    execute "tabnext " l:buffers_parent_tab
    execute bufwinnr(l:term_buffer_id) "wincmd w"
  else
    execute 'buffer' l:term_buffer_id
  endif
endfunction
nnoremap <silent> <c-p><c-;> <cmd>call fzf#run({
      \   'source':  reverse(<sid>termlist()),
      \   'sink':    function('<sid>termtabopen'),
      \   'options': '+m --reverse',
      \   'window': { 'width': 0.9, 'height': 0.7 }
      \ })<CR>

"}}} _open_terms



