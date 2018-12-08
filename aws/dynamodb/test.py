#!/usr/bin/env python
# coding: utf-8

def _test_normal_table() {

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
}

function _create_secure_table() {

	# 暗号化されたテーブルを作成します。
	aws dynamodb create-table \
		--profile "local" \
		--table-name "sake_table_encrypted" \
		--attribute-definitions "AttributeName=name,AttributeType=S" \
		--key-schema "AttributeName=name,KeyType=HASH" \
		--provisioned-throughput "ReadCapacityUnits=1,WriteCapacityUnits=1" \
		--endpoint-url "http://localhost:8000" \
		--sse-specification "Enabled=true"
	# 削除
	aws dynamodb delete-table \
		--profile "local" \
		--table-name "sake_table_encrypted" \
		--endpoint-url "http://localhost:8000"
}

function main() {

}

main
