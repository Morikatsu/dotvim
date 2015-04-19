" vim:set filetype=vim  ts=4 sts=4 sw=4 tw=0:
"-----------------------------------------------------------------------------
"	commentout.vim	Last Change:2015/01/15 09:29:06.
" derived from:
"	�������� vim �g��
"		http://nanasi.jp/articles/vim/commentout_source.html
"	�͂Ă�
"		d.Hatena.ne.jp/h1mesuke/20090304/p1	
"
"	��) copy���āA�R�����g�����邱�Ƃ��ł���
"		�x�� �獎		2013/04/24 
"	��) �g���q�𔻕ʂ��ăR�����g�̋L���������ł����B
"
" <s-f1> - encomment lhs wrapping
" ,c - decomment lhs
" ,d - decomment wrapping
" <s-f2> - encomment with copy
" <s-f3> - encomment block
"		block�ɑ΂��Ă�decomment�͂Ȃ�
"�@-----------------------------------------------------------------------------
"  autocmd�̃C�x���g
"		WinEnter : �ʂ̃E�B���h�E�ɓ�������AVim�̊J�n����A��ڂ̃E�B���h�E�ɓ������Ƃ��͔������Ȃ��B
"		BUfWinEnter : �o�b�t�@���E�B���h�E���ɕ\�����ꂽ��B�o�b�t�@���ǂݍ��܂ꂽ�Ƃ����A�B��(hidden)�o�b�t�@��
"			�E�C���h�E���ɕ\�����ꂽ���B�������A���łɃE�B���h�E���\������Ă���o�b�t�@���w�肵�āA":split"��
"			�����Ƃ��ɂ͂��̃C�x���g�͔������Ȃ��B
"================================================================================ 
"
" 1�x�X�N���v�g��ǂݍ��񂾂�A2�x�ڂ͓ǂݍ��܂Ȃ�
:if &cp || exists("loaded_commentout")
    :finish
:endif
:let loaded_commentout = 1

" ���[�U�̏����ݒ��ޔ�����
:let s:save_cpo = &cpo
:set cpo&vim
"================================================================================ 
" Encomment
"---------------------------------------
" lhs(left-hand-side�̗�) comments  {ohne Kopy}		[ <s-f1> ]
" �I��͈͂̍s�̐擪��comment char������B
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
" lhs comments���폜����R�}���h
vnoremap ,c :s/^\/\/\\|^--\\|^> \\|^[#"'%!;]//<CR>:nohlsearch<CR>"

"---------------------------------------
" wrapping comments		{ohne Kopy}	[ <s-f1> ]
" �I��͈͂Ɉ�s���A�s���A�s����comment char������B
" original�̂��̓�s�͓������A���̃u���O���瓱�������B

autocmd WinEnter *.c,*.css vnoremap <silent><s-f1> :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>				"/*..*/ c css
autocmd BufWinEnter *.c,*.css vnoremap <silent><s-f1> :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>				"/*..*/ c css
autocmd WinEnter *.html,*.xml,*.xhtml vnoremap <silent><s-f1> :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>	"<!--..--> html xml xhtml
autocmd BufWinEnter *.html,*.xml,*.xhtml vnoremap <silent><s-f1> :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>	"<!--..--> html xml xhtml
" wrapping comments���폜����R�}���h
vnoremap ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR> 
"---------------------------------------
"" block comments		[ <s-f3> ]
" �I��͈͂��u���b�N�ň͂�ŁAcomment mark������B
autocmd WinEnter *.c,*.css,*.java,*.js vnoremap <silent><s-f3> d:set paste<CR>0i/*<CR>*/<CR><ESC>kkp:set nopaste<CR>
autocmd BufWinEnter *.c,*.css,*.java,*.js vnoremap <silent><s-f3> d:set paste<CR>0i/*<CR>*/<CR><ESC>kkp:set nopaste<CR>
autocmd WinEnter *.html,*xml,*xhtml vnoremap <silent><s-f3> d:set paste<CR>0i<!--<CR>--><CR><ESC>kkp:set nopaste<CR>
autocmd BufWinEnter *.html,*xml,*xhtml vnoremap <silent><s-f3> d:set paste<CR>0i<!--<CR>--><CR><ESC>kkp:set nopaste<CR>
"	block comment�ɑ΂���폜�R�}���h�͕K�v�Ȃ��B 
"================================================================================ 
" Encomment with copy		[ <s-f2> ]
"	�ȉ���comment out �����������R�s�[���Ďc�� 
"	���̕����̍폜�R�}���h�͂Ȃ��B
"	�x�� �獎	2014/01/27 
"" lhs comments		copy �t���@x���W�X�^���g���Ă���
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
"" wrapping comments	copy �t���@x���W�X�^���g���Ă���
autocmd WinEnter *.css vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>	"/*..*/ css
autocmd BufWinEnter *.css vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>	"/*..*/ css
autocmd WinEnter *.html,*.xml,*xhtml vnoremap <silent><s-f2> "xy'<"xP:'<,'>s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>	"<!--..--> html xml xhtml
autocmd BufWinEnter *.html,*.xml,*xhtml vnoremap <silent><s-f2> "xy'<"XP:'<,'>s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>	"<!--..--> html xml xhtml

" block comment �� with_copy�͂Ȃ��B
"=========================================================================
"�@�������Ă������[�U�[�̐ݒ���C��
let &cpo = s:save_cpo
"================================================================================ 
