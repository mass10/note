#!/usr/bin/env ruby
# coding: utf-8

def _create_normal_table()

	# 単純なテーブルを作成します。
	command = ['aws', 'dynamodb', 'create-table',
		'--profile', 'local',
		'--table-name', 'sake_table',
		'--attribute-definitions', 'AttributeName=name,AttributeType=S',
		'--key-schema', 'AttributeName=name,KeyType=HASH',
		'--provisioned-throughput', 'ReadCapacityUnits=1,WriteCapacityUnits=1',
		'--endpoint-url', 'http://localhost:8000']
	system(*command)

	# 削除
	command = ['aws', 'dynamodb', 'delete-table',
		'--profile', 'local',
		'--table-name', 'sake_table',
		'--endpoint-url', 'http://localhost:8000']
	system(*command)

end

def _create_secure_table()

	# 暗号化されたテーブルを作成します。
	command = ['aws', 'dynamodb', 'create-table',
		'--profile', 'local',
		'--table-name', 'sake_table_encrypted',
		'--attribute-definitions', 'AttributeName=name,AttributeType=S',
		'--key-schema', 'AttributeName=name,KeyType=HASH',
		'--provisioned-throughput', 'ReadCapacityUnits=1,WriteCapacityUnits=1',
		'--endpoint-url', 'http://localhost:8000',
		'--sse-specification', 'Enabled=true']
	system(*command)

	# 削除
	command = ['aws', 'dynamodb', 'delete-table',
		'--profile', 'local',
		'--table-name', 'sake_table_encrypted',
		'--endpoint-url', 'http://localhost:8000']
	system(*command)

end

def _main()

	_create_normal_table()
	_create_secure_table()

end

_main()

