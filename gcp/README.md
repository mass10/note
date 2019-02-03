# セットアップ

```
gcloud init
```

# リージョン一覧を見る

```
gcloud compute regions list
```

# ゾーン一覧を見る

```
gcloud compute zones list
```

# OS のイメージ一覧を見る

```
gcloud compute images list
```

# Compute Engine のインスタンスを作成する

新しいインスタンスを作成する

```
gcloud compute instances create my-instance-name --machine-type f1-micro --image centos-6 --zone asia-east1-a
gcloud compute instances create my-instance-name --machine-type f1-micro --image centos-6 --zone asia-east1-a --network default
gcloud compute instances create my-instance-name --machine-type f1-micro --image centos-6 --zone asia-east1-a --network default --preemptible
```

初期化スクリプトを指定して新しいインスタンスを作成する

```
gcloud compute instances create my-instance-name --machine-type f1-micro --image centos-6 --zone asia-east1-a --network default --metadata-from-file startup-script=setup.sh
gcloud compute instances create my-instance-name --machine-type f1-micro --image centos-6 --zone asia-east1-a --network default --metadata-from-file startup-script=setup.sh --preemptible
```

# インスタンスを破棄する

```
gcloud compute instances delete my-instance-name
```

# インスタンスを停止する

```
gcloud compute instances stop my-instance-name
```

# インスタンス一覧

```
gcloud compute instances list
```

# Google Cloud SDK のコンポーネント一覧を見る

```
gcloud components list
```

# Google Cloud SDK のコンポーネントを更新する

※管理者として SDK Shell を実行する

```
gcloud components update
```
