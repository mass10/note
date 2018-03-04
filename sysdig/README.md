# sysdig

# Installation on Ubuntu 16.04.4 LTS (Xenial Xerus)

```
curl -s https://s3.amazonaws.com/download.draios.com/stable/install-sysdig | sudo bash
```
> * Detecting operating system
> * Installing Sysdig public key
> OK
> * Installing sysdig repository
> * Installing kernel headers
> * Installing sysdig
> 以前に未選択のパッケージ dkms を選択しています。
> (データベースを読み込んでいます ... 現在 134192 個のファイルとディレクトリがインストールされています。)
> .../dkms_2.2.0.3-2ubuntu11.5_all.deb を展開する準備をしています ...
> dkms (2.2.0.3-2ubuntu11.5) を展開しています...
> 以前に未選択のパッケージ sysdig を選択しています。
> .../sysdig_0.20.0_amd64.deb を展開する準備をしています ...
> sysdig (0.20.0) を展開しています...
> man-db (2.7.5-1) のトリガを処理しています ...
> dkms (2.2.0.3-2ubuntu11.5) を設定しています ...
> sysdig (0.20.0) を設定しています ...
> Loading new sysdig-0.20.0 DKMS files...
> First Installation: checking all kernels...
> Building only for 4.4.0-116-generic
> Building initial module for 4.4.0-116-generic
> Done.
> 
> sysdig-probe:
> Running module version sanity check.
>  - Original module
>    - No original module exists within this kernel
>  - Installation
>    - Installing to /lib/modules/4.4.0-116-generic/updates/dkms/
> 
> depmod.....
> 
> DKMS: install completed.
