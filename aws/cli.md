##aws コマンド

####使用方法

```
aws help
```

####コンフィギュレーション

```
aws configure
```





##aws ec2



####使用方法

```
aws ec2 help
```


```
aws ec2 describe-availability-zones
aws ec2 describe-availability-zones --region us-east-1
aws ec2 describe-availability-zones --region ap-northeast-1

aws ec2 describe-instances

aws ec2 run-instances help
```






##### Amazon Linux のインスタンスを作成する

- ami-383c1956: Amazon Linux AMI 2015.09.1 (HVM), SSD Volume Type

```
aws ec2 run-instances --image-id ami-383c1956 --instance-type t2.nano --key キーの名前 --security-group-ids セキュリティグループのID
aws ec2 run-instances --image-id ami-383c1956 --instance-type t2.nano --key キーの名前 --security-group-ids セキュリティグループのID --user-data file://setup.sh
```


####インスタンスを reboot する

```
aws ec2 reboot-instances --instance-ids インスタンスID
```

####停止されているインスタンスを開始する

```
aws ec2 start-instances --instance-ids インスタンスID
```


####インスタンスを削除する

```
aws ec2 terminate-instances --instance-ids インスタンスID
```


##aws s3

```
aws s3 ls
```

