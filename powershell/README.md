# トラブルシューティング ～ps1 ファイルを実行することができない～ (2016-02-07)

### はじめに

デフォルトでは .ps1 スクリプトを実行できないようにセットアップされている。

>.\Hello.ps1 : このシステムではスクリプトの実行が無効になっているため、ファイル
> C:\Users\mar3\workspace\powershell.note.git\code.examples\hello\Hello.ps1 を読み込むことができません。詳細について
> は、「about_Execution_Policies」(...

現在のポリシーを確認する。

```PowerShell
Get-ExecutionPolicy
```

> Restricted

となってるのがデフォルト。PowerShell のスクリプトファイル実行は許可されていない。

### ps1 スクリプトを実行できるようにポリシーを変更する

とりいそぎ実行するためには下記のように入力。(※これは「管理者として実行」していなければ受理されないことに注意！)

```PowerShell
Set-ExecutionPolicy RemoteSigned
```

質問されるので Y。(意味=外部から入手したスクリプトは署名されていなければ実行できない。自分で作成したものは実行できる。)
