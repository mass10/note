#!/bin/bash
# coding: utf-8

function main() {

	echo '### begin ###' >> /tmp/setup.sh.log

	apt-get install wget --yes
	apt-get install zip --yes
	apt-get install unzip --yes
	apt-get install apt-transport-https --yes

	apt-get install python3-pip --yes
	apt-get install git --yes


	# wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -


	apt-get install apache2 --yes
	a2ensite default-ssl
	a2enmod ssl

	wget https://raw.githubusercontent.com/mass10/vim.note/master/vimrc/.vimrc --output-document /root/.vimrc
	wget https://raw.githubusercontent.com/jnurmine/Zenburn/master/colors/zenburn.vim --output-document /etc/vim/colors/zenburn.vim
	wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim --output-document /etc/vim/colors/molokai.vim

	# systemctl start apache2
	systemctl enable apache2

	echo >> ~/.bashrc
	echo >> ~/.bashrc
	echo >> ~/.bashrc
	echo >> ~/.bashrc
	echo >> ~/.bashrc
	echo \#\#\# `date +%Y-%m-%d\ %H:%M:%S` \#\#\# >> ~/.bashrc
	echo alias l=\'/bin/ls -lF --full-time --color\' >> ~/.bashrc
	echo alias n=\'/bin/ls -ltrF --full-time --color\' >> ~/.bashrc
	echo alias u=\'cd ..\' >> ~/.bashrc
	echo alias grep=\'/bin/grep --color\' >> ~/.bashrc
	echo >> ~/.bashrc

	echo 'Success!!' >> /tmp/setup.sh.log
}

main
