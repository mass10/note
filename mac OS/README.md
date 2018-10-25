# extend desktop notification hover time on mac OS Sierra.

```
defaults read com.apple.notificationcenterui
defaults write com.apple.notificationcenterui bannerTime 20
defaults read com.apple.notificationcenterui
```

# grep

```
grep -r xxxxxxxxxx . --exclude-dir={.git,app,node_modules,./a/b,./a/b/c}
```
