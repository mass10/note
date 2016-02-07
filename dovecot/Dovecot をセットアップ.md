##環境

- CentOS 6.5
- postfix-2.6.6-6.el6_5.x86_64
- dovecot-2.0.9-7.el6_5.1.x86_64


##インストール

```
# yum install dovecot
```

##社内ネットワークなど、閉鎖された安全な環境向けの設定

※OS アカウントでログインできるように最小の設定をする場合

```
# vi /etc/dovecot/conf.d/10-mail.conf
```

追記

```
mail_location = maildir:~/Maildir
```

##準備

```
# service iptables start
# iptables --insert INPUT 位置 --protocol tcp --destination-port 110 --jump ACCEPT #POP3
# iptables --insert INPUT 位置 --protocol tcp --destination-port 143 --jump ACCEPT #IMAP4
# iptables --insert INPUT 位置 --protocol tcp --destination-port 993 --jump ACCEPT #IMAP4S
# iptables --insert INPUT 位置 --protocol tcp --destination-port 995 --jump ACCEPT #POP3S
# service iptables save
```

##起動

```
# service dovecot start
```

