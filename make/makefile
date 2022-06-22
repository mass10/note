.DEFAULT_GOAL = main2

main:
	@echo '[main]'
	@echo 'makefile is chosen.'

# このファイルはここから実行される
main2:
	@echo '[main2]'
	@echo 'makefile is chosen.'

	./raise.app 0
	./raise.app 0
	./raise.app -20
	./raise.app 1
	./raise.app 2

raise.app: raise.cpp
	gcc -o raise.app raise.cpp
