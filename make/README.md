#make いろいろメモ

##デフォルトの名前について

　make が勝手に探すファイル名は

- makefile
- Makefile

##デフォルトのターゲットについて

　.DEFAULT_GOAL という変数によってデフォルトのターゲットを指定できる。通常は先頭のターゲットがデフォルトのターゲットになる。

```
.DEFAULT_GOAL = main2

main:
	@echo '[main]'
	@echo 'makefile is chosen.'

main2:
	# このファイルはここから実行される
	@echo '[main2]'
	@echo 'makefile is chosen.'
```
