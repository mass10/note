# Elasticsearch + Kibana + Filebeat

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
