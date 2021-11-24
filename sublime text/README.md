# Sublime Text を入れたらまずやること

#### Package Control

https://packagecontrol.io

#### ~IMESupport (Windows)~

~デフォルトでは日本語入力のカーソル位置がおかしいのでこれを解消するやつ。~

~`Ctrl` + `Shift` + `p` から `Install Package` を選択して `IMESupport` を検索。~

→ カーソル位置が修正されたので、このパッケージは不要になった。

#### ConvertToUTF8 

UTF-8 以外の日本語文字コードを扱えるようにするやつ。

`Ctrl` + `Shift` + `p` から `Install Package` を選択して `ConvertToUTF8` を検索。

#### highlight line が薄い

`Twilight.thTheme` の `lineHighlight` を変更する
![image](https://user-images.githubusercontent.com/2055840/143180776-2c554007-0c24-48a3-a0c9-828747744795.png)



#### フォント

```
"font_face": "Migu 1M"
```

#### カーソル行をわかりやすく

```
"highlight_line": true
```

#### スムーズなスクロールを廃止

```
"scroll_speed": 0
```

#### タイトルバーにドキュメントのフルパスを表示

```
"show_full_path": true
```

# キーボードショートカット

| | Windows | Mac OS |
|-|-|-|
| 前回の条件で再度検索する | F3 | ⌘ + G |
| カーソル位置のキーワードで検索する | Ctrl + F3 | ⌘ + ⌥ + G |
| 検索 | Ctrl + F | ⌘ + F |
| 置換 | Ctrl + H | ⌘ + ⌥ + F |
| カーソル位置の単語で複数選択開始 | Ctrl + D | ⌘ + D |
| タブを切り替える | Ctrl + PgUp/PgDn | ⌘ + ⌥ + ←/→ |

