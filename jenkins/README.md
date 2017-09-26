# Install (Debian)

```
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo 'deb https://pkg.jenkins.io/debian-stable binary/' > /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install jenkins
```

# HTTPS のセットアップ(自己署名証明書)

keystore をセットアップする

```
# mkdir -p /var/lib/jenkins/keystore
# keytool -genkey -alias jenkins-ssl-cert -keyalg RSA -keystore /var/lib/jenkins/keystore/.keystore -validity 3650
# chown -R jenkins.jenkins /var/lib/jenkins/keystore
```

`/etc/default/jenkins` を書き換える

```
JENKINS_ARGS="--webroot=/var/cache/$NAME/war --httpPort=-1 --httpsPort=8080 --httpsKeyStore=/var/lib/jenkins/keystore/.keystore --httpsKeyStorePassword=jenkins"
```

再起動

```
# systemctl stop jenkins
# systemctl start jenkins
```

確認

```
# tailf /var/log/jenkins/jenkins.log
# netstat -ntlp
```

# Install (EC2)

Java 8

```
# yum install java-1.8.0-openjdk
# sudo alternatives --config java
# java -version
```

Jenkins をインストールする

```
# yum install https://pkg.jenkins.io/redhat-stable/jenkins-2.73.1-1.1.noarch.rpm
```

keystore をセットアップする

```
# mkdir -p /var/lib/jenkins/keystore
# keytool -genkey -alias jenkins-ssl-cert -keyalg RSA -keystore /var/lib/jenkins/keystore/.keystore -validity 3650
# chown -R jenkins.jenkins /var/lib/jenkins/keystore
```

* JENKINS_PORT を "-1" に
* JENKINS_HTTPS_PORT を "8080" に
* JENKINS_HTTPS_KEYSTORE を "/var/lib/jenkins/keystore/.keystore" に
* JENKINS_HTTPS_KEYSTORE_PASSWORD にパスワードを記述

```
# vim /etc/sysconfig/jenkins
```

起動

```
# service jenkins start 
```
