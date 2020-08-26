# 負荷ツール

* /usr/sbin/smtp-sink
* /usr/sbin/smtp-source

↓のように実行すると100通くらい飛ぶ
```
$ /usr/sbin/smtp-source -s 10 -l 500 -m 100 -f aaa@example.jp -t bbb@example.jp 192.168.141.140
```
