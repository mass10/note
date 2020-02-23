## Raspberry Pi の接続情報

ホスト名: raspberrypi.local
ユーザー: pi
パスワード: raspberry

# Wi-Fi の接続情報を記録する

```
wpa_passphrase "自宅の Wi-Fi の SSID" "パスフレーズ" >> /etc/wpa_supplicant/wpa_supplicant.conf
```

# ???

```
modprobe usbserial vendor=0x1004 product=0x6327

docomo L03D
```

# ???

```
systemctl status soracom-ppp.service
systemctl enable soracom-ppp.service
systemctl stop soracom-ppp.service
systemctl soracom start-ppp.service
```

## ローカルエリア内のホストを探す

```
arp -a
```
