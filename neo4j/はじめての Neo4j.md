#初めての Neo4j

##概要

- グラフデータベース
- データ(ノード)の関係性を超高速に検索できることを基本設計としている。条件によっては SQL の数千倍ものパフォーマンスを発揮する。
- SQL における結合を排除。
- とにかく速いらしい。


##ハンズオン

###管理コンソール

http://192.168.141.152:7474

###画面をクリア
:clear

###ヘルプを参照
:help MATCH
:help DELETE

###一切の関係を持たないノードを作成します。6人の Person ということにします。Person というのはノードに付けられたラベルです。
CREATE (ee:Person {name: "Taro", from: "Japan"})
CREATE (ee:Person {name: "Cacao", from: "Guatemala"})
CREATE (ee:Person {name: "Takashi", from: "Japan"})
CREATE (ee:Person {name: "Lalah", from: "United States"})
CREATE (ee:Person {name: "Colin", from: "France"})
CREATE (ee:Person {name: "Mio", from: "Canada"})

###ノードと関係を構築します。
MATCH (left:Person), (right:Person)
	WHERE left.name = "Cacao" AND right.name = "Lalah"
	CREATE (left)-[:KNOWS]->(right)
MATCH (left:Person), (right:Person)
	WHERE left.name = "Cacao" AND right.name = "Lalah"
	CREATE (right)-[:KNOWS]->(left)
MATCH (left:Person), (right:Person)
	WHERE left.name = "Cacao" AND right.name = "Takashi"
	CREATE (left)-[:KNOWS]->(right)
MATCH (left:Person), (right:Person)
	WHERE left.name = "Cacao" AND right.name = "Takashi"
	CREATE (right)-[:KNOWS]->(left)
MATCH (left:Person), (right:Person)
	WHERE left.name = "Cacao" AND right.name = "Mio"
	CREATE (left)-[:KNOWS]->(right)
MATCH (left:Person), (right:Person)
	WHERE left.name = "Cacao" AND right.name = "Mio"
	CREATE (right)-[:KNOWS]->(left)
MATCH (left:Person), (right:Person)
	WHERE left.name = "Lalah" AND right.name = "Mio"
	CREATE (left)-[:KNOWS]->(right)
MATCH (left:Person), (right:Person)
	WHERE left.name = "Mio" AND right.name = "Takashi"
	CREATE (left)-[:KNOWS]->(right)
MATCH (left:Person), (right:Person)
	WHERE left.name = "Takashi" AND right.name = "Mio"
	CREATE (left)-[:KNOWS]->(right)

###ノードを削除します。ただしすべての関係を断ち切らないと削除することはできません。
MATCH (a:Person)
	WHERE a.name = "Cacao"
	DELETE a

###Taro さんには消えてもらいます。
MATCH (a:Person)
	WHERE a.name = "Taro"
	DELETE a

###Coline さんに知り合いができました
MATCH (a:Person), (b:Person)
	WHERE a.name = "Coline" AND b.name = "Mio"
	CREATE (a)-[:KNOWS]->(b)
MATCH (a:Person), (b:Person)
	WHERE a.name = "Coline" AND b.name = "Mio"
	CREATE (b)-[:KNOWS]->(a)

###全てのノードを抽出
MATCH (a:Person) RETURN a LIMIT 999

###United States 出身の Person を抽出
MATCH (left:Person)
	WHERE left.from = 'United States'
	RETURN left

###Japan 出身の人を抽出
MATCH (left:Person)
	WHERE left.from = 'Japan'
	RETURN left

###Japan 出身の Company を全て抽出
MATCH (left:Company)
	WHERE left.from = 'Japan'
	RETURN left

###DELETE *
MATCH (n:Company)
	DELETE n
MATCH (n)
	DELETE n

###ありとあらゆるノード間の関係を断ち切る
MATCH (n)-[r]->()
	DELETE r

###Cacao さんから他のノードに向いたすべての関係を断ちます。
MATCH (n)-[r]->()
	WHERE n.name = 'Cacao'
	DELETE r

###Cacao さんを知っている Person を全て抽出します。
MATCH (left:Person)-[:KNOWS]->(right:Person)
	WHERE right.name = 'Cacao'
	RETURN left
