# npm on Amazon Linux

↓これだとめちゃくちゃ古いやつしか落ちてこない

```
# yum install epel-release
# yum install nodejs npm --enablerepo=epel
```

# start project

```
$ mkdir application_home
$ cd application_home
$ npm init
```

# カレントディレクトリ以下のパッケージ一覧を表示する

```
$ npm ls
```

