@SETLOCAL
@ECHO OFF

ECHO ###############################################################
ECHO # コマンドプロンプトの変数
ECHO ###############################################################

ECHO [TRACE] CURRENT DIRECTORY: [%~dp0]

ECHO [TRACE] COMMAND FILE NAME: [%0]

ECHO [TRACE] COMMAND ARGUMENT(1): [%1]

ECHO [TRACE] COMMAND ARGUMENT(2): [%2]

IF ""%1"" == """" (
	ECHO [INFO] 少なくとも1つ以上のパラメータが必要です。
) ELSE (
	ECHO [INFO] Ok.
)

PAUSE
