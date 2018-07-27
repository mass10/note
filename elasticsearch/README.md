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

# Elasticsearch + Kibana + Filebeat (2017-04-28)

## Java を削除

```
# yum remove java-1.7.0*
```

## Java 1.8 をインストール

```
# yum install java-1.8.0
```


## パッケージを持ってくる場合

```
# wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.3.1.rpm
# wget https://artifacts.elastic.co/downloads/kibana/kibana-5.3.1-x86_64.rpm
# wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.3.1-x86_64.rpm
```



## yum を使う場合

リポジトリ設定

```
# rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
```


```
# vim /etc/yum.repos.d/elasticsearch.repo
```

↓貼り付け

```
[elasticsearch-5.x]
name=Elasticsearch repository for 5.x packages
baseurl=https://artifacts.elastic.co/packages/5.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
```

インストール

```
# yum install elasticsearch
# yum install kibana
# yum install filebeat
```

Filebeat Modules を追加

```
# /usr/share/elasticsearch/bin/elasticsearch-plugin install ingest-user-agent
# /usr/share/elasticsearch/bin/elasticsearch-plugin install ingest-geoip
```
