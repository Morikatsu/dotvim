" vim:set ts=4 sts=4 sw=4 tw=0: (���̍s�Ɋւ��Ă�:help modeline���Q��)
"	printrc.vim		�x�� �獎		Last Change:2013/09/06 09:56:11.
"		$VIM/vim73/plugin/printrc.vim
" ����Ɋւ���ݒ�:
"	_vimrc�ɂ���������֌W�̐ݒ�������Ɉڂ����B�I���W�i����vimrc�ɂ���
"	����֌W�̐ݒ�͍폜����K�v������B�폜�����Ă��Ȃ��ƁA���̃t�@�C����
"	�ݒ肪�����Ȃ��B
" ����:
"	�p���̑傫���A�t�H���g�T�C�Y��ς����ꍇ�́A���̃t�@�C����ύX����
"	�K�v������B
"
" �Q�l:
"   :hardcopy
"   :help 'printfont'
"   :help printing
"
"----- �s�ԍ��t���ň�� -----------------------------------------------
if &number                     " number�̐ݒ�ɉ�킹��
    set printoptions+=number:y
else
    set printoptions+=number:n
endif
"------ ���y�[�W�����ŁA���y�[�W���� ---------------------------------
set printoptions+=formfeed:y	"���y�[�W�����ŁA���y�[�W����
"set printoptions +=fromfeed:n	"                         ���Ȃ�
"----- �p���̌��� -----------------------------------------------------
set printoptions+=portrait:y	"�c
"set printoptions+=portrait:n	"��
"----- ����̕��@ -----------------------------------------------------
set printoptions+=duplex:off	"�Жʈ��
"set printoptions+=duplex:long	"���ʈ���@�Ԃ������c�@�����ӂŒԂ���
"set printoptions+=duplex:short	"�Жʈ���@�Ԃ��������@�Z���ӂŒԂ���
"----- Syntax�n�C���C�g -----------------------------------------------
"set printoptions+=syntax:y    " Syntax�n�C���C�g�L���ň��
set printoptions+=syntax:n    " Syntax�n�C���C�g�����ň��
"set printoptions+=syntax:a     " �J���[����\�Ȃ�Syntax�n�C���C�g�L��
"----- �p���T�C�Y -----------------------------------------------------
"set printoptions+=paper:A4
set printoptions+=paper:B5
" ------ ����p�t�H���g ----- �x��獎 --- font gothic 9pt -----------
if has('printer')
  if has('win32')
    set printfont=VL_Gothic_Regular:h8:cSHIFTJIS
	"set printfont=VL_Gothic_Regular:h9:cSHIFTJIS
    "set printfont=MS_Mincho:h10:cSHIFTJIS
    "set printfont=MS_Gothic:h9:cSHIFTJIS
  endif
endif
"----- ����w�b�_�[�̐ݒ�  ---�x��獎--- 08/05/11 --------------------
function! Pages()	"---- �x��獎 ---- 2012/07/09 

"	let	linespage = 61	"A4 font 9pt portrait:y
"	let	linespage = 68	"A4 font 8pt portrait:y
	let linespage = 62	"B5 font 8pt portrait:y
"	let linespage = 42	"B5 font 8pt portrait:n(������)
"
	let	totalline = line('$')
	let	nr1 = totalline / linespage
	let nr2 = totalline % (linespage)	" %�͏�]���Z
	if nr2 != 0
		let nr1 = nr1+1
	endif
	return nr1
endfunction
"------- �ŏI�X�V�����̏��� --------------------------------------------
let autodate_format='%Y/%m/%d %H:%M:%S'
"------- ����w�b�_ ----------------------------------------------------
set printheader=%t\ \ Update\ %{strftime(\"\%c\",getftime(expand(\"\%\%\")))}\ %=\ Page\ %N\ /\ %{Pages()} 
"----------------------------------------------------------------------
finish
"======================================================================
