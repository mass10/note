# インストール (CentOS 6.5)

```
# rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
```



```
# vi /etc/yum.repos.d/elasticsearch
```

↓追記

```
[elasticsearch-1.7]
name=Elasticsearch repository for 1.7.x packages
baseurl=http://packages.elastic.co/elasticsearch/1.7/centos
gpgcheck=1
gpgkey=http://packages.elastic.co/GPG-KEY-elasticsearch
enabled=1
```

インストール

```
# yum install elasticsearch
```

ここまでの手順では chkconfig に入らないので手動で追加↓

```
# chkconfig --add elasticsearch
```

```
# service elasticsearch start
```


# installing curator (CentOS 6.5)

- はじめに pip を入れておく。

```
# yum install openssl-devel
# pip install urllib3
# pip install elasticsearch-curator
```


# Install Elasticsearch on Ubuntu 16.04.4 LTS

```
sudo dpkg --install elasticsearch-6.2.2.deb
systemctl -t service list-unit-files
sudo systemctl enable elasticsearch
systemctl -t service list-unit-files
sudo reboot
```

# Python binding

```
sudo su - root
pip3 install elasticsearch
```
