##cabal

`2016-03-13`

```
$ cabal install HDBC-mysql
Resolving dependencies...
Downloading HDBC-mysql-0.6.6.1...
[1 of 1] Compiling Main             ( /tmp/HDBC-mysql-0.6.6.1-30157/HDBC-mysql-0.6.6.1/dist/setup/setup.hs, /tmp/HDBC-mysql-0.6.6.1-30157/HDBC-mysql-0.6.6.1/dist/setup/Main.o )

/tmp/HDBC-mysql-0.6.6.1-30157/HDBC-mysql-0.6.6.1/dist/setup/setup.hs:31:24: Warning:
    In the use of `findProgramOnPath'
    (imported from Distribution.Simple.Program):
    Deprecated: "use findProgramLocation instead"

/tmp/HDBC-mysql-0.6.6.1-30157/HDBC-mysql-0.6.6.1/dist/setup/setup.hs:32:24: Warning:
    In the use of `findProgramOnPath'
    (imported from Distribution.Simple.Program):
    Deprecated: "use findProgramLocation instead"
Linking /tmp/HDBC-mysql-0.6.6.1-30157/HDBC-mysql-0.6.6.1/dist/setup/setup ...
Configuring HDBC-mysql-0.6.6.1...
setup: The program mysql_config is required but it could not be found
Failed to install HDBC-mysql-0.6.6.1
cabal: Error: some packages failed to install:
HDBC-mysql-0.6.6.1 failed during the configure step. The exception was:
ExitFailure 1

$ which mysql_config
(not foud)

$ su - root

# apt-get install libmysqlclient-dev
# exit

$ which mysql_config
/usr/bin/mysql_config

$ cabal install HDBC-mysql
```
