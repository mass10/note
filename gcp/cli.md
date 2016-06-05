#いろいろメモ








#####セットアップ

```
gcloud init
```








#####リージョン一覧を見る

```
gcloud compute regions list
```









#####ゾーン一覧を見る

```
gcloud compute zones list
```





#####OS のイメージ一覧を見る

```
gcloud compute images list
```






#####Compute Engine のインスタンスを作成する

新しいインスタンスを作成する

```
gcloud compute instances create new-instance-name --machine-type f1-micro --image centos-6 --zone asia-east1-a
gcloud compute instances create new-instance-name --machine-type f1-micro --image centos-6 --zone asia-east1-a --network default
gcloud compute instances create new-instance-name --machine-type f1-micro --image centos-6 --zone asia-east1-a --network default --preemptible
```

初期化スクリプトを指定して新しいインスタンスを作成する

```
gcloud compute instances create new-instance-name --machine-type f1-micro --image centos-6 --zone asia-east1-a --network default --metadata-from-file startup-script=setup.sh
gcloud compute instances create new-instance-name --machine-type f1-micro --image centos-6 --zone asia-east1-a --network default --metadata-from-file startup-script=setup.sh --preemptible
```








#####インスタンスを破棄する

```
gcloud compute instances delete example-instance
```















#####インスタンス一覧

```
gcloud compute instances list
```
