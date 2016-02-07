#!/usr/bin/env bash
# coding: utf-8
#
#
# 文字列の長さを調べます。
#
#

function _show_length {

	s=$1
	len=${#s}
	echo \[$s\]\ 'の長さは'\ \($len\)\ 'です！'
}

function _main {

	_show_length
	_show_length ''
	_show_length `pwd`
	_show_length `id --user --name`
	_show_length 'おは'
	_show_length 'おは!'
	_show_length 'おは!!'
	_show_length 'howhowhow, nakano-ku, tokyo, Japan'
}

_main
