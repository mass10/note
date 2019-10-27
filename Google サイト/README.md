# Google サイト(=Google Sites) に独自ドメイン www.mydomain.com を貼る

1. Google Domains でドメインを購入する  
    ```mydomain.com```

2. Custom resource records に CNAME レコードを登録する  
    ```Name: www, Type: CNAME, TTL: 1h, Data: ghs.googlehosted.com```

3. Google サイトで作成したウェブサイトにカスタムURL ```www.mydomain.com``` を追加する。
