# Azure CLI メモ

```
azure --version

azure help
azure help vm 
azure help vm create

azure login

azure vm image list


azure vm location list
> info:    Executing command vm location list
> + Getting locations
> data:    Name
> data:    ----------------
> data:    East US
> data:    West US
> data:    South Central US
> data:    Central US
> data:    North Central US
> data:    East US 2
> data:    North Europe
> data:    West Europe
> data:    Southeast Asia
> data:    East Asia
> data:    Japan West
> data:    Japan East
> data:    Brazil South
> info:    vm location list command OK


openssl req -x509 -nodes -newkey rsa:2048 -keyout AZURE.key -out AZURE.pem

azure vm create --ssh --vm-size ExtraSmall --ssh-cert "C:\Users\%USERNAME%\.ssh\AZURE.pem" --location "Japan East" --no-ssh-password my-azure-test "0b11de9248dd4d87b18621318e037d37__RightImage-CentOS-6.6-x64-v14.2.1" azure-user
```

# TROUBLE SHOOTING: A route named 'swagger_docs' is already in the route collection. Route names must be unique.

Problem when in deploying API.

Check 「Remove additional files at destination.」 before publish.

「発行先の追加ファイルを削除する。」を選択する。


