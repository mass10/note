#初めての Neo4j

##概要

- グラフデータベース
- データ(ノード)の関係性を超高速に検索できることを基本設計としている。条件によっては SQL の数千倍ものパフォーマンスを発揮する。
- SQL における結合を排除。
- とにかく速いらしい。


##ハンズオン

######管理コンソール
http://127.0.0.1:7474

######画面をクリア
```
:clear
```

######ヘルプを参照
```
:help MATCH
:help DELETE
```

######一切の関係を持たないノードを作成します。6人の Person ということにします。Person というのはノードに付けられたラベルです。
```
CREATE (ee:Person {name: "Taa", from: "Japan"})
CREATE (ee:Person {name: "Caa", from: "Guatemala"})
CREATE (ee:Person {name: "Zaa", from: "Japan"})
CREATE (ee:Person {name: "Laa", from: "Indonesia"})
CREATE (ee:Person {name: "Coo", from: "Vietnam"})
CREATE (ee:Person {name: "Mee", from: "Malaysia"})
```

######ノードと関係を構築します。
```
MATCH (left:Person), (right:Person)
	WHERE left.name = "Caa" AND right.name = "Laa"
	CREATE (left)-[:KNOWS]->(right)
MATCH (left:Person), (right:Person)
	WHERE left.name = "Caa" AND right.name = "Laa"
	CREATE (right)-[:KNOWS]->(left)
MATCH (left:Person), (right:Person)
	WHERE left.name = "Caa" AND right.name = "Zaa"
	CREATE (left)-[:KNOWS]->(right)
MATCH (left:Person), (right:Person)
	WHERE left.name = "Caa" AND right.name = "Zaa"
	CREATE (right)-[:KNOWS]->(left)
MATCH (left:Person), (right:Person)
	WHERE left.name = "Caa" AND right.name = "Mee"
	CREATE (left)-[:KNOWS]->(right)
MATCH (left:Person), (right:Person)
	WHERE left.name = "Caa" AND right.name = "Mee"
	CREATE (right)-[:KNOWS]->(left)
MATCH (left:Person), (right:Person)
	WHERE left.name = "Laa" AND right.name = "Mee"
	CREATE (left)-[:KNOWS]->(right)
MATCH (left:Person), (right:Person)
	WHERE left.name = "Mee" AND right.name = "Zaa"
	CREATE (left)-[:KNOWS]->(right)
MATCH (left:Person), (right:Person)
	WHERE left.name = "Zaa" AND right.name = "Mee"
	CREATE (left)-[:KNOWS]->(right)
```

######ノードを削除します。ただしすべての関係を断ち切らないと削除することはできません。
```
MATCH (a:Person)
	WHERE a.name = "Caa"
	DELETE a
```

######Taa さんには消えてもらいます。
```
MATCH (a:Person)
	WHERE a.name = "Taa"
	DELETE a
```

######Coo さんに知り合いができました
```
MATCH (a:Person), (b:Person)
	WHERE a.name = "Coo" AND b.name = "Mee"
	CREATE (a)-[:KNOWS]->(b)
MATCH (a:Person), (b:Person)
	WHERE a.name = "Coo" AND b.name = "Mee"
	CREATE (b)-[:KNOWS]->(a)
```

######全てのノードを抽出
```
MATCH (a:Person) RETURN a LIMIT 999
```

######Indonesia 出身の Person を抽出
```
MATCH (left:Person)
	WHERE left.from = 'Indonesia'
	RETURN left
```

######Japan 出身の人を抽出
```
MATCH (left:Person)
	WHERE left.from = 'Japan'
	RETURN left
```

######Japan 出身の Company を全て抽出
```
MATCH (left:Company)
	WHERE left.from = 'Japan'
	RETURN left
```

######DELETE *
```
MATCH (n:Company)
	DELETE n
MATCH (n)
	DELETE n
```

######ありとあらゆるノード間の関係を断ち切る
```
MATCH (n)-[r]->()
	DELETE r
```

######Caa さんから他のノードに向いたすべての関係を断ちます。
```
MATCH (n)-[r]->()
	WHERE n.name = 'Caa'
	DELETE r
```

######Caa さんを知っている Person を全て抽出します。

```
MATCH (left:Person)-[:KNOWS]->(right:Person)
	WHERE right.name = 'Caa'
	RETURN left
```
