function! GetXPTItems()
	let ft = ""
	if exists( 'b:XPTfiletypeDetect' )
		let ft= b:XPTfiletypeDetect()
	elseif &filetype == ''
		let ft = 'unknown'
	else
		let ft= &filetype
	endif

	let x = b:xptemplateData
	call xpt#parser#loadSpecialFiletype(ft)
	let ftScope = get(x.filetypes,ft,{})
	let snipDict = ftScope.allTemplates

	let cmpl=[]
	let cmpl2 = []
	for [key,snipObj] in items(snipDict)
		let hint = get( snipObj.setting, 'hint', "" )
		if hint == ''
			let hint = matchstr(snipObj.snipText, '\V\s\*\zs\[^\n]\*')
		endif
		if key =~# '\V\^\[A-Z]'
			call add( cmpl2, {"label" : key, "hint" : hint } )
		else
			call add( cmpl, {"label" : key, "hint" : hint } )
		endif
	endfor

	call sort(cmpl)
	call sort(cmpl2)
	let cmpl = cmpl + cmpl2
	return cmpl

	" echo cmpl
endfunction

" lua << EOF
" local dict = vim.fn.GetXPTItems()
" for k, v in ipairs(dict) do
" 	dump(v.label)
" end
" EOF
