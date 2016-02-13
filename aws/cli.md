##aws ec2

- ami-383c1956: Amazon Linux AMI 2015.09.1 (HVM), SSD Volume Type

```
aws help

aws configure

aws ec2 help

aws ec2 describe-availability-zones
aws ec2 describe-availability-zones --region us-east-1
aws ec2 describe-availability-zones --region ap-northeast-1

aws ec2 describe-instances

aws ec2 run-instances help
aws ec2 run-instances --image-id ami-383c1956 --instance-type t2.nano --key キーの名前 --security-group-ids セキュリティグループのID
aws ec2 run-instances --image-id ami-383c1956 --instance-type t2.nano --key キーの名前 --security-group-ids セキュリティグループのID --user-data file://setup.sh
```


##aws s3

```
aws s3 ls
```

