##環境

- CentOS 6.5

##インストール

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


##installing curator

- はじめに pip を入れておく。

```
# yum install openssl-devel
# pip install urllib3
# pip install elasticsearch-curator
```


