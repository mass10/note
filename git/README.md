# 空っぽの repository をローカルに clone した後、最初に push するとき

こんなメッセージが出るが

```
No refs in common and none specified; doing nothing.
Perhaps you should specify a branch such as 'master'.
Everything up-to-date
```

一発めは次のように push しなければならないようだ
```
git push -u origin master
```




# Windows から add したときに出る CRLF の警告

```
git config --global core.autoCRLF false
```

→ `%USERPROFILE%\.gitconfig` に設定が保管されてグローバルに効くっぽい

# Eclipse で commit するときのメールアドレスとユーザー名...

ローカルリポジトリ/.git/config を編集
```
[user]
name = name of user
email = local.part@domain.com
```

# ローカルの変更を無かったことにする

リモートの branch [master] に同期する
```
$ git fetch origin
$ git reset --hard origin/master
```

リモートの branch [my-snapshot] に同期する
```
$ git fetch origin
$ git reset --hard origin/my-snapshot
```

作成: 2014-07-10

# ローカルリポジトリのデフラグ
```
$ git fsck
$ git gc
```

作成: 2014-07-10

# 「ローカルの編集を取り消し」「最後に add した状態に戻したい」

```
git checkout ファイル名
```

# Git Client for Windows

* SourceTree
* Fork

# Git LFS のセットアップ

```bash
brew install git-lfs
```

そうすると git にサブコマンド lfs が追加されます。

最初に一度 install します。

```bash
git lfs install
```

# 2025-03-03 git log の日本語部分がエスケープされてしまうのを回避したい

```sh
export LESSCHARSET=utf-8
```
