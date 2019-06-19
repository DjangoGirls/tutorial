# Àwọn URL Django

A ti fẹ́ kọ́ ojú-ìwé ayélujára àkọ́kọ́ wa: ojú-ìwé ìbẹ̀rẹ̀ kan fún blog wa! Ṣùgbọ́n lákọ̀ọ́kọ́ ná, jẹ́ ká kẹ́kọ̀ọ́ díẹ̀ nípa àwọn URL Django.

## Kíni URL kan?

URL kan jẹ́ àdírẹ́ẹ̀sì ayélujára kan. O lè rí URL kan ní gbogbo ìgbà tí o bá ṣèbẹ̀wò ààyè ayélujára kan – ó fojú hàn nínú pẹpẹ àdírẹ́ẹ̀sì ti aṣàwákiri rẹ. (Bẹ́ẹ̀ ni! `127.0.0.1:8000` jẹ́ URL kan! Àti pé `https://djangogirls.org` tún jẹ́ URL kan.)

![Url](images/url.png)

Gbogbo ojú-ìwé lórí Íńtánẹ́ẹ̀tì náà ló nílò URL tirẹ̀. Lọ́nà yìí, ètò rẹ yíò mọ ohun tó yẹ kó gbé jáde fún aṣàmúlò kan tó bá ṣí URL yẹn. Ní Django, a máa n lo nnkan kan tí a n pè ní `URLconf` (URL configuration - ìṣètò URL). URLconf jẹ́ àpapọ̀ àwọn àpẹẹrẹ kan tí Django yíò gbìyànjú láti báramu pẹ̀lú URL tí a béèrè fún náà láti wá ohun tó tọ́ láti ṣàfihàn.

## Báwo ni àwọn URL ṣé n ṣiṣẹ́ ní Django?

Jẹ́ ká ṣí fáìlì `mysite/urls.py` náà sílẹ̀ nínú olóòtú kóòdù tó wù ẹ kí a wo bó ṣe rí:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

As you can see, Django has already put something here for us.

Lines between triple quotes (`'''` or `"""`) are called docstrings – you can write them at the top of a file, class or method to describe what it does. They won't be run by Python.

The admin URL, which you visited in the previous chapter, is already here:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

This line means that for every URL that starts with `admin/`, Django will find a corresponding *view*. In this case, we're including a lot of admin URLs so it isn't all packed into this small file – it's more readable and cleaner.

## URL Django àkọ́kọ́ rẹ!

Àkókò láti ṣẹ̀dá URL àkọ́kọ́ wa! A fẹ́ kí 'http://127.0.0.1:8000/' jẹ́ ojú-ìwé ìbẹ̀rẹ̀ ti blog wa kó sì ṣàfihàn àkójọ àwọn àròkọ kan.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. You will also need to change the `from django.urls…` line because we are using the `include` function here, so you will need to add that import to the line.

Your `mysite/urls.py` file should now look like this:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django will now redirect everything that comes into 'http://127.0.0.1:8000/' to `blog.urls` and looks for further instructions there.

## blog.urls

Ṣẹ̀dá fáìlì òfìfo tuntun kan tó ń jẹ́ `urls.py` nínú àkójọpọ̀ fáìlì `blog` náà, kí o sì ṣí nínú olóòtú kóòdù náà. Ó dáa! Ṣàfikún àwọn ìlà méjì àkọ́kọ́ wọ̀nyí:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Níbí yìí, a n ṣàgbéwọlé iṣẹ́ `path` ti Django àti gbogbo `views` wa láti ètò `blog` náà. (A kò tíì ní èyíkéyìí, ṣùgbọ́n a óò débẹ̀ láàárín ìṣẹ́jú kan!)

Lẹ́yìn ìyẹn, a lè ṣàfikún àpẹẹrẹ URL àkọ́kọ́ wa:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

Gẹ́gẹ́ bó o ṣe ríi, a tí n yan `view` kan tí a n pè ní `post_list` sí URL ìpìlẹ̀ náà báyìí. This URL pattern will match an empty string and the Django URL resolver will ignore the domain name (i.e., http://127.0.0.1:8000/) that prefixes the full url path. Àpẹẹrẹ yìí yíò sọ fún Django pé `views.post_list` jẹ́ ààyè tó tọ́ láti lọ tí ẹnìkan bá wọ inú ààyè ayélujára rẹ láti àdírẹ́ẹ̀sì 'http://127.0.0.1:8000/' náà.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. This can be the same as the name of the view but it can also be something completely different. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Àṣìṣe](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there. If you see a different error message, try restarting your web server. To do that, in the console window that is running the web server, stop it by pressing Ctrl+C (the Control and C keys together) and restart it by running a `python manage.py runserver` command.

> Tí o bá fẹ́ mọ̀ si nípa àwọn URLconf Django, wo àkànṣe àkọsílẹ̀ àlàyé náà: https://docs.djangoproject.com/en/2.0/topics/http/urls/