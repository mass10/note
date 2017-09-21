#!/usr/bin/env perl
# coding: utf-8
#
# Perl でも初期化は可能
#


use strict;
use utf8;

sub _log {

	my $stream;
	open($stream, '/tmp/init.log');
	binmode($stream, ':utf8');
	print($stream @_, "\n");
	close($stream);
}

sub _main {

	binmode(STDIN, ':utf8');
	binmode(STDOUT, ':utf8');
	binmode(STDERR, ':utf8');

	_log('### start ###');

	system('apt-get', 'install', 'python3-pip', '--yes');
	system('apt-get', 'install', 'apache2', '--yes');
	system('a2ensite', 'default-ssl');
	system('a2enmod', 'ssl');
	system('systemctl', 'start', 'apache2');

	_log('--- end ---');
}

_main();
