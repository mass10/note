##halt しない

halt はこうなります。

```
# systemctl poweroff
```

もしくは単純に

```
# poweroff
```

##サービスの一覧

```
# systemctl list-unit-files
# systemctl -t service
```

##サービスを on にする

```
# systemctl enable mariadb
```
