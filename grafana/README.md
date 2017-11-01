# installing grafana on Ubuntu

```
$ wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_4.6.0_amd64.deb
$ sudo apt-get install -y adduser libfontconfig
$ sudo dpkg -i grafana_4.6.0_amd64.deb
```

to enable grafana-server on startup

```
$ sudo /bin/systemctl daemon-reload
$ sudo /bin/systemctl enable grafana-server
```

You shoud better restart computer.

or start grafana-server immediately.

```
$ sudo /bin/systemctl start grafana-server
```
