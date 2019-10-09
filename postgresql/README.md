# listen アドレスを変更する

```/etc/postgresql/10/main/postgresql.conf``` の ```listen_addresses``` を変更します。

# create database and user

```
psql
postgres=# create database testdb;
postgres=# create user user1 with password 'password';
postgres=# grant all on database testdb to user1;
```

# connect

```
psql -h 127.0.0.1 -U user1 -d testdb -W
```

