# Docker はじめの一歩

### インストール(at Ubuntu)

```
# apt-get install docker.io
```

### 保管済みの Docker イメージを表示する

```
# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
<none>              <none>              5b12ef8fd570        10 months ago       0 B
```

### Docker イメージを探す

```
# docker search centos
```

Docker イメージを持ってくる

```
# docker pull centos
```

ローカルコンピューター上に保管されている Docker イメージを表示する

```
# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
centos              7                   7322fbe74aa5        7 weeks ago         178.2 MB
centos              latest              7322fbe74aa5        7 weeks ago         178.2 MB
centos              centos7             7322fbe74aa5        7 weeks ago         178.2 MB
<none>              <none>              5b12ef8fd570        10 months ago       0 B
```














# Docker コンテナに echo させる

```
# docker run centos echo "Hello World"
```

停止状態のコンテナを確認

```
# docker ps -a
```

削除

```
# docker rm {CONTAINER ID or NAME}
```

















# Docker コンテナで /bin/bash を開く

```
sudo docker run -it --name ubuntu-container01-console ubuntu /bin/bash
```









# Docker はじめの一歩(Nginx)

Nginx のイメージをダウンロードする。

```
# docker pull nginx
```

Nginx コンテナを起動する。

```
# docker run -d --name some-nginx -p 80:80 nginx
```

Nginx によってウェブページが公開されていることを確認する。

```
# curl http://127.0.0.1/
```

起動中のコンテナを確認する。

```
# docker ps -a
```

Nginx コンテナを停止する。

```
# docker stop {CONTAINER ID or NAME}
```

コンテナが停止されたことを確認する。

```
# docker ps -a
```

コンテナを削除する。

```
# docker rm {CONTAINER ID or NAME}
```

コンテナが削除されたことを確認する。

```
# docker ps -a
```

参考

- http://www.atmarkit.co.jp/ait/articles/1406/10/news031.html
















# Docker で Nginx #####################################

```
https://hub.docker.com/_/nginx/
```

イメージを取り寄せます。

```
# docker pull nginx
```

ダウンロードOk。

> Status: Downloaded newer image for docker.io/nginx:latest

上記サイトにあるように

```
# docker run --name some-nginx -v /some/content:/usr/share/nginx/html:ro -d nginx
```




# 実行中の Docker コンテナに入る

```
$ sudo docker exec -it {CONTAINER ID or NAME} /bin/bash
```


# Docker CE on Ubuntu 18.04 LTS (2018-10-08)

Docker に CE/EE ができた。以前とちょっと変わる。

古いものを消す

```
sudo apt-get remove docker docker-engine docker.io
```

インストール

```
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt-get install docker-ce
sudo docker run hello-world
```
