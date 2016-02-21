##はじめに

Eclipse で Git を扱うための準備を記録。EGit というプラグインをインストールする。

##環境

- Windows 7
- Eclipse 4.3 KEPLER

##手順

1. 「help」→「Install New Software...」      
2. 「Add」で http://download.eclipse.org/egit/updates を追加  
3. 「Eclipse Git Team Provider」をツリーごと選択   
4. Go

##トラブルシューティング

###GitHub リポジトリに対する操作で Auth failed が出る

Eclipse の [Windows] -> [Preferences] -> [General] -> [Network Connections] -> [SSH2]  
[General] タブ内、[Private keys] に [github_rsa] を追記

