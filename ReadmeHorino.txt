        Readme_Horino.txt
                                                �x��獎
                        Last Change:2015/05/27 20:59:44.

���̃t�@�C����vim�̐ݒ�t�@�C���̊i�[�ꏊ���L�^���Ă���B

	c:\Vim\vim74-kaoriya-win64  => $VIM
	c:\Vim\vim74-kaoriya-win64\vim74  => $VIMRUNTIME
	c:\Users\tora => $HOME

    �d�v�Ȓ��ӎ���  15/05/16
    1. �\�� $HOME\AppData\Local �̒��� <Vim> �Ƃ����f�B���N�g�����쐬
        ���Ă������ƁB
    2. �\�� $HOME\AppData\Local\Vim �̒��� <Vim_backup> �Ƃ���
        �f�B���N�g�����쐬���Ă������ƁB

- $VIM
	_gvimrc
		_gvimrc �ɂ���������֌W�̐ݒ��printrc.vim�Ɉڂ����B
	_vimrc
		_vimrc �ɂ�html�̒Z�k���͂���������Ă���B
	vimrc_local.vim     [2013/09/03 10:29]

- $VIM\vim74    [$VIMRUNTIME] 
	menu.vim            [2013/09/02 23:37]  �C������

- $VIM\vim74\lang   [$VIMRUNTIME\lang]
	menu_ja_jp.utf-8.vim            [2013/09/02  1:38]      �C������
	menu_japanese_japan.932.vim     [2013/09/04 10:26]      �C������

- $VIM\vim74\plugin [$VIMRUNTIME\plugin]
	commentout.vim      [2015/01/15  9:29]      �C������
	matchparen.vim      [2013/05/19  8:32]
	smartusline.vim     [2013/01/22 15:57]
	[html.vim]
	  ���̃t�@�C���� ;di ;dn ;dv �̃R�}���h��ǉ������B

- $VIM\vim74\macros [$VIMRUNTIME\macros]
	closetag.vim        [2015/05/24  6:23]
	    ���̃t�@�C����81,82�s�ڂ��ȉ��̂悤�ɏC�������B
		inoremap <C-]> <C-R>=GetCloseTag()<CR><ESC>F<i
		map <C-]> a<C-]><ESC>n
    matchit.vim         [2013/04/12  1:38]

- $VIM\vim74\syntax [$VIMRUNTIME\syntax]
	basic.vim           [2013/09/02 22:07]  �C������
	css.vim             [2013/07/29  8:30]  �C������
	pic.vim             [2011/04/12  9:17]  �C������

- $VIM\plugins\kaoriya\plugin
	blockdiff.vim       [2009/11/29 12:04]
	FavMenu.vim         [2012/06/15 10:14]  �C������
	mru.vim             [2012/06/15 10:10]
	printrc.vim	        [2013/09/03 11:20]  ����     
	savevers.vim        [2010/05/31 18:05]
	surround.vim        [2013/03/24  9:04]

- $HOME\vimflies
	snipMate �̃t�@�C���Q�̃f�B���N�g��
		after, autoload, doc, ftplugin, plugin, snippets, syntax
		
neocomplcache.vim�́@neocomplcache-7.2.zip ���_�E�����[�h���A�𓀂�����A
	plugin�f�B���N�g�����̃t�@�C����$VIM\vim74\plugin�@�f�B���N�g���@��
	autoload�f�B���N�g�����̃t�@�C����$VIM\vim74\autoload�@�f�B���N�g���@��
	���ꂼ��R�s�[����B

- c:\Windows\Fonts
	VL Gothic �W��, VL PGothic �W��

- CapsLock �� Ctrl(Left) �̓���ւ�
    ChgKey.exe���Ǘ��҂Ƃ��Ď��s����
    ����    capslock.reg, ctrl2cap.exe�͂��܂����삵�Ȃ��B

�e�t�@�C���̓ǂݍ��܂�鏇���� :scriptnames �ł킩��
	
 vim:set ts=4 sts=4 sw=4 tw=0 et ft=memo:
