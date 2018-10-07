# Running DyanmoDB downloadable

```
wget https://s3-ap-northeast-1.amazonaws.com/dynamodb-local-tokyo/dynamodb_local_latest.zip
unzip dynamodb_local_latest.zip
sudo apt install openjdk-8-jdk
java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb
```

# Installing aws-cli

```
sudo apt install awscli
```

# Creating a table [WIP]

```
aws dynamodb create-table --table-name "sake-table" --attribute-definitions "AttributeName=name,AttributeType=String" --key-schema "AttributeName=name,KeyType=HASH" --provisioned-throughput
```
