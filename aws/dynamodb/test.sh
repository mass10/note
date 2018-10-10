#!/bin/bash

function main() {

	# 単純なテーブルを作成します。
	aws dynamodb create-table \
		--profile "local" \
		--table-name "sake_table" \
		--attribute-definitions "AttributeName=name,AttributeType=S" \
		--key-schema "AttributeName=name,KeyType=HASH" \
		--provisioned-throughput "ReadCapacityUnits=1,WriteCapacityUnits=1" \
		--endpoint-url "http://localhost:8000"
	# 削除
	aws dynamodb delete-table \
		--profile "local" \
		--table-name "sake_table" \
		--endpoint-url "http://localhost:8000"

	# 暗号化されたテーブルを作成します。
	aws dynamodb create-table \
		--profile "local" \
		--table-name "sake_table" \
		--attribute-definitions "AttributeName=name,AttributeType=S" \
		--key-schema "AttributeName=name,KeyType=HASH" \
		--provisioned-throughput "ReadCapacityUnits=1,WriteCapacityUnits=1" \
		--endpoint-url "http://localhost:8000" \
		--sse-specification "Enabled=true"
	# 削除
	aws dynamodb delete-table \
		--profile "local" \
		--table-name "sake_table" \
		--endpoint-url "http://localhost:8000"

}

main
