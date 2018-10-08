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

https://hub.docker.com/r/amazon/dynamodb-local/

simply

```
sudo docker run -p 8000:8000 amazon/dynamodb-local
```
