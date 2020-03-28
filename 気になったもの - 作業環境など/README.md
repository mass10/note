# sshuttle

- https://github.com/sshuttle/sshuttle
- VPN ソフトウェア？
- クックパッドのリモートワーク紹介 https://techlife.cookpad.com/entry/2020/02/21/130002 より


# ローカルIPアドレスの名前解決するサービス xip.io

ローカルIPにリダイレクトさせたい場合などで使う

```golang
func configure(c echo.Context) *oauth2.Config {

	client_id := os.Getenv("CLIENT_ID")
	client_secret := os.Getenv("CLIENT_SECRET")

	conf := &oauth2.Config{
		ClientID: client_id,
		ClientSecret: client_secret,
		Scopes: []string{"email", "profile"},
		Endpoint: google.Endpoint,
		RedirectURL: "http://192.168.56.101.xip.io:8081/callback",
	}

	fmt.Printf("[TRACE]\n    oauth configuration: %v\n    endpoint: %v\n\n", conf, google.Endpoint)

	return conf
}
```
