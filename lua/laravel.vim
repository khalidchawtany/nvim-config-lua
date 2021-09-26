function! FindGitDirOrRoot()
  let curdir = expand('%:p:h')
  let bufname = bufname()
  if stridx(bufname, 'fern:' != 0)
    let start = stridx(bufname, 'file:')
    let end = stridx(bufname, ';')
    let curdir = strcharpart(bufname, start+7, end-start-7)
  else
    let curdir = expand('%:p:h')
  endif
  let gitdir = finddir('.git', curdir . ';')
  if gitdir == '.git'
    return '.'
  endif
  if gitdir != ''
    if has('mac')
      return substitute(gitdir, '\/\.git$', '', '')
    elseif has('win64')
      return substitute(gitdir, '\\.git$', '', '')
    endif
  else
    return '/'
  endif
endfunction

function! EditIfExists(path)
  if !empty(glob(a:path))
    execute ":edit" a:path "<cr>"
  else
    echo "path does not exist!"
  endif
endfunction

function! FindFile(path, ...)

  let root = FindGitDirOrRoot()

  let isOctober = isdirectory(root. '/plugins')
  let path = a:path

  if isOctober
    let currentFilePath = expand('%:.:h')

    if (stridx(expand('%:.:h'), 'plugins') >= 0)
      let firstPathSep = stridx(currentFilePath, '/', 8)
      let pluginPathSep = stridx(currentFilePath, '/', firstPathSep + 1)
      let pluginPath =  currentFilePath[:pluginPathSep]
      if (a:0 == 1)
        let path = pluginPath . a:1
      else
        let path = pluginPath . path
      endif
    else
      let path = root . '/plugins/'
    endif

  else
    return root . path
  endif
  return path

endfunction


"in test dd response
nnoremap <leader>dr A;<cr>dd($response);<esc>jI$response<esc>
"dd for selected variable
vnoremap <leader>dd "ryodd(<c-r>r);<esc>
vnoremap <leader>da "ryodd(<c-r>r->toArray());<esc>

" Concole log
nnoremap  <leader>cl "ryiwoconsole.log(<c-r>r);<esc>

Map N <leader>jr    :e <c-r>=FindFile('/resources/assets/js/router.js')<cr><cr>
Map N <leader>jn    :e <c-r>=FindFile('/resources/assets/js/components/navbar.vue')<cr><cr>
Map N <leader>jv    :FzfFiles <c-r>=FindFile('/resources/assets/js/views/')<cr><cr>
Map N <leader>js    :FzfFiles <c-r>=FindFile('/resources/assets/js/store/')<cr><cr>
Map N <leader>jd    :FzfFiles <c-r>=FindFile('/resources/assets/js/database/')<cr><cr>
Map N <leader>jm    :FzfFiles <c-r>=FindFile('/resources/assets/js/models/')<cr><cr>
Map N <leader>ja    :FzfFiles <c-r>=FindFile('/resources/assets/js/models/')<cr><cr>

Map N <leader>jj    :FzfFiles <c-r>=FindFile('/resources/assets/js/')<cr><cr>
Map N <leader>jc    :FzfFiles <c-r>=FindFile('/resources/assets/js/Components/')<cr><cr>
Map N <leader>jp    :FzfFiles <c-r>=FindFile('/resources/assets/js/Pages/')<cr><cr>
Map N <leader>jP    :FzfFiles <c-r>=FindFile('/resources/assets/js/Plugins/')<cr><cr>
Map N <leader>ju    :FzfFiles <c-r>=FindFile('/resources/assets/js/Utils/')<cr><cr>
Map N <leader>jl    :FzfFiles <c-r>=FindFile('/resources/assets/js/Layouts/')<cr><cr>

Map N <leader>Jr    :tabe <c-r>=FindFile('/resources/assets/js/router.js')<cr><cr>
Map N <leader>Jn    :tabe <c-r>=FindFile('/resources/assets/js/components/navbar.vue')<cr><cr>
Map N <leader>Jj    :tabe <c-r>=FindFile('/resources/assets/js/')<cr><cr>
Map N <leader>Jv    :tabe <c-r>=FindFile('/resources/assets/js/views/')<cr><cr>
Map N <leader>Js    :tabe <c-r>=FindFile('/resources/assets/js/store/')<cr><cr>
Map N <leader>Jc    :tabe <c-r>=FindFile('/resources/assets/js/components/')<cr><cr>
Map N <leader>Jd    :tabe <c-r>=FindFile('/resources/assets/js/database/')<cr><cr>
Map N <leader>Jm    :tabe <c-r>=FindFile('/resources/assets/js/models/')<cr><cr>
Map N <leader>Ja    :tabe <c-r>=FindFile('/resources/assets/js/models/')<cr><cr>

Map N <leader>lw    :e <c-r>=FindFile('/routes/')<cr><cr>
Map N <leader>lu    :e <c-r>=FindFile('/public/')<cr><cr>
Map N <leader>lj    :FzfFiles <c-r>=FindFile('/public/js/')<cr><cr>
Map N <leader>lR    :FzfFiles <c-r>=FindFile('/resources/')<cr><cr>
Map N <leader>la    :FzfFiles <c-r>=FindFile('/app/', 'models')<cr><cr>
Map N <leader>ll    :tabe <c-r>=FindFile('/lan/', 'lang')<cr><cr>
Map N <leader>le    :FzfFiles <c-r>=FindFile('/app/events/', 'classes/event')<cr><cr>
Map N <leader>lc    :FzfFiles <c-r>=FindFile('/app/Http/Controllers', 'controllers')<cr><cr>
Map N <leader>lf    :FzfFiles <c-r>=FindFile('/database/factories/')<cr><cr>
Map N <leader>lh    :FzfFiles <c-r>=FindFile('/app/Helpers/')<cr><cr>
Map N <leader>lm    :FzfFiles <c-r>=FindFile('/database/migrations/', 'updates')<cr><cr>
Map N <leader>lo    :FzfFiles <c-r>=FindFile('/app/Observers/')<cr><cr>
Map N <leader>lp    :FzfFiles <c-r>=FindFile('/app/Providers/', '/')<cr><cr>
Map N <leader>lr    :FzfFiles <c-r>=FindFile('/app/Http/Requests/')<cr><cr>
Map N <leader>ls    :FzfFiles <c-r>=FindFile('/database/seeds/')<cr><cr>
Map N <leader>lT    :FzfFiles <c-r>=FindFile('/app/traits/')<cr><cr>
Map N <leader>lt    :FzfFiles <c-r>=FindFile('/tests/')<cr><cr>
Map N <leader>lv    :FzfFiles <c-r>=FindFile('/resources/views/')<cr><cr>
Map N <leader>lB    :FzfFiles <c-r>=FindFile('/resources/bread/')<cr><cr>
Map N <leader>lbb   :FzfFiles <c-r>=FindFile('/resources/bread/')<cr><cr>
Map N <leader>lbc   :e <c-r>=FindFile('/vendor/Kjdion84/laraback/src/Commands/BreadCommand.php')<cr><cr>
Map N <leader>lbs   :e <c-r>=FindFile('/vendor/Kjdion84/laraback/resources/bread/stubs/default/')<cr><cr>

Map N <leader>Lu    :tabe <c-r>=FindFile('/public/')<cr><cr>
Map N <leader>Lj    :tabe <c-r>=FindFile('/public/js/')<cr><cr>
Map N <leader>LR    :tabe <c-r>=FindFile('/resources/')<cr><cr>
Map N <leader>Lw    :tabe <c-r>=FindFile('/routes/')<cr><cr>
Map N <leader>La    :tabe <c-r>=FindFile('/app/', 'models')<cr><cr>
Map N <leader>Ll    :tabe <c-r>=FindFile('/lan/', 'lang')<cr><cr>
Map N <leader>Le    :tabe <c-r>=FindFile('/app/events/', 'classes/collection/event')<cr><cr>
Map N <leader>Lc    :tabe <c-r>=FindFile('/app/Http/Controllers', 'controllers')<cr><cr>
Map N <leader>Lf    :tabe <c-r>=FindFile('/database/factories/')<cr><cr>
Map N <leader>Lh    :tabe <c-r>=FindFile('/app/Helpers/')<cr><cr>
Map N <leader>Lm    :tabe <c-r>=FindFile('/database/migrations/', 'updates')<cr><cr>
Map N <leader>Lo    :tabe <c-r>=FindFile('/app/Observers/')<cr><cr>
Map N <leader>Lp    :tabe <c-r>=FindFile('/app/Providers/', '/plugins')<cr><cr>
Map N <leader>Lr    :tabe <c-r>=FindFile('/app/Http/Requests/')<cr><cr>
Map N <leader>Ls    :tabe <c-r>=FindFile('/database/seeds/')<cr><cr>
Map N <leader>LT    :tabe <c-r>=FindFile('/app/traits/')<cr><cr>
Map N <leader>Lt    :tabe <c-r>=FindFile('/tests/')<cr><cr>
Map N <leader>Lv    :tabe <c-r>=FindFile('/resources/views/')<cr><cr>
Map N <leader>LB    :tabe <c-r>=FindFile('/resources/bread/')<cr><cr>
Map N <leader>Lbb   :tabe <c-r>=FindFile('/resources/bread/')<cr><cr>
Map N <leader>Lbc   :tabe <c-r>=FindFile('/vendor/Kjdion84/laraback/src/Commands/BreadCommand.php')<cr><cr>
Map N <leader>Lbs   :tabe <c-r>=FindFile('/vendor/Kjdion84/laraback/resources/bread/stubs/default/')<cr><cr>
