        Readme_Horino.txt
                                                堀野守克
                        Last Change:2015/05/27 20:59:44.

このファイルはvimの設定ファイルの格納場所を記録してある。

	c:\Vim\vim74-kaoriya-win64  => $VIM
	c:\Vim\vim74-kaoriya-win64\vim74  => $VIMRUNTIME
	c:\Users\tora => $HOME

    重要な注意事項  15/05/16
    1. 予め $HOME\AppData\Local の中に <Vim> というディレクトリを作成
        しておくこと。
    2. 予め $HOME\AppData\Local\Vim の中に <Vim_backup> という
        ディレクトリを作成しておくこと。

- $VIM
	_gvimrc
		_gvimrc にあった印刷関係の設定はprintrc.vimに移した。
	_vimrc
		_vimrc にはhtmlの短縮入力が多数入れてある。
	vimrc_local.vim     [2013/09/03 10:29]

- $VIM\vim74    [$VIMRUNTIME] 
	menu.vim            [2013/09/02 23:37]  修正あり

- $VIM\vim74\lang   [$VIMRUNTIME\lang]
	menu_ja_jp.utf-8.vim            [2013/09/02  1:38]      修正あり
	menu_japanese_japan.932.vim     [2013/09/04 10:26]      修正あり

- $VIM\vim74\plugin [$VIMRUNTIME\plugin]
	commentout.vim      [2015/01/15  9:29]      修正あり
	matchparen.vim      [2013/05/19  8:32]
	smartusline.vim     [2013/01/22 15:57]
	[html.vim]
	  このファイルは ;di ;dn ;dv のコマンドを追加した。

- $VIM\vim74\macros [$VIMRUNTIME\macros]
	closetag.vim        [2015/05/24  6:23]
	    このファイルの81,82行目を以下のように修正した。
		inoremap <C-]> <C-R>=GetCloseTag()<CR><ESC>F<i
		map <C-]> a<C-]><ESC>n
    matchit.vim         [2013/04/12  1:38]

- $VIM\vim74\syntax [$VIMRUNTIME\syntax]
	basic.vim           [2013/09/02 22:07]  修正あり
	css.vim             [2013/07/29  8:30]  修正あり
	pic.vim             [2011/04/12  9:17]  修正あり

- $VIM\plugins\kaoriya\plugin
	blockdiff.vim       [2009/11/29 12:04]
	FavMenu.vim         [2012/06/15 10:14]  修正あり
	mru.vim             [2012/06/15 10:10]
	printrc.vim	        [2013/09/03 11:20]  自作     
	savevers.vim        [2010/05/31 18:05]
	surround.vim        [2013/03/24  9:04]

- $HOME\vimflies
	snipMate のファイル群のディレクトリ
		after, autoload, doc, ftplugin, plugin, snippets, syntax
		
neocomplcache.vimは　neocomplcache-7.2.zip をダウンロードし、解凍した後、
	pluginディレクトリ内のファイルを$VIM\vim74\plugin　ディレクトリ　へ
	autoloadディレクトリ内のファイルを$VIM\vim74\autoload　ディレクトリ　へ
	それぞれコピーする。

- c:\Windows\Fonts
	VL Gothic 標準, VL PGothic 標準

- CapsLock と Ctrl(Left) の入れ替え
    ChgKey.exeを管理者として実行する
    注意    capslock.reg, ctrl2cap.exeはうまく動作しない。

各ファイルの読み込まれる順序は :scriptnames でわかる
	
 vim:set ts=4 sts=4 sw=4 tw=0 et ft=memo:
