# Babel？

* JavaScript ソースを変換する。
* TypeScript の transpile にも使用できるっぽい？(通常は tsc --build)

# 問題 「Error: Requires Babel "^7.0.0-0", but was loaded with "6.26.3"」 (2021-08-02)

* 概要


> Error: Requires Babel "^7.0.0-0", but was loaded with "6.26.3". If you are sure you have a compatible version of @babel/core, it is likely that something in your build process is loading the wrong version. Inspect the stack trace of this error to look for the first entry that doesn't mention "@babel/core" or "babel-core" to see what is calling Babel. (While processing preset: "C:\\Users\\irisa\\workspace\\s3-test-websites\\node_modules\\@babel\\preset-env\\lib\\index.js")


* 対処
```bash
yarn remove babel-cli
yarn add --dev @babel/cli
```
