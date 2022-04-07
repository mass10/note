# About
make いろいろメモ

# デフォルト(-f を指定しなかった場合)のファイル名について

　GNU make は下記の順にファイルを探す。

- GNUmakefile
- makefile
- Makefile

　ただし、(README などのように)意味のあるファイルとして先頭にリストされるように、先頭が大文字の“Makefile”の使用が推奨されている。

# 環境変数

```makefile
# プログラムの中で参照したい環境変数
export MY_MAKE_ENV1=xxxxxxxxxxxxxxxxxxxxxxxxx

default:
	cargo fmt
	cargo run
```



# デフォルトのターゲットについて

　.DEFAULT_GOAL という変数によってデフォルトのターゲットを指定できる。通常は先頭のターゲットがデフォルトのターゲットになる。

```makefile
.DEFAULT_GOAL = main2

main:
	@echo '[main]'
	@echo 'makefile is chosen.'

main2:
	# このファイルはここから実行される
	@echo '[main2]'
	@echo 'makefile is chosen.'
```


