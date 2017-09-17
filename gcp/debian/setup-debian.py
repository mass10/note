#!/usr/bin/env python
# coding: utf-8
#
# GCE(=Google Compute Engine) の新しいインスタンスを作成します。
#

import subprocess
import uuid

def _main():

	new_name = uuid.uuid4()
	new_name = str(new_name)

	path_to_gcloud = 'gcloud'
	path_to_gcloud = 'C:\\Program Files (x86)\\Google\\Cloud SDK\\google-cloud-sdk\\bin\\gcloud.cmd'

	command = [
		path_to_gcloud, 'compute', 'instances', 'create', new_name,
		'--machine-type', 'f1-micro',
		'--image', 'debian-9-stretch-v20170829',
		'--image-project', 'debian-cloud',
		'--zone', 'asia-northeast1-a',
		'--network', 'default',
		'--tags', 'http-server,https-server',
		'--metadata-from-file', 'startup-script=setup.sh']

	stream = subprocess.Popen(
		command,
		shell = False,
		stderr = subprocess.STDOUT,
		stdout = subprocess.PIPE).stdout
	response = stream.read()
	stream.close()

	print(response)

_main()
