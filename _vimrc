" vim:set ts=4 sts=4 sw=4 tw=0: (この行に関しては:help modelineを参照)
" vim:set foldmethod=marker
"
" An example for a Japanese version vimrc file.
" 日本語版のデフォルト設定ファイル(vimrc) - Vim7用試作
"
" Last Change: 2013/10/24 16:06:15.  ----- 堀野守克 ----- 07/07/17 ---
" Maintainer:  MURAOKA Taro <koron@tka.att.ne.jp>
"
" 解説:"{{{
" このファイルにはVimの起動時に必ず設定される、編集時の挙動に関する設定が書
" かれています。GUIに関する設定はgvimrcに書かかれています。
"
" 個人用設定は_vimrcというファイルを作成しそこで行ないます。_vimrcは vrmrc
" の後に読込まれるため、vimrcに書かれた内容を上書きして設定することが出来ます。
" _vimrcは$HOMEまたは$VIMに置いておく必要があります。$HOMEは$VIMよりも
" 優先され、$HOMEでみつかった場合$VIMは読込まれません。
"  (堀野メモ) 2011/02/21
"  即ち、_vimrcが$HOMEにはなく、$VIMだけに_vimrcがあれば、どのユー
"  ザーも同じ設定で使える。 2011/02/21
"   vimrc => $VIM
"   _vimrc => $VIM
"
" 注) vimrcには各設定ファイルの読み込み制御だけを残し、具体的なvimの動作の設定
"     は_vimrcにて行うこととした。	  Vista
"
" _vimrc(このファイル)にあった印刷用設定は $VIM/vim73/plugin/printrc.vim にて
" 行うこととした。  2013/05/29 
"
" 管理者向けに本設定ファイルを直接書き換えずに済ませることを目的として、サイ
" トローカルな設定を別ファイルで行なえるように配慮してあります。Vim起動時に
" サイトローカルな設定ファイル($VIM/vimrc_local.vim)が存在するならば、本設定
" ファイルの主要部分が読み込まれる前に自動的に読み込みます。
"  (堀野メモ) 2011/02/21
"   vimrcにて、vim_local.vimを読み込み、g:no_vimrc_example=1としているので、
"   この_vimrcにてvimrc_example.vimを読み込むことになる。
"
" 読み込み後、変数g:vimrc_local_finishが非0の値に設定されていた場合には本設
" 定ファイルに書かれた内容は一切実行されません。デフォルト動作を全て差し替え
" たい場合に利用して下さい。
"
" 参考:
"   :help vimrc
"   :echo $HOME
"   :echo $VIM
"   :version"}}}
"----------------------------------------
" Kaoriya対策
"----------------------------------------
"g:no_vimrc_exampleを利用してvimrc_example.vimを無効化している時はここで読込
""""""""""""""""""""""""""""""
if exists('g:no_vimrc_example') && g:no_vimrc_example == 1
  silent! source $VIMRUNTIME/vimrc_example.vim
endif
"プラグインを有効にする
filetype plugin indent on
"=======================================================
" カレントディレクトリの設定
"-------------------------------------------------------
" ファイルのディレクトリを自動的にカレントディレクトリに変更します
"au BufEnter * execute ":lcd " . expand("%:p:h")
:let $WK="c:\\users\\tora\\documents\\libreoffice_basic\\basicmacro"
" この$WKはその時々の関心事により変更するとよい。
" :cd $WK でディレクトリを変更できる。
"=======================================================
" utf-8で読み込む	2013/08/14 
set encoding=utf-8
set fileencoding=utf-8
"	vim 7.4.16 では以下の3行を追加するとメニューが文字化けする
"				2013/09/03 
"	メニューが文字化けするので、以下の3行を加える
"source $VIMRUNTIME/delmenu.vim
"set langmenu=ja_jp.utf-8
"source $VIMRUNTIME/menu.vim
"===========================================================================
"バッファ切り替えの際に作業ディリクトリを変更する
set autochdir
set browsedir=current
"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set noignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
"   ---堀野守克--- 8=>4
set tabstop=4
set softtabstop=4
set shiftwidth=4
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
set smartindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=2
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
"対応する括弧の表示時間を2にする
set matchtime=2
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 日本語整形スクリプト(by. 西岡拓洋さん)用の設定
let format_allow_over_tw = 1	" ぶら下り可能幅
"
set undolevels=100
"
" エラーベルを鳴らさない
set noerrorbells
" ビジュアルベルを使う
set visualbell
"
"---------------------------------------------------------------------------
" key binding
" <F12>をカーソル位置に日付を入れる機能を割り付けた
map <F12> :r !date /t<CR>kJ
map! <F12> <Esc>:r !date /t<CR>kJ
"--- 入力モードのときに括弧を自動で閉じる ---
"imap ( ()<LEFT><ESC>i
"map { {}<LEFT><ESC>i
"--- 入力モードでもh,j,k,lの動作 -----------------------------
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
"--- 挿入モードで空行を入れる --------------------------------
imap <C-o> <Esc>o
imap <C-p> <Esc>p
imap <C-a> <Esc>:w<CR>a
imap <C-A> <Esc>A
"imap <C-j> <C-[>
map <C-u> <Esc>
"=== 短縮入力 ================================================
"   挿入モードで xxx (space)と打つとYYが挿入される
	"iab _ifc _?ifcnst
	"iab _foric _?forinccnst
	"iab _fordc _?fordeccnst
	"iab _wc _?whilecnst
	"iab _uc _?untilecnst
	"iab _cc _?casecnst
	"iab _ccc _?c_casecnst
	"---- 以下はhtml用の短縮入力 -------
	iab _1 <h1></h1><ESC>4hi
	iab _2 <h2></h2><ESC>4hi
	iab _3 <h3></h3><ESC>4hi
	iab _4 <h4></h4><ESC>4hi
	iab _5 <h5></h5><ESC>4hi
	iab _ah <a href="" alt=""><ESC>Ff3li
	iab _an <a name=""><ESC>F=2li
	iab _b <br />
	iab _d <div >
	iab _dc <div class=""><ESC>F=i
	iab _di <div id=""><ESC>F=li
	iab _dn <div name=""><ESC>F=li
	iab _im <img src="" alt=""><ESC>8hi
	iab _l <li>
	iab _p <p>
	iab _pc <p class=""><ESC>hi
	iab _pi <p id=""><ESC>hi
	iab _pindt <p class="indt"><ESC>hi
	iab _st <strong></strong><ESC>F>li
	iab _ta <table></table><ESC>F\/2hi
	iab _td <td></td><ESC>F<i
	iab _th <th></th><ESC>F<i
	iab _tr <tr><ESC>o</tr><ESC>O
	iab _u <ul><ESC>o<li></li><ESC>o</ul><ESC>kf>li
	iab __ &nbsp;
	iab _< &lt;
	iab _> &gt;
	iab _& &amp;
	iab _C <!--  --><ESC>F!3li
	iab _h <!--  --><ESC>F!3li
	iab _* /*  */<ESC>2hi

"========= EnhancedCommetify ===================================
let g:EnhCommentifyAlignRight = 'yes'
let g:EnhCommentifyPretty = 'yes'
"========= タグを閉じる closetag.vim の設定 ====================
let g:closetag_html_style=1
source $VIMRUNTIME/macros/closetag.vim
" closetag.vimの81,82行目を以下のように修正した。
"inoremap <C-]> <C-R>=GetCloseTag()<CR><ESC>F<i
"map <C-]> a<C-]><ESC>n
"-------- matchit.vim ------------------------------------------
source $VIMRUNTIME/macros/matchit.vim
let b:match_words = "<:>,<div.*>:</div>,<table.*>:</table>,<ul.*>:</ul>"
let b:match_ignorecase = 1    "大文字、小文字の区別をなくす。

"===============================================================
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
set nonumber
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set nowrap
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
"---------------------------------------------------------------------------
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
"---------------------------------------------------------------------------
" ステータスラインの表示  ---堀野守克---
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=(%c)%l/%L
"highlight StatusLine term=bold cterm=bold guifg=red ctermfg=yellow ctermbg=red
"---------------------------------------------------------------------------
" 保存時に行末の空白を除去する
"autocmd BufWritePre * :%s/\s\+$//ge
"===========================================================================
" 入力モード時、ステータスラインのカラーを変更
" 挿入モード時の色指定
" https://github.com/fuenor/vim-statusline/blob/master/insert-statusline.vim
if !exists('g:hi_insert')
  let g:hi_insert = 'highlight StatusLine guifg=White guibg=DarkCyan gui=none ctermfg=White ctermbg=DarkCyan cterm=none'
endif

if has('unix') && !has('gui_running')
	inoremap <silent> <ESC> <ESC>
	inoremap <silent> <C-[> <ESC>
endif

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
    autocmd InsertChange * call s:StatusLine('Enter')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
"===========================================================================
"ウィンドウの位置とサイズの保存	---堀野守克--- 11/03/21 ---
" save window position and window size {
let s:save_size = '$HOME/AppData/Local/Vim/_savesize.vim'
au GUIEnter * if filereadable(expand(s:save_size)) | execute 'source ' . s:save_size | endif
function! SaveSizes()
  let x0 = getwinposx()
  let y0 = getwinposy()
  let x1 = &columns
  let y1 = &lines
  execute 'redir! > ' . s:save_size
  echo 'if exists(":winpos") == 2'
  echo "\t:winpos" x0 y0
  echo "endif"
  echo "set columns=" . x1
  echo "set lines=" . y1
  redir END
endfunction
au VimLeave * if has("gui_running") | silent call SaveSizes() | endif
"}
"MRU Fileのデータの保存場所   --- 堀野 守克 --- 2011/03/21
let MRU_File=$HOME . '\AppData\Local\Vim\_vim_mru_files'
let MRU_Max_Entries= 10
"Fav_menuのデータの保存場所 --- 堀野 守克 --- 2011/03/21
let $FAVOURITES = $HOME . '\AppData\Local\Vim\_vimfavourites'
"===========================================================================
" ファイル操作に関する設定:
"
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup
set writebackup

" バックアップファイルを作成する (次行の先頭の " を削除すれば有効になる)
set backup
set backupext=.bak
"  バックアップがおかれる場所
"   set文の等号の両側にはスペースを入れない 入れるとエラーとなる 2012/06/27
set backupdir=$HOME\AppData\Local\Vim\Vim_backup
let &directory = &backupdir
"  オリジナルファイルを残す 10/03/21
"set patchmode=.org
"" 終了時などにバッファを保存する  ---- 堀野守克 --------
"set directory = d:\Vi\Vim_backup
"set directory = $HOME . '\AppData\Local\Vim\backup'
"
"" savevers.vimのための設定
set patchmode=.clean
"  全てのファイルのバックアップ
let savevers_types = "*"
"  バックアップファイルが置かれる場所はbackupdirと同じ
let savevers_dirs = &backupdir
let versdiff_no_resize=1
let savevers_max = 9
nmap <silent> <F5> :VersDiff -<cr>
nmap <silent> <F6> :VersDiff +<cr>
nmap <silent> <F8> :VersDiff -c<cr>

set autowrite
"===========================================================================
"	折り畳みの設定
:set foldmethod=marker
"===========================================================================
"------- neobundle.vim の設定 ---- 2013/09/04 ----------
set nocompatible
filetype off		"for vundle

if has("vim_starting")
	set runtimepath+=c:\Vim\MyPlugin\bundle\neobundle.vim
	"set rtp+=$HOME/_vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle'))
endif

" NeoBundle
let $GIT_PROTOCOL = 'git'
let $GITHUB_COM = $GIT_PROTOCOL.'://github.com/'

NeoBundle $GITHUB_COM.'Shougo/neobundle.vim'
NeoBundle $GITHUB_COM.'Shougo/neocomplcache.git'
NeoBundle $GITHUB_COM.'Shougo/unite.vim.git'
NeoBundle $GITHUB_COM.'tpope/vim-surround.git'
"NeoBundle $GITHUB_COM.'vim-scrips/savevers.vim'
"NeoBundle $GITHUB_COM.'vim-scrips/FavMenu.vim'
"NeoBundle 'Shougo/vimshell.git'
"NeoBundle 'Shougo/vimproc.git'

filetype plugin on
filetype indent on
"
"-------- neocomplcache.vim を使う -----------------------------
" neocomplcacheを起動時に有効化
let g:neocomplcache_enable_at_startup = 1
" dictionary
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'objc' : $HOME . '/.vim/dict/objc.dict'
\ }

" 辞書読み込み
noremap  d. :NeoComplCacheCachingDictionary
"
" 日本語をキャッシュしない
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1

"" 区切り(underbar)の補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
"
" シンタックスをキャッシュするときの最小文字長を3
let g:neocomplcache_min_syntax_length = 3

" snippetsファイルのディレクトリパス
let g:neocomplcache_snippets_dir = '~/vimfiles/snippets'
"let g:neocomplcache_snippets_dir = '~/.vim/snippets'
"
" snippetsファイルのキーバインド（Tab)
imap <silent> <Tab> <Plug>(neocomplcache_snippets_expand)
smap <silent> <Tab> <Plug>(neocomplcache_snippets_expand)

"" Enable heavy omni completion. ruby用
"if !exists('g:neocomplcache_omni_patterns')
"    let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"
" tab補完
"function InsertTabWrapper()
"    if pumvisible()
"        return "\"
"    endif
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
"        return "\"
"    elseif exists('&omnifunc') && &omnifunc == ''
"        return "\"
"    else
"        return "\\"
"    endif
"endfunction
"inoremap =InsertTabWrapper()

" 補完候補が表示されている場合は確定。そうでない場合は改行
"inoremap pumvisible() ? neocomplcache#close_popup() : "\"

" 補完をキャンセル
"inoremap neocomplcache#close_popup()

" 閉じ括弧を自動補完
"inoremap ( ()i
"inoremap ) ClosePair(')')
"inoremap { {}i
"inoremap } ClosePair('}')
"inoremap [ []i
"inoremap ] ClosePair(']')

" pair close checker.
" from othree vimrc ( http://github.com/othree/rc/blob/master/osx/.vimrc )
"function ClosePair(char)
"    if getline('.')[col('.') - 1] == a:char
"        return "\"
"    else
"        return a:char
"    endif
"endf
"=== 以下は印刷設定 ==================================================="{{{
"----- 行番号付きで印刷 -----------------------------------------------
"if &number                     " numberの設定に会わせる
"    set printoptions+=number:y
"else
"    set printoptions+=number:n
"endif
"------ 改ページ文字で、改ページする ---------------------------------
"set printoptions+=formfeed:y	"改ページ文字で、改ページする
"set printoptions +=fromfeed:n	"                         しない
"----- 用紙の向き -----------------------------------------------------
"set printoptions+=portrait:y
"----- 印刷の方法 -----------------------------------------------------
"set printoptions+=duplex:off	"片面印刷
"set printoptions+=duplex:long	"両面印刷　綴じ方向縦　長い辺で綴じる
"set printoptions+=duplex:short	"片面印刷　綴じ方向横　短い辺で綴じる
"----- Syntaxハイライト -----------------------------------------------
"set printoptions+=syntax:y    " Syntaxハイライト有効で印刷
"set printoptions+=syntax:n    " Syntaxハイライト無効で印刷
"set printoptions+=syntax:a     " カラー印刷可能ならSyntaxハイライト有効
"----- 用紙サイズ -----------------------------------------------------
"set printoptions+=paper:A4
"set printoptions+=paper:B5
" ------ 印刷用フォント ----- 堀野守克 --- font gothic 9pt -----------
"if has('printer')
"  if has('win32')
"	set printfont=VL_Gothic_Regular:h8:cSHIFTJIS
	"set printfont=VL_Gothic_Regular:h9:cSHIFTJIS
    "set printfont=MS_Mincho:h10:cSHIFTJIS
    "set printfont=MS_Gothic:h9:cSHIFTJIS
"  endif
"endif
"----- 印刷ヘッダーの設定  ---堀野守克--- 08/05/11 --------------------
"function! Pages()	"---- 堀野守克 ---- 2012/07/09 

"	let	linespage = 61	"A4 font 9pt
"	let	linespage = 68	"A4 font 8pt
	"let linespage = 62	"B5 font 8pt

	"let	totalline = line('$')
	"let	nr1 = totalline / linespage
"	let nr2 = totalline % (linespage)	" %は剰余演算
	"if nr2 != 0
	"	let nr1 = nr1+1
	"endif
"	return nr1
"endfunction
"------- 最終更新日時の書式 --------------------------------------------
"let autodate_format='%Y/%m/%d %H:%M:%S'
"------- 印刷ヘッダ ----------------------------------------------------
"set printheader=%t\ \ Update\ %{strftime(\"\%c\",getftime(expand(\"\%\%\")))}\ %=\ Page\ %N\ /\ %{line('$')/linespage}
"set printheader=%t\ \ Update\ %{strftime(\"\%c\",getftime(expand(\"\%\%\")))}\ %=\ Page\ %N\ /\ %{Pages()} 
"----------------------------------------------------------------------"}}}
finish
"======================================================================
" Copyright (C) 2007 KaoriYa/MURAOKA Taro
