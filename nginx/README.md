# Simple Reverse Proxy Setting

(Ubuntu 16 LTS, 2017-12-17)

```
server {

	listen 80;

    # domain name or ip address.
    server_name 192.168.187.134;

    location / {
        proxy_pass http://192.168.187.135;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-Host $host;
        proxy_set_header X-Forwarded-Server $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

    location /example2/ {
        proxy_pass http://another-site.com/example/;
    }
}
```


# proxy 192.168.56.101:443 to 127.0.0.1:3000, Nginx, Ubuntu 18 (2020-03-22)

ssl-cert が snakeoil.conf、および自己署名証明書を作成してくれる。

```
    ...

    listen 443 ssl default_server;
    listen [::]:443 ssl default_server;

    include snippets/snakeoil.conf;

    ...

    location / {
        proxy_bind 192.168.56.101;
        proxy_pass http://127.0.0.1:3000;
    }

    ...
```
