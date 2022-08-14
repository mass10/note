
# https://github.com/rustwasm/rust-webpack-template (2021-06-08)
* Rust で WebAssembly を始めるときのテンプレート。`npm install` して `npm start` で動く、よいテンプレートだった。MDN 公式チュートリアルが動かなかった(理由: bg.js が not found なため)ので、助かった。

# https://github.com/ruffle-rs/ruffle (2021-06-09)

# lunatic
https://lunatic.solutions/
* Eavang/OTP の影響を受けた WebAssembly プラットフォーム。超軽量プロセスに閉じた環境で module を動かす。

# Installing wasmer (2022-08-14)

```
cargo install wasmer-cli --features singlepass,cranelift
cargo install wapm-cli
```
