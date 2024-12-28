# アクティブなタブがわかりにくい！

1. 「Open Settings (JSON)」を開きます。  

![image](https://user-images.githubusercontent.com/2055840/143372773-8cf31f16-55fb-43b1-a19b-0d9aec48682e.png)

2. 下記のような属性を追加します。

```JSON
{
    "workbench.colorCustomizations": {
        "tab.activeBackground": "#909090",
    },
}
```

![image](https://user-images.githubusercontent.com/2055840/143372920-819a8c6c-937e-4885-87f2-ad608c4936d1.png)

3. タブの色が変わります。

![image](https://user-images.githubusercontent.com/2055840/143373134-77edbac3-5fb9-445f-9411-36c286c9e606.png)

# カーソル行がわかりにくい！

同じく

```JSON
{
    "workbench.colorCustomizations": {
        "editor.lineHighlightBackground": "#404040"
    }
}
```

# explorer の indent が小さすぎ

* デフォルト

![image](https://github.com/user-attachments/assets/a4fb363d-d0e4-4b1f-9d07-5f973888bf15)

```json
{
    "workbench.tree.indent": 18
}
```

* インデント: 18

![image](https://github.com/user-attachments/assets/d79692dc-9ba9-4ecb-b19f-12a479d11a82)
