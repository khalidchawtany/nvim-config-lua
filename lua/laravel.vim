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

Map n <leader>jr    :e <c-r>=FindFile('/resources/assets/js/router.js')<cr><cr>
Map n <leader>jn    :e <c-r>=FindFile('/resources/assets/js/components/navbar.vue')<cr><cr>
Map n <leader>jv    :FzfFiles <c-r>=FindFile('/resources/assets/js/views/')<cr><cr>
Map n <leader>js    :FzfFiles <c-r>=FindFile('/resources/assets/js/store/')<cr><cr>
Map n <leader>jd    :FzfFiles <c-r>=FindFile('/resources/assets/js/database/')<cr><cr>
Map n <leader>jm    :FzfFiles <c-r>=FindFile('/resources/assets/js/models/')<cr><cr>
Map n <leader>ja    :FzfFiles <c-r>=FindFile('/resources/assets/js/models/')<cr><cr>

Map n <leader>jj    :FzfFiles <c-r>=FindFile('/resources/assets/js/')<cr><cr>
Map n <leader>jc    :FzfFiles <c-r>=FindFile('/resources/assets/js/Components/')<cr><cr>
Map n <leader>jp    :FzfFiles <c-r>=FindFile('/resources/assets/js/Pages/')<cr><cr>
Map n <leader>jP    :FzfFiles <c-r>=FindFile('/resources/assets/js/Plugins/')<cr><cr>
Map n <leader>ju    :FzfFiles <c-r>=FindFile('/resources/assets/js/Utils/')<cr><cr>
Map n <leader>jl    :FzfFiles <c-r>=FindFile('/resources/assets/js/Layouts/')<cr><cr>

Map n <leader>Jr    :tabe <c-r>=FindFile('/resources/assets/js/router.js')<cr><cr>
Map n <leader>Jn    :tabe <c-r>=FindFile('/resources/assets/js/components/navbar.vue')<cr><cr>
Map n <leader>Jj    :tabe <c-r>=FindFile('/resources/assets/js/')<cr><cr>
Map n <leader>Jv    :tabe <c-r>=FindFile('/resources/assets/js/views/')<cr><cr>
Map n <leader>Js    :tabe <c-r>=FindFile('/resources/assets/js/store/')<cr><cr>
Map n <leader>Jc    :tabe <c-r>=FindFile('/resources/assets/js/components/')<cr><cr>
Map n <leader>Jd    :tabe <c-r>=FindFile('/resources/assets/js/database/')<cr><cr>
Map n <leader>Jm    :tabe <c-r>=FindFile('/resources/assets/js/models/')<cr><cr>
Map n <leader>Ja    :tabe <c-r>=FindFile('/resources/assets/js/models/')<cr><cr>

Map n <leader>lw    :e <c-r>=FindFile('/routes/')<cr><cr>
Map n <leader>lu    :e <c-r>=FindFile('/public/')<cr><cr>
Map n <leader>lj    :FzfFiles <c-r>=FindFile('/public/js/')<cr><cr>
Map n <leader>lR    :FzfFiles <c-r>=FindFile('/resources/')<cr><cr>
Map n <leader>la    :FzfFiles <c-r>=FindFile('/app/', 'models')<cr><cr>
Map n <leader>ll    :tabe <c-r>=FindFile('/lan/', 'lang')<cr><cr>
Map n <leader>le    :FzfFiles <c-r>=FindFile('/app/events/', 'classes/event')<cr><cr>
Map n <leader>lc    :FzfFiles <c-r>=FindFile('/app/Http/Controllers', 'controllers')<cr><cr>
Map n <leader>lf    :FzfFiles <c-r>=FindFile('/database/factories/')<cr><cr>
Map n <leader>lh    :FzfFiles <c-r>=FindFile('/app/Helpers/')<cr><cr>
Map n <leader>lm    :FzfFiles <c-r>=FindFile('/database/migrations/', 'updates')<cr><cr>
Map n <leader>lo    :FzfFiles <c-r>=FindFile('/app/Observers/')<cr><cr>
Map n <leader>lp    :FzfFiles <c-r>=FindFile('/app/Providers/', '/')<cr><cr>
Map n <leader>lr    :FzfFiles <c-r>=FindFile('/app/Http/Requests/')<cr><cr>
Map n <leader>ls    :FzfFiles <c-r>=FindFile('/database/seeds/')<cr><cr>
Map n <leader>lT    :FzfFiles <c-r>=FindFile('/app/traits/')<cr><cr>
Map n <leader>lt    :FzfFiles <c-r>=FindFile('/tests/')<cr><cr>
Map n <leader>lv    :FzfFiles <c-r>=FindFile('/resources/views/')<cr><cr>
Map n <leader>lB    :FzfFiles <c-r>=FindFile('/resources/bread/')<cr><cr>
Map n <leader>lbb   :FzfFiles <c-r>=FindFile('/resources/bread/')<cr><cr>
Map n <leader>lbc   :e <c-r>=FindFile('/vendor/Kjdion84/laraback/src/Commands/BreadCommand.php')<cr><cr>
Map n <leader>lbs   :e <c-r>=FindFile('/vendor/Kjdion84/laraback/resources/bread/stubs/default/')<cr><cr>

Map n <leader>Lu    :tabe <c-r>=FindFile('/public/')<cr><cr>
Map n <leader>Lj    :tabe <c-r>=FindFile('/public/js/')<cr><cr>
Map n <leader>LR    :tabe <c-r>=FindFile('/resources/')<cr><cr>
Map n <leader>Lw    :tabe <c-r>=FindFile('/routes/')<cr><cr>
Map n <leader>La    :tabe <c-r>=FindFile('/app/', 'models')<cr><cr>
Map n <leader>Ll    :tabe <c-r>=FindFile('/lan/', 'lang')<cr><cr>
Map n <leader>Le    :tabe <c-r>=FindFile('/app/events/', 'classes/collection/event')<cr><cr>
Map n <leader>Lc    :tabe <c-r>=FindFile('/app/Http/Controllers', 'controllers')<cr><cr>
Map n <leader>Lf    :tabe <c-r>=FindFile('/database/factories/')<cr><cr>
Map n <leader>Lh    :tabe <c-r>=FindFile('/app/Helpers/')<cr><cr>
Map n <leader>Lm    :tabe <c-r>=FindFile('/database/migrations/', 'updates')<cr><cr>
Map n <leader>Lo    :tabe <c-r>=FindFile('/app/Observers/')<cr><cr>
Map n <leader>Lp    :tabe <c-r>=FindFile('/app/Providers/', '/plugins')<cr><cr>
Map n <leader>Lr    :tabe <c-r>=FindFile('/app/Http/Requests/')<cr><cr>
Map n <leader>Ls    :tabe <c-r>=FindFile('/database/seeds/')<cr><cr>
Map n <leader>LT    :tabe <c-r>=FindFile('/app/traits/')<cr><cr>
Map n <leader>Lt    :tabe <c-r>=FindFile('/tests/')<cr><cr>
Map n <leader>Lv    :tabe <c-r>=FindFile('/resources/views/')<cr><cr>
Map n <leader>LB    :tabe <c-r>=FindFile('/resources/bread/')<cr><cr>
Map n <leader>Lbb   :tabe <c-r>=FindFile('/resources/bread/')<cr><cr>
Map n <leader>Lbc   :tabe <c-r>=FindFile('/vendor/Kjdion84/laraback/src/Commands/BreadCommand.php')<cr><cr>
Map n <leader>Lbs   :tabe <c-r>=FindFile('/vendor/Kjdion84/laraback/resources/bread/stubs/default/')<cr><cr>
