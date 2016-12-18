# Haskell いろいろメモ

## 環境

###### version

```
ghc --version
```








<br>
<br>
<br>
<br>
<br>


##対話環境 REPL(=Read Eval Print Loop)

######起動

```
ghci
```

######終了

```
:q
```









<br>
<br>
<br>
<br>
<br>

##簡単な式の評価

######数値

```
Prelude> 1
1
Prelude> 99999
99999
```

######加算

```
Prelude> 1 + 10
11
```

######乗算
```
Prelude> 5 * 5
25
```
######べき乗
```
Prelude> 1 ^ 10
1024
```
######文字
```
Prelude> 'c'
'c'
```
######文字列
```
Prelude> "hello real world"
"hello real world"
```

######関数
```
Prelude> let fun x = x ^ x
Prelude> fun 3
27
```


######関数リテラル(ラムダ式)
```
Prelude> (\x -> x ^ x) 3
27
```

######リスト
```
Prelude> [1, 2, 3, 4, 5]
[1,2,3,4,5]
```

######有限リスト
```
Prelude> [1..5]
[1,2,3,4,5]
Prelude> ['a' .. 'z']
"abcdefghijklmnopqrstuvwxyz"
```

###### 無限リスト
```
Prelude> [1..]
```

###### タプル
```
Prelude> (1, -100, 'a', "kkkkkkk")
(1,-100,'a',"kkkkkkk")
```

###### 関数
```
Prelude> let bi x = x * 2
Prelude> map bi [-5, 1, 50, 100]
```
###### リストのソート
```
Prelude> Data.List.sort [42, -1092, 13, 22]
[-1092,13,22,42]
Prelude> Data.List.sort "kJuyHsyTqSX"
"HJSTXkqsuyy"
```

<br>
<br>
<br>
<br>
<br>

##コンパイル

バイナリはかなり大きくなる...

```
$ cat hello.hs
#!/usr/bin/env runghc
-- coding: utf-8

main :: IO()
main = do
        putStr "Hello Real World!"
        putStrLn ""
```
```
$ ghc hello.hs
```
```
$ ls -lF
total 1068
-rwxrwxr-x 1 ubuntu ubuntu 1076964 Feb 21 07:55 hello*
-rw-rw-r-- 1 ubuntu ubuntu     526 Feb 21 07:55 hello.hi
-rwxrwxr-x 1 ubuntu ubuntu     105 Feb 21 04:56 hello.hs*
-rw-rw-r-- 1 ubuntu ubuntu    4472 Feb 21 07:55 hello.o
```
```
$ ./hello
Hello Real World!
```

<br>
<br>
<br>
<br>
<br>

##ポイント

- 純粋関数型言語
- 参照透過性: 関数に副作用が無いこと
- 型推論: 型をいちいち書かなくてもコンパイラが適切に推測してくれること


<br>
<br>
<br>
<br>
<br>









## Cabal(カバル)

###### Cabal でパッケージを検索する

```
# cabal list mongodb
```




###### Cabal でパッケージをインストールする

↓root のプライベートな空間にインストールする場合。こうして入れたパッケージは通常、他の os ユーザーからは見えない。

```
# cabal update
# cabal install relational-record
```




↓グローバルな空間にインストールする場合。こうして入れたパッケージは、全ての os ユーザーから見える。

```
# cabal install relational-record --global
```












<br>
<br>
<br>
<br>
<br>






##ghc-pkg


######パッケージの詳細を表示する。これはグローバルな空間のパッケージを見たい場合。

```
# ghc-pkg describe HDBC --global
```






##Haskell を書くときに見たいところ


###### School of Haskell
https://www.schoolofhaskell.com/

###### A Gentle Introduction to Haskell Version 98
https://www.haskell.org/tutorial/

###### Haskell by Example
https://lotz84.github.io/haskellbyexample/




<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

#Stack

##概要

- Cabal の依存性地獄を解決すべく開発されている。これからは Stack を使うのが主流ぽい。

##GETTING STARTED

#####at Ubuntu 16.04.1 LTS

- Ubuntu では標準パッケージに入ったっぽい。

```
$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 575159689BEFB442
$ echo 'deb http://download.fpcomplete.com/ubuntu xenial main'|sudo tee /etc/apt/sources.list.d/fpco.list
$ sudo apt-get update
$ sudo apt-get install stack -y
```

##プロジェクトをはじめる

```
$ stack new my-project
$ cd my-project
$ stack setup
$ stack build
```

##成果物を実行する

```
$ stack exec my-project-exe
```

##GHCi

```
$ stack ghci
```

##runghc

```
$ stack runghc app/Main.hs
```



