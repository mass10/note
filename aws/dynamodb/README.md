# Running DyanmoDB downloadable (on Ubuntu 18.04 LTS)

```
wget https://s3-ap-northeast-1.amazonaws.com/dynamodb-local-tokyo/dynamodb_local_latest.zip
unzip dynamodb_local_latest.zip
sudo apt install openjdk-8-jdk
java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb
```

# Installing aws-cli (on Ubuntu 18.04 LTS)

```
sudo apt install awscli
```

# Creating a table [WIP]

```
aws dynamodb create-table --table-name "sake-table" --attribute-definitions "AttributeName=name,AttributeType=String" --key-schema "AttributeName=name,KeyType=HASH" --provisioned-throughput
```

# Running DynamoDB locally in Docker container (on Ubuntu 18.04 LTS)

amazon official docker image.

https://hub.docker.com/r/amazon/dynamodb-local/

simply

```
sudo docker run -p 8000:8000 amazon/dynamodb-local
```

```
current-user@instance-1:~$ sudo netstat -ntlp
稼働中のインターネット接続 (サーバのみ)
Proto 受信-Q 送信-Q 内部アドレス            外部アドレス            状態       PID/Program name
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      682/systemd-resolve
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      1256/sshd
tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN      946/mysqld
tcp6       0      0 :::22                   :::*                    LISTEN      1256/sshd
tcp6       0      0 :::8000                 :::*                    LISTEN      2411/docker-proxy
```
