## gist の URL 

- https://gist.github.com/mass10/

# 2024-05-03 コミットに署名する？

* 結論
    * `git config` でデフォルト設定を変更する。

* 状況確認
    * github.dev 上でプッシュした変更 -> Verified
    * GitHub Desktop による commit -> None
    * git による commit -> None
    * Visual Studio Code による commit -> None

# 2024-05-04 コミットに署名するための準備

鍵の作成

```sh
gpg
```

鍵の確認

```sh
gpg --list-secret-keys --keyid-format=long
```

鍵を標準出力にエクスポートして、GitHub の画面から「SSH/GPG Keys」に貼り付ける。

```sh
gpg --armor --export "鍵ID"
```

ローカルコンピューターでグローバル設定を適用

```sh
git config --global gpg.program "C:\Program Files (x86)\GnuPG\bin\gpg.exe"
git config --global user.signingkey "鍵ID"
git config --global commit.gpgsign true
```
