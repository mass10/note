#!/usr/bin/env python
# coding: utf-8
#
# GCE(=Google Compute Engine) の新しいインスタンスを作成します。
#

import subprocess
import uuid

def _main():

	new_name = uuid.uuid1()
	new_name = str(new_name)

	command = [
		'gcloud', 'compute', 'instances', 'create', new_name,
		'--machine-type', 'f1-micro',
		'--image', 'centos-6',
		'--zone', 'asia-east1-a',
		'--network', 'default',
		'--metadata-from-file', 'startup-script=setup.sh',
		'--preemptible']

	stream = subprocess.Popen(
		command,
		shell = True,
		stderr = subprocess.STDOUT,
		stdout = subprocess.PIPE).stdout
	response = stream.read()
	stream.close()

	print response

_main()
