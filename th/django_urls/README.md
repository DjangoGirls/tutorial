# Django URLs

We're about to build our first webpage: a homepage for your blog! But first, let's learn a little bit about Django URLs.

## URL คืออะไร?

URL นั้นคือที่อยู่ของเว็บ You can see a URL every time you visit a website – it is visible in your browser's address bar. (Yes! `127.0.0.1:8000` ก็คือ URL! And `https://djangogirls.org` is also a URL.)

![Url](images/url.png)

ทุกหน้าเว็บบนอินเทอร์เน็ต ต้องมี URL เป็นของตัวเอง This way your application knows what it should show to a user who opens that URL. ใน Django เราใช้สิ่งที่เรียกว่า `URLconf` (URL configuration) URLconf is a set of patterns that Django will try to match with the requested URL to find the correct view.

## URL ทำงานอย่างไรใน Django?

ลองเปิดไฟล์ `mysite/urls.py` ขึ้นมาและดูว่าข้างในเป็นอย่างไร:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
]
```

As you can see, Django has already put something here for us.

Lines between triple quotes (`'''` or `"""`) are called docstrings – you can write them at the top of a file, class or method to describe what it does. They won't be run by Python.

The admin URL, which you visited in previous chapter, is already here:

{% filename %}mysite/urls.py{% endfilename %}

```python
    url(r'^admin/', admin.site.urls),
```

This line means that for every URL that starts with `admin/`, Django will find a corresponding *view*. In this case we're including a lot of admin URLs so it isn't all packed into this small file – it's more readable and cleaner.

## Regex

คุณสงสัยไหมว่า Django จับคู่ URL เข้ากับ view ยังไง? ตรงนี้จะซับซ้อนนิดหน่อย Django ใช้ `regex` ย่อมาจาก "regular expressions" Regex มีกฎที่มากมาย (มากมายจริงๆ!) ที่ใช้เป็นรูปแบบในการค้นหา เนื่องจาก regexe เป็นหัวข้อขั้นสูง เราจะไม่ลงรายละเอียดมากนัก

If you still wish to understand how we created the patterns, here is an example of the process – we will only need a limited subset of the rules to express the pattern we are looking for, namely:

* `^` for the beginning of the text
* `$` for the end of the text
* `\d` for a digit
* `+` to indicate that the previous item should be repeated at least once
* `()` to capture part of the pattern

Anything else in the URL definition will be taken literally.

Now imagine you have a website with the address like `http://www.mysite.com/post/12345/`, where `12345` is the number of your post.

การเขียนหน้า view สำหรับทุกหมายเลขโพสต์ คงจะทำให้น่ารำคาญมาก With regular expressions, we can create a pattern that will match the URL and extract the number for us: `^post/(\d+)/$`. Let's break this down piece by piece to see what we are doing here:

* **^post/** is telling Django to take anything that has `post/` at the beginning of the url (right after `^`)
* **(\d+)** หมายความว่า ตรงนี้ต้องเป็นตัวเลข (หนึ่งตัวหรือมากกว่า) และเราต้องการหมายเลขนี้แหละ
* **/** บอก django ว่ามี `/` ต่อท้ายอีกอัน
* **$** บ่งบอกถึงจุดสิ้นสุดของ URL หมายถึงว่า url ต้องลงท้ายด้วย `/` เท่านั้นถึงจะตรงกับรูปแบบนี้

## Your first Django URL!

Time to create our first URL! We want 'http://127.0.0.1:8000/' to be the home page of our blog and to display a list of posts.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so **you will need** to add that to the import on the first line of the file.

ไฟล์ `mysite/urls.py` ของคุณควรมีหน้าตาดังนี้:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'', include('blog.urls')),
]
```

Django จะจัดการทุกคำร้องขอที่เข้ามาที่ 'http://127.0.0.1:8000/' ไปยัง `blog.urls` และดูว่าจะทำอะไรต่อจากนี้

Writing regular expressions in Python is always done with `r` in front of the string. ซึ่งเป็นประโยชน์กับ Python เพราะอาจจะมีอักขระพิเศษที่มีผลกับ regular expression

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

ต่อมา เราจะเพิ่มรูปแบบ URL ของเรา:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the `^$` URL. This regular expression will match `^` (a beginning) followed by `$` (an end) – so only an empty string will match. ซึ่งถูกต้อง เพราะ Django ประมวลดูว่า URL 'http://127.0.0.1:8000/' นั้นไม่ใช่ส่วนหนึ่งของ URL รูปแบบนี้จะบอก Django ว่า `views.post_list` คือที่ๆ ต้องมาดู เมื่อมีใครสักคนเข้ามายังหน้า 'http://127.0.0.1:8000/'

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. ตรงนี้สามารถใช้ชื่อเดียวกันกับ view ได้ แต่ก็ยังคงเป็นสิ่งที่แตกต่างกันอย่างสิ้นเชิงได้เช่นกัน We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![ข้อผิดพลาด](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage your `/admin/` will also not work. No worries – we will get there.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/1.11/topics/http/urls/