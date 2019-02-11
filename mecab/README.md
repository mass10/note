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
```
