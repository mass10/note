# version

```
$ gradle -v
```


# create a project skelton

```
$ mkdir PROJECT_NAME
$ cd PROJECT_NAME
$ gradle init --type java-application
```

# show help

```
$ gradle help
```


# build a java project

```
$ gradle build
```

# shows tasks of project

```
$ gradle tasks
```

# エラー: メイン・クラスMainが見つからなかったかロードできませんでした

Gradle プロジェクトのデフォルトソースパスは ```$project_root/src/main/java``` です。

これに反する(例えば ```src``` をソースパスとして使用する)場合には ```build.gradle``` に↓このような行を追加する必要があります。

```[build.gradle]
sourceSets.main.java.srcDirs = ['src']
```
