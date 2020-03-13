# umask

```~/.profile``` で umask 022

# Reading/writing file from Windows Host

`file://wsl$` すると explorer から WSL 上のファイルが見える(新機能？？)

# VirtualBox や VMware Workstation Player が起動しなくなっちゃったときは (2020-03-01)

たぶん WSL2 にするとこれらが動かなくなる。

↓をやったら解決した(管理者で実行した PowerShell 内で実施)

```
dism.exe /online /disable-feature /featurename:VirtualMachinePlatform /norestart
dism.exe /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux /norestart
```

* 2行目は必要なかったかもしれない。Ubuntu 18 が起動しなくなって、WSL 自体の再有効化をした。Ubuntu のファイルシステムは残っていた。
