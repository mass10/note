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
