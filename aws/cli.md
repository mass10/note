##aws コマンドで EC2 インスタンスを列挙

```
aws ec2 describe-instances
```

##EC2 に新しいインスタンスを作成する

- AMI: [ami-383c1956] (Amazon Linux AMI 2015.09.1 (HVM), SSD Volume Type)
- インスタンスタイプ: [t2.nano]

```
aws ec2 run-instances --image-id ami-383c1956 --instance-type t2.nano --key キーの名前 --group セキュリティグループのID
```

##S3 の名前を列挙する

```
aws s3 ls
```
