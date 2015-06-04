 vim:set ts=4 sts=4 sw=4 tw=0 et ft=memo:

        Readme_Horino.txt
                                                堀野守克
                        Last Change:2015/06/04 14:42:05.

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
        ウィンドウの垂直分割を追加してある
- $VIM\vim74\lang   [$VIMRUNTIME\lang]
	menu_ja_jp.utf-8.vim            [2013/09/02  1:38]      修正あり
        menu.vimの修正に合わせてある。
	menu_japanese_japan.932.vim     [2013/09/04 10:26]      修正あり
        menu.vimの修正に合わせてある。

- $VIM\vim74\plugin [$VIMRUNTIME\plugin]
	commentout.vim      [2015/01/15  9:29]      修正あり
       ファイルタイプ(拡張子)に合わせて、コメントアウトが行える。 
	matchparen.vim      [2013/05/19  8:32]
        対応する(),{},[]の色を変える
        これは標準で入っているかも知れない。
	smartusline.vim     [2013/01/22 15:57]
        選択したウィンドウに表示されるファイル名などをカラーで
        表示する。
	[html.vim]
	  このファイルは ;di ;dn ;dv のコマンドを追加した。
    myMenu.vim          [2015/06/02 15:27]
        自作　menu.vimへ追加する部分

- $VIM\vim74\macros [$VIMRUNTIME\macros]
	closetag.vim        [2015/05/26 18:22]
        htmlで<xx> に対応する</xx>を入れる。

	    このファイルの81,82行目を以下のように修正した。
		inoremap <C-]> <C-R>=GetCloseTag()<CR><ESC>F<i
		map <C-]> a<C-]><ESC>n
    matchit.vim         [2013/04/12  1:38]
        対応する <, >  {, }  [, ]  あるいはhtmlのタグに飛ぶ

- $VIM\vim74\syntax [$VIMRUNTIME\syntax]
	basic.vim           [2013/09/02 22:07]  修正あり
	css.vim             [2013/07/29  8:30]  修正あり
	pic.vim             [2011/04/12  9:17]  修正あり
        大幅に追加してある。

- $VIM\plugins\kaoriya\plugin
    autodate.vim        [2012/08/19  9:50]
        Last Change 　を生かすためのもの
        香り屋さん作
	blockdiff.vim       [2009/11/29 12:04]
        block領域の比較を行う   「名無し」に解説あり
	FavMenu.vim         [2012/06/15 10:14]  修正あり
        vimへお気に入りを登録する
	mru.vim             [2012/06/15 10:10]
        最近使用したファイルを登録する。
	printrc.vim	        [2015/05/26 18:17]  自作     
        自作の印刷用のプラグイン
	savevers.vim        [2010/05/31 18:05]
        この機能は忘れた。
	surround.vim        [2013/03/24  9:04]
        " あるいは ' で囲む　htmlのタグにも使える

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
