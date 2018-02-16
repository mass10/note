# Tsung

# Tsung on Debian 9

Debian 系は Erlang 関連のパッケージがスムーズに入るイメージがある。

```
# apt-get update
# apt-get install tsung
```

# What is Tsung

- load testing tool (for HTTP, WebDAV, SOAP, PostgreSQL, MySQL, AMQP, MQTT, LDAP and Jabber/XMPP servers.)
- 大量ユーザー(数千)による同時アクセスをシミュレート
- 様々なプロトコルのサポート(HTTP(SOAP), WebDAV, PostgreSQL)
- SSL サポート
- その他...

# HTTP related features

- HTTP/1.0 and HTTP/1.1 support
- GET, POST, PUT, DELETE, HEAD, OPTIONS and PATCH requests
- Cookies: Automatic cookies management (but you can also manually add more cookies)
- ‘GET If-modified since’ type of request
- WWW-authentication Basic and Digest. OAuth 1.0
- User Agent support
- Any HTTP Headers can be added
- Proxy mode to record sessions using a Web browser
- SOAP support using the HTTP mode (the SOAPAction HTTP header is handled).
- HTTP server or proxy server load testing.

# Starting Tsung

```
$ tsung -f settings.xml start
```



# Can't start!

```
Starting Tsung
Log directory is: /home/CURRENT_USER/.tsung/log/20171021-0645
Can't start ! {error,
                  {{badmatch,{error,enoent}},
                   [{ts_controller_sup,start_inets,1,
                        [{file,"src/tsung_controller/ts_controller_sup.erl"},
                         {line,105}]},
                    {ts_controller_sup,init,1,
                        [{file,"src/tsung_controller/ts_controller_sup.erl"},
                         {line,91}]},
                    {supervisor,init,1,[{file,"supervisor.erl"},{line,294}]},
                    {gen_server,init_it,6,
                        [{file,"gen_server.erl"},{line,328}]},
                    {proc_lib,init_p_do_apply,3,
                        [{file,"proc_lib.erl"},{line,247}]}]}}
```

do this.

```
$ sudo ln -s /usr/share /usr/lib/
$ sudo ln -s /usr/lib/x86_64-linux-gnu/tsung /usr/lib/
```

