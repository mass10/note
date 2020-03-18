# httpd のモジュール置き場

```
# ls -lF /etc/httpd/modules/
```

# httpd がロードしているモジュールを知る

- CentOS

```
# httpd -t -D DUMP_MODULES
```

- Ubuntu

```
# apache2ctl -t -D DUMP_MODULES
```




# 自己署名証明書

```
# mkdir -p /etc/pki/tls/private/
# mkdir -p /etc/pki/tls/misc/
# mkdir -p /etc/pki/tls/certs/
# openssl genrsa -aes128 -out /etc/pki/tls/private/my.key 2048
# openssl rsa -in /etc/pki/tls/private/my.key -out /etc/pki/tls/private/my.key
# openssl req -new -key /etc/pki/tls/private/my.key -sha256 -out /etc/pki/tls/misc/my.csr
# openssl x509 -in /etc/pki/tls/misc/my.csr -days 3650 -req -signkey /etc/pki/tls/private/my.key -sha256 -out /etc/pki/tls/certs/my.crt
```


# mod_perl on Ubuntu 16

```
sudo apt-get install libapache2-mod-perl2
```

# mod_proxy

```
sudo apache2ctl configtest
sudo a2enmod proxy_http
sudo systemctl restart apache2
```

# Show service status

```
sudo systemctl -t service list-unit-files apache2.service
```

# 自動起動 On(Ubuntu 18)

```
sudo systemctl enable apache2
```

# 自動起動 Off(Ubuntu 18)

```
sudo systemctl disable apache2
```
