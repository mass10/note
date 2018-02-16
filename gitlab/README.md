# gitlab

# installing gitlab on Amazon Linux

xxxxxxxxxxxxxx

```
sudo yum install -y curl policycoreutils-python openssh-server cronie
sudo yum install postfix
sudo chkconfig postfix on
sudo service postfix start

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash
sudo EXTERNAL_URL="http://gitlab.example.com" yum -y install gitlab-ee
```

# on Ubuntu 16

```
sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates
sudo apt-get install -y postfix
```

```
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
sudo EXTERNAL_URL="http://gitlab.example.com" apt-get install gitlab-ee
```
