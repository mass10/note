# タイムスタンプ in bash prompt

```~/.bashrc``` を開いて↓のように編集すると...

```bash
PS1='$(date +%Y-%m-%d\ %H:%M:%S) ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
```

こんなプロンプトになります。

```
2019-08-26 00:00:57 me@instance-name :~$
```

# 2020-07-20 xargs したときに空白を含むファイル名を上手に処理する

```
find ./ -type f -name 'FILENAME with SAPCES.*' | xargs -d \\n /bin/ls -ldF --full-time
```

