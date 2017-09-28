#!/usr/bin/env python
# coding: utf-8
#
# EC2(=Elastic Compute Cloud) の新しいインスタンスを作成します。
#

import subprocess

def _main():

	command = [
		'aws', 'ec2', 'run-instances',
		'--image-id', 'ami-4af5022c', # Amazon Linux AMI 2017.03.1 (HVM), SSD Volume Type
		'--instance-type', 't2.micro',
		'--key', 'my-ec2-key',
		'--security-group-ids', 'sg-9f3b5afa',
		'--user-data', 'file://setup.sh']

	stream = subprocess.Popen(
		command,
		shell = True,
		stderr = subprocess.STDOUT,
		stdout = subprocess.PIPE).stdout
	response = stream.read()
	stream.close()

	print response

_main()
