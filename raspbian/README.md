# Raspbian を焼く (2017-07-15)

- Etcher ... 刺してクリックでポン！

# Wi-Fi の接続情報を記録する (2017-07-15)

```
wpa_passphrase "自宅の Wi-Fi の SSID" "パスフレーズ" >> /etc/wpa_supplicant/wpa_supplicant.conf
```

# ??? (2017-07-20)

```
modprobe usbserial vendor=0x1004 product=0x6327

docomo L03D
```

# ??? (2017-07-21)

```
systemctl status soracom-ppp.service
systemctl enable soracom-ppp.service
systemctl stop soracom-ppp.service
systemctl soracom start-ppp.service
```

## ローカルエリア内のホストを探す (2017-07-15)

```
arp -a
```

## Raspberry Pi の接続情報 (2017-07-21)

ホスト名: raspberrypi.local
ユーザー: pi
パスワード: raspberry

