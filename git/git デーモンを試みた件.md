# git コマンドでサービス起動？

これでも正しく listen してるっぽい... ただ、バックグラウンドにならない。

```
/usr/bin/git daemon --base-path=/var/lib/git --export-all --user-path=public_git --syslog --verbose --enable=receive-pack
```


# 定期的に「The remote end hung up unexpectedly」が出る件

zabbix で net.tcp.service.perf してた... git のコマンドがわかれば適切に quit できるんだけど...

```
Jun 30 18:21:55 gitsvr git-daemon[3945]: The remote end hung up unexpectedly
Jun 30 18:22:25 gitsvr git-daemon[4053]: Connection from 127.0.0.1:53183
Jun 30 18:22:25 gitsvr git-daemon[4053]: The remote end hung up unexpectedly
Jun 30 18:22:55 gitsvr git-daemon[4164]: Connection from 127.0.0.1:53195
Jun 30 18:22:55 gitsvr git-daemon[4164]: The remote end hung up unexpectedly
Jun 30 18:23:25 gitsvr git-daemon[4292]: Connection from 127.0.0.1:53202
Jun 30 18:23:25 gitsvr git-daemon[4292]: The remote end hung up unexpectedly
Jun 30 18:23:55 gitsvr git-daemon[4454]: Connection from 127.0.0.1:53214
Jun 30 18:23:55 gitsvr git-daemon[4454]: The remote end hung up unexpectedly
Jun 30 18:24:25 gitsvr git-daemon[4567]: Connection from 127.0.0.1:53219
Jun 30 18:24:25 gitsvr git-daemon[4567]: The remote end hung up unexpectedly
Jun 30 18:24:55 gitsvr git-daemon[4672]: Connection from 127.0.0.1:53232
Jun 30 18:24:55 gitsvr git-daemon[4672]: The remote end hung up unexpectedly
Jun 30 18:25:25 gitsvr git-daemon[4786]: Connection from 127.0.0.1:53244
Jun 30 18:25:25 gitsvr git-daemon[4786]: The remote end hung up unexpectedly
Jun 30 18:25:55 gitsvr git-daemon[4893]: Connection from 127.0.0.1:53250
Jun 30 18:25:55 gitsvr git-daemon[4893]: The remote end hung up unexpectedly
Jun 30 18:26:25 gitsvr git-daemon[5004]: Connection from 127.0.0.1:53262
Jun 30 18:26:25 gitsvr git-daemon[5004]: The remote end hung up unexpectedly
Jun 30 18:26:55 gitsvr git-daemon[5114]: Connection from 127.0.0.1:53267
Jun 30 18:26:55 gitsvr git-daemon[5114]: The remote end hung up unexpectedly
```

# エラー対処例(SELinux)

SELinux が障害になっている。無効(もしくは Permissive)にすることで解消した。

```
Jun 28 09:30:15 gsv xinetd[1089]: START: git pid=1740 from=::ffff:192.168.141.1
Jun 28 09:30:15 gsv git-daemon[1740]: Connection from 192.168.141.1:54812
Jun 28 09:30:15 gsv git-daemon[1740]: Extended attributes (22 bytes) exist <host=192.168.141.159>
Jun 28 09:30:15 gsv git-daemon[1740]: Request receive-pack for '/public/first.git'
Jun 28 09:30:15 gsv git-daemon[1740]: error: insufficient permission for adding an object to repository database ./objects
Jun 28 09:30:15 gsv git-daemon[1740]:
Jun 28 09:30:15 gsv git-daemon[1740]: fatal: failed to write object
Jun 28 09:30:15 gsv xinetd[1089]: EXIT: git status=0 pid=1740 duration=0(sec)
```

