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
aws dynamodb create-table --table-name "sake_table" --attribute-definitions "AttributeName=name,AttributeType=S" --key-schema "AttributeName=name,KeyType=HASH" --provisioned-throughput "ReadCapacityUnits=1,WriteCapacityUnits=1" --endpoint-url http://localhost:8000 --region local 
```

```
aws dynamodb list-tables --endpoint-url 'http://localhost:8000' --region ''
aws dynamodb list-tables --endpoint-url 'http://localhost:8000' --region 'local'
aws dynamodb list-tables --endpoint-url 'http://localhost:8000'
aws dynamodb describe-table --table-name sake_table --endpoint-url http://localhost:8000
aws dynamodb describe-table --table-name sake_table --endpoint-url http://localhost:8000 --region 'local'
aws dynamodb delete-table --table-name sake_table --endpoint-url http://localhost:8000
```

# Running DynamoDB locally in Docker container (on Ubuntu 18.04 LTS)

amazon official docker image.

https://hub.docker.com/r/amazon/dynamodb-local/

run foreground.

```
sudo docker run -p 8000:8000 amazon/dynamodb-local
```

run background.

```
sudo docker run -d -p 8000:8000 amazon/dynamodb-local
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

# local viewer

local viewer (in browser)

`http://localhost:8000/shell/`

