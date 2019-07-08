# آدرس دهی در جنگو

ما در آستانه ساخت اولین صفحه وب هستیم: یک صفحه برای وبلاگ شما! ولی قبل از آن بیایید کمی در مورد آدرس دهی در جنگو یادبگیریم.

## URL چیست؟

یک URL یک آدرس اینترنتی است. شما هربار که وبسایتی را بازدید می‌کنید می‌توانید آدرس آن را ببینید، این آدرس، در address bar یا پنجره آدرس مرورگر دیده می‌شود. (بله! `127.0.0.1:8000` یک آدرس است! و `https://djangogirls.org` هم یک آدرس است.)

![Url](images/url.png)

هر صفحه‌ای در اینترنت آدرس خود را لازم دارد. به این روش برنامه ما متوجه می‌شود که چه چیزی را باید به کاربری که یک آدرس را باز می‌کند نشان بدهد. در جنگو ما از چیزی به نام `URLconf` استفاده می‌کنیم (URL configuration). URLconf مجموعه‌ای از الگوها است که جنگو به کمک آن می‌تواند متوجه شود که آدرس درخواست شده باید به کدام نما، ارجاع داده شود.

## آدرس ها در جنگو چطور کار می‌کنند؟

حالا فایل `mysite/urls.py` را در ویرایشگر کد خود باز کنید و ببینید چگونه است:

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

همانطور که می‌بینید، اینجا جنگو چیزهایی برای ما گذاشته است.

به خطوط بین نقل قول سه تایی (`'''` یا `"""`) docstrings یا توضیحات سند گفته می‌شود. شما می‌توانید این توضیحات را در بالای فایل، کلاس یا تابع بنویسید و عملکرد آن را شرح دهید. این خطوط توسط پایتون اجرا نمی‌شوند.

The admin URL, which you visited in the previous chapter, is already here:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

This line means that for every URL that starts with `admin/`, Django will find a corresponding *view*. در این مورد خاص، ما تعداد زیادی آدرس را اضافه کرده‌ایم که همه آن‌ها در این فایل نیامده‌اند - این شکل از خلاصه کردن آدرس‌ها خوانایی وتمیزی کدها را افزایش می‌دهد.

## اولین آدرس جنگویی شما!

زمان آن است که اولین آدرس خود را بسازید! ما می‌خواهیم که 'http://127.0.0.1:8000/' صفحه اصلی وبلاگ ما باشد که در آن لیستی از پست‌ها نمایش داده شود.

همچنین می‌خواهیم که فایل `mysite/urls.py` را تمیز نگه داریم، در نتیجه آدرس‌ها را از اپلیکیشن `blog` ، در فایل اصلی آدرس‌ها `mysite/urls.py` فراخوانی می‌کنیم.

به پیش برویم و خطی را اضافه کنیم که `blog.urls` را بارگذاری می‌کند. همچنین لازم است که خط `from django.urls…` را عوض کنید چرا که ما اینجا از تابع `include` استفاده می‌کنیم، بنابراین لازم است که شما دستور import را به این خط اضافه کنید.

فایل `mysite/urls.py` شما باید چیزی شبیه به این شده باشد:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.contrib import path, include
from django.urls import admin

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

حالا جنگو هر درخواستی که به آدرس 'http://127.0.0.1:8000/' ارسال شود را به `blog.urls` ارسال می‌کند و دستورالعمل‌های بعدی را در آنجا جستجو می‌کند.

## blog.urls

در پوشه `blog` یک فایل خالی به نام `urls.py` بسازید و آن را در ویرایشگر کد باز کنید. بسیار خوب! این دو خط را به آن اضافه کنید:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

در اینجا ما تابع جنگویی `path` و تمام `view` ها از اپلیکیشن `blog` را بارگزاری کرده‌ایم (هرچند که هنوز هیچ view نداریم ولی تا چند دقیقه دیگر سراغ آن خواهیم رفت!)

بعد از این می‌توانیم اولین الگو آدرس را اضافه کنیم:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

همانطور که می‌بینید ما یک `view` به نام `post_list` را به آدرس پایه وبلاگ نسبت داده‌ایم. این الگوی آدرس شامل یک رشته خالی از کاراکتر است، سیستم بررسی آدرس جنگو نام دامین را (مثلاً http://127.0.0.1:8000/) که پیشوندی برای همه آدرس‌ها است، در نظر نمی‌گیرد. این الگو به جنگو می‌گوید که اگر کسی آدرس 'http://127.0.0.1:8000/' را وارد کرد باید به `views.post_list` بروی.

قسمت آخر، `name='post_list'`، نام آدرس است که برای تعیین هویت یک view استفاده می‌شود. این نام می‌تواند کاملاً شبیه نام view باشد یا نام کاملاً متفاوتی داشته باشد. ما بعداً از آدرس‌های نامگذاری شده در پروژه استفاده خواهیم کرد بنابراین مهم است که برای هر آدرسی نام، تعریف شود. علاوه بر این تلاش خواهیم کرد که نام آدرس‌ها، منحصر به فرد و ساده باشد.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Error](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there. If you see a different error message, try restarting your web server. To do that, in the console window that is running the web server, stop it by pressing Ctrl+C (the Control and C keys together) and restart it by running a `python manage.py runserver` command.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/urls/