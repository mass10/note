## AWS いろいろメモ

#### Amazon Linux

- デフォルトユーザーは ec2-user

#### Ubuntu

- デフォルトユーザーは ubuntu

#### CentOS

- デフォルトユーザーは centos

## aws コマンド

#### 使用方法

```
aws help
```

#### コンフィギュレーション

```
aws configure
```





## aws ec2



#### 使用方法

```
aws ec2 help
```

#### AZ(=AVAILABILITY ZONE) を列挙する

```
aws ec2 describe-availability-zones
aws ec2 describe-availability-zones --region us-east-1
aws ec2 describe-availability-zones --region ap-northeast-1
```

#### インスタンスの状態を照会

```
aws ec2 describe-instances
```

#### 使用方法

```
aws ec2 run-instances help
```



#### Amazon Linux のインスタンスを作成する

- ami-383c1956: Amazon Linux AMI 2015.09.1 (HVM), SSD Volume Type

```
aws ec2 run-instances --image-id ami-383c1956 --instance-type t2.nano --key キーの名前 --security-group-ids セキュリティグループのID
aws ec2 run-instances --image-id ami-383c1956 --instance-type t2.nano --key キーの名前 --security-group-ids セキュリティグループのID --user-data file://setup.sh
```


#### Red Hat Enterprise Linux のインスタンスを作成する

- ami-0dd8f963: Red Hat Enterprise Linux 7.2 (HVM), SSD Volume Type

```
aws ec2 run-instances --image-id ami-0dd8f963 --instance-type t2.nano --key キーの名前 --security-group-ids セキュリティグループのID
aws ec2 run-instances --image-id ami-0dd8f963 --instance-type t2.nano --key キーの名前 --security-group-ids セキュリティグループのID --user-data file://setup.sh
```

#### インスタンスを reboot する

```
aws ec2 reboot-instances --instance-ids インスタンスID
```

#### 停止されているインスタンスを開始する

```
aws ec2 start-instances --instance-ids インスタンスID
```


#### インスタンスを削除する

```
aws ec2 terminate-instances --instance-ids インスタンスID
```


## aws s3

#### バケットの状況を表示する

```
aws s3 ls
```

#### ファイルを置く

```
aws s3 cp myfolder s3://mybucket/myfolder --recursive
```


#### ディレクトリ内容の同期

```
aws s3 sync myfolder s3://mybucket/myfolder
```

# 言語

```
# vi /etc/sysconfig/i18n
LANG=ja_JP.UTF-8

# reboot
```

# 時刻

```
# ln -s -f /usr/share/zoneinfo/Japan /etc/localtime
# reboot
```

