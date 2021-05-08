# npm on Amazon Linux (2017-11-16)

↓これだとめちゃくちゃ古いやつしか落ちてこない

```
# yum install epel-release
# yum install nodejs npm --enablerepo=epel
```

# start project (2017-11-23)

```
$ mkdir application_home
$ cd application_home
$ npm init
```

# カレントディレクトリ以下のパッケージ一覧を表示する (2016-12-31)

```
$ npm ls
```
