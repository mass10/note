@SETLOCAL
@ECHO OFF

ECHO ###############################################################
ECHO # �R�}���h�v�����v�g�̕ϐ�
ECHO ###############################################################

ECHO [TRACE] CURRENT DIRECTORY: [%~dp0]

ECHO [TRACE] COMMAND FILE NAME: [%0]

ECHO [TRACE] COMMAND ARGUMENT(1): [%1]

ECHO [TRACE] COMMAND ARGUMENT(2): [%2]

IF ""%1"" == """" (
	ECHO [INFO] ���Ȃ��Ƃ�1�ȏ�̃p�����[�^���K�v�ł��B
) ELSE (
	ECHO [INFO] Ok.
)

PAUSE
