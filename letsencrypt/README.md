# Let's Encrypt

# Case of Apache HTTP Server + Amazon Linux
 
##### ドメインをっておく

- freenom.com

##### ssl を有効にしておく

- `/etc/httpd/conf.d/ssl.conf` があること

##### certbot

https://certbot.eff.org/ から [Apache], [CentOS 6] を選択して、説明を読む。

```
# wget https://dl.eff.org/certbot-auto
# chmod a+x certbot-auto
# ./certbot-auto --apache --debug
```

- ドメイン名を入力
- HTTP を HTTPS にリダイレクトするかどうかを訊かれるので `1` または `2`、ENTER。

##### 確認

https://www.ssllabs.com/ssltest/analyze.html?d=example.tld
