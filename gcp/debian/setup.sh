#!/bin/bash
# coding: utf-8

apt-get install apache2 --yes
a2ensite default-ssl
a2enmod ssl
systemctl start apache2

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
