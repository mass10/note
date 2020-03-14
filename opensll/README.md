# 自己署名証明書

```
openssl genrsa -aes128 -out ./XXXYYYZZZ.ga.key 2048
openssl rsa -in ./XXXYYYZZZ.ga.key -out ./XXXYYYZZZ.ga.key
openssl req -new -key ./XXXYYYZZZ.ga.key -sha256 -out ./XXXYYYZZZ.ga.csr
openssl x509 -in ./XXXYYYZZZ.ga.csr -days 3650 -req -signkey ./XXXYYYZZZ.ga.key -sha256 -out ./XXXYYYZZZ.ga.crt
```

