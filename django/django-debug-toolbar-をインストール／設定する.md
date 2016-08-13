##環境

- CentOS 6.5
- Python 2.6.6
- Django 1.6.7

##準備

インストール

```
# pip install django-debug-toolbar
```

settings.py に追記

```
INSTALLED_APPS = (

    ...

    #
    # ↓これを追記
    #
    'debug_toolbar',
)

#
# 追加
#
def custom_show_toolbar(request):
    return True

#
# 追加
# 
DEBUG_TOOLBAR_CONFIG = {
    'ENABLE_STACKTRACES' : True,
    'SHOW_TOOLBAR_CALLBACK': 'プロジェクト名.settings.custom_show_toolbar',
}

```
