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
