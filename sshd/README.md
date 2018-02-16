# sshd

# root でログインしたい (Ubuntu 16)

`/etc/ssh/sshd_config` を編集、`PermitRootLogin yes` とする。

```
#PermitRootLogin prohibit-password
PermitRootLogin yes
```

編集したら `service sshd restart`
