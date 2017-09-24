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
