" vim:set filetype=vim  ts=4 sts=4 sw=4 tw=0:
"-----------------------------------------------------------------------------
"	commentout.vim	Last Change:2015/01/15 09:29:06.
" derived from:
"	名無しの vim 使い
"		http://nanasi.jp/articles/vim/commentout_source.html
"	はてな
"		d.Hatena.ne.jp/h1mesuke/20090304/p1	
"
"	注) copyして、コメントをつけることもできる
"		堀野 守克		2013/04/24 
"	注) 拡張子を判別してコメントの記号を自動でいれる。
"
" <s-f1> - encomment lhs wrapping
" ,c - decomment lhs
" ,d - decomment wrapping
" <s-f2> - encomment with copy
" <s-f3> - encomment block
"		blockに対してはdecommentはない
"　-----------------------------------------------------------------------------
"  autocmdのイベント
"		WinEnter : 別のウィンドウに入った後、Vimの開始直後、一つ目のウィンドウに入ったときは発生しない。
"		BUfWinEnter : バッファがウィンドウ内に表示された後。バッファが読み込まれたときか、隠れ(hidden)バッファが
"			ウインドウ内に表示された時。ただし、すでにウィンドウが表示されているバッファを指定して、":split"を
"			したときにはこのイベントは発生しない。
"================================================================================ 
"
" 1度スクリプトを読み込んだら、2度目は読み込まない
:if &cp || exists("loaded_commentout")
    :finish
:endif
:let loaded_commentout = 1

" ユーザの初期設定を退避する
:let s:save_cpo = &cpo
:set cpo&vim
"================================================================================ 
" Encomment
"---------------------------------------
" lhs(left-hand-sideの略) comments  {ohne Kopy}		[ <s-f1> ]
" 選択範囲の行の先頭にcomment charを入れる。
autocmd WinEnter *.sh,*.pl,*.py vnoremap <silent><s-f1> :s/^/#/<CR>:nohlsearch<CR>			"#	shell pl py(python)
autocmd BufWinEnter *.sh,*.pl,*.py vnoremap <silent><s-f1> :s/^/#/<CR>:nohlsearch<CR>			"#	shell pl py(python)
autocmd WinEnter *.cpp,*.java,*.js vnoremap <silent><s-f1> :s/^/\/\//<CR>:nohlsearch<CR>	"//	cpp java js
autocmd BufWinEnter *.cpp,*.java,*.js vnoremap <silent><s-f1> :s/^/\/\//<CR>:nohlsearch<CR>	"//	cpp java js
autocmd WinEnter *.mail vnoremap <silent><s-f1> :s/^/> /<CR>:nohlsearch<CR>					">	mail
autocmd BufWinEnter *.mail vnoremap <silent><s-f1> :s/^/> /<CR>:nohlsearch<CR>				">	mail
autocmd WinEnter *.vim vnoremap <silent><s-f1> :s/^/\"/<CR>:nohlsearch<CR>					""	vim 
autocmd BufWinEnter *.vim vnoremap <silent><s-f1> :s/^/\"/<CR>:nohlsearch<CR>				""	vim 
autocmd WinEnter *.bas vnoremap <silent><s-f1> :s/^/\'/<CR>:nohlsearch<CR>					"'	bas
autocmd BufWinEnter *.bas vnoremap <silent><s-f1> :s/^/\'/<CR>:nohlsearch<CR>				"'	bas
autocmd WinEnter *.latex vnoremap <silent><s-f1> :s/^/%/<CR>:nohlsearch<CR>					"%	latex prolog
autocmd BufWinEnter *.latex vnoremap <silent><s-f1> :s/^/%/<CR>:nohlsearch<CR>					"%	latex prolog
"autocmd WinEnter *.asm vnoremap <silent><s-f1> :s/^/!/<CR>:nohlsearch<CR>					"!	asm
"autocmd BufWinEnter *.asm vnoremap <silent><s-f1> :s/^/!/<CR>:nohlsearch<CR>					"!	asm
autocmd WinEnter *.asm,*.scm vnoremap <silent><s-f1> :s/^/;/<CR>:nohlsearch<CR>				";	pic_asm	scm(scheme)
autocmd BufWinEnter *.asm,*.scm vnoremap <silent><s-f1> :s/^/;/<CR>:nohlsearch<CR>			";	pic_asm	scm(scheme)
autocmd WinEnter *.sql vnoremap <silent><s-f1> :s/^/--/<CR>:nohlsearch<CR>					"-	sql
autocmd BufWinEnter *.sql vnoremap <silent><s-f1> :s/^/--/<CR>:nohlsearch<CR>				"-	sql
" lhs commentsを削除するコマンド
vnoremap ,c :s/^\/\/\\|^--\\|^> \\|^[#"'%!;]//<CR>:nohlsearch<CR>"

"---------------------------------------
" wrapping comments		{ohne Kopy}	[ <s-f1> ]
" 選択範囲に一行ずつ、行頭、行尾にcomment charを入れる。
" originalのこの二行は動かず、他のブログから導入した。

autocmd WinEnter *.c,*.css vnoremap <silent><s-f1> :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>				"/*..*/ c css
autocmd BufWinEnter *.c,*.css vnoremap <silent><s-f1> :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>				"/*..*/ c css
autocmd WinEnter *.html,*.xml,*.xhtml vnoremap <silent><s-f1> :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>	"<!--..--> html xml xhtml
autocmd BufWinEnter *.html,*.xml,*.xhtml vnoremap <silent><s-f1> :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>	"<!--..--> html xml xhtml
" wrapping commentsを削除するコマンド
vnoremap ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR> 
"---------------------------------------
"" block comments		[ <s-f3> ]
" 選択範囲をブロックで囲んで、comment markを入れる。
autocmd WinEnter *.c,*.css,*.java,*.js vnoremap <silent><s-f3> d:set paste<CR>0i/*<CR>*/<CR><ESC>kkp:set nopaste<CR>
autocmd BufWinEnter *.c,*.css,*.java,*.js vnoremap <silent><s-f3> d:set paste<CR>0i/*<CR>*/<CR><ESC>kkp:set nopaste<CR>
autocmd WinEnter *.html,*xml,*xhtml vnoremap <silent><s-f3> d:set paste<CR>0i<!--<CR>--><CR><ESC>kkp:set nopaste<CR>
autocmd BufWinEnter *.html,*xml,*xhtml vnoremap <silent><s-f3> d:set paste<CR>0i<!--<CR>--><CR><ESC>kkp:set nopaste<CR>
"	block commentに対する削除コマンドは必要ない。 
"================================================================================ 
" Encomment with copy		[ <s-f2> ]
"	以下はcomment out した部分をコピーして残す 
"	この部分の削除コマンドはない。
"	堀野 守克	2014/01/27 
"" lhs comments		copy 付き　xレジスタを使っている
autocmd WinEnter *.sh,*.pl,*py vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^/#/<CR>:nohlsearch<CR>	"#	shell pl py
autocmd BUfWinEnter *.sh,*.pl,*py vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^/#/<CR>:nohlsearch<CR>	"#	shell pl py
autocmd WinEnter *.mail vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^/>/<CR>:nohlsearch<CR>		">	mail
autocmd BufWinEnter *.mail vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^/>/<CR>:nohlsearch<CR>		">	mail
autocmd WinEnter *.latex vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^/%/<CR>:nohlsearch<CR>		"%	latex prolog
autocmd BufWinEnter *.latex vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^/%/<CR>:nohlsearch<CR>		"%	latex prolog
"autocmd WinEnter *.asm vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^/!/<CR>:nohlsearch<CR>		"!	asm
"autocmd Bufwinenter *.asm vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^/!/<CR>:nohlsearch<CR>		"!	asm
autocmd WinEnter *.asm,*.scm vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^/;/<CR>:nohlsearch<CR>		";	pic_asm scm(scheme)
autocmd BufWinEnter *.asm,*.scm vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^/;/<CR>:nohlsearch<CR>	";	pic_asm scm(scheme)
autocmd WinEnter *.sql vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^/-/<CR>:nohlsearch<CR>		"-	sql
autocmd BufWinEnter *.sql vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^/-/<CR>:nohlsearch<CR>		"-	sql
 
autocmd WinEnter *.c,*.cpp,*.java,*.js vnoremap <silent><s-f2>  "xy'<"xP:'<,'>s/^/\/\//<CR>:nohlsearch<CR>		"//	c cpp java js
autocmd BufWinEnter *.c,*.cpp,*.java,*.js vnoremap <silent><s-f2>  "xy'<"xP:'<,'>s/^/\/\//<CR>:nohlsearch<CR>		"//	c cpp java js
autocmd WinEnter *.vim vnoremap <silent><s-f2>  "xy'<"xP:'<,'>s/^/"/<CR>:nohlsearch<CR>						"" vim bas
autocmd BufWinEnter *.vim vnoremap <silent><s-f2>  "xy'<"xP:'<,'>s/^/"/<CR>:nohlsearch<CR>					""	vim bas
autocmd WinEnter *.bas vnoremap <silent><s-f2>  "xy'<"xP:'<,'>s/^/'/<CR>:nohlsearch<CR>						"'	vim bas
autocmd BufWinEnter *.bas vnoremap <silent><s-f2>  "xy'<"xP:'<,'>s/^/'/<CR>:nohlsearch<CR>					"'	vim bas
"---------------------------------------
"" wrapping comments	copy 付き　xレジスタを使っている
autocmd WinEnter *.css vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>	"/*..*/ css
autocmd BufWinEnter *.css vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>	"/*..*/ css
autocmd WinEnter *.html,*.xml,*xhtml vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>	"<!--..--> html xml xhtml
autocmd BufWinEnter *.html,*.xml,*xhtml vnoremap <silent><s-f2> "xy'<"XP:'<,'>s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>	"<!--..--> html xml xhtml

" block comment の with_copyはない。
"=========================================================================
"　逃がしていたユーザーの設定を修復
let &cpo = s:save_cpo
"================================================================================ 
