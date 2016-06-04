#いろいろメモ

```
gcloud init
gcloud compute zones list

gcloud compute images list

gcloud compute instances create example-instance --machine-type f1-micro --image centos-6 --zone asia-east1-a
gcloud compute instances create example-instance --machine-type f1-micro --image centos-6 --zone asia-east1-a --network default
gcloud compute instances create example-instance --machine-type f1-micro --image centos-6 --zone asia-east1-a --network default --metadata-from-file startup-script=setup.sh

gcloud compute instances delete example-instance
```


##インスタンス一覧

```
gcloud compute instances list
```
