# mecab (with python3, Ubuntu 18.04)

```
sudo apt install swig
sudo apt install mecab-ipadic-utf8
sudo apt install mecab
sudo apt install libmecab-dev
```

# 解析

```
cat TEXT
庭には二羽、鶏がいます。
```

```
cat TEXT | mecab
庭      名詞,一般,*,*,*,*,庭,ニワ,ニワ
に      助詞,格助詞,一般,*,*,*,に,ニ,ニ
は      助詞,係助詞,*,*,*,*,は,ハ,ワ
二      名詞,数,*,*,*,*,二,ニ,ニ
羽      名詞,接尾,助数詞,*,*,*,羽,ワ,ワ
、      記号,読点,*,*,*,*,、,、,、
鶏      名詞,一般,*,*,*,*,鶏,ニワトリ,ニワトリ
が      助詞,格助詞,一般,*,*,*,が,ガ,ガ
い      動詞,自立,*,*,一段,連用形,いる,イ,イ
ます    助動詞,*,*,*,特殊・マス,基本形,ます,マス,マス
。      記号,句点,*,*,*,*,。,。,。
EOS
```
