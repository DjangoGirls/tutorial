# Django URLs

เรากำลังจะสร้างหน้าเว็บแรกของเรา: เป็นหน้าแรกสำหรับบล็อกของคุณ! แต่ก่อนอื่น เรามาเรียนเรื่อง Django urls กันซักหน่อย

## URL คืออะไร?

URL นั้นคือที่อยู่ของเว็บ คุณเห็น URL ทุกครั้งที่เข้าดูเว็บไซต์ - มันปรากฎอยู่ในช่องที่อยู่ของเบราว์เซอร์ของคุณ (ใช่แล้ว! `127.0.0.1:8000` ก็คือ URL! และ `https://djangogirls.org` ก็คือ URL เช่นกัน)

![Url](images/url.png)

ทุกหน้าเว็บบนอินเทอร์เน็ต ต้องมี URL เป็นของตัวเอง วิธีนี้ทำให้แอปพลิเคชั่นของคุณรู้ว่าควรจะแสดงหน้าไหนให้กับผู้ใช้ที่เปิด URL นั้น ใน Django เราใช้สิ่งที่เรียกว่า `URLconf` (URL configuration) URLconf คือชุดของรูปแบบที่ Django จะพยายามจับคู่ให้ตรงกับ URL ที่ได้รับมาเพื่อหา view ที่ถูกต้อง

## URL ทำงานอย่างไรใน Django?

ลองเปิดไฟล์ `mysite/urls.py` ขึ้นมาและดูว่าข้างในเป็นอย่างไร:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

อย่างที่คุณเห็น Django ได้เตรียมอะไรอะไรไว้ให้เราในที่นี้บ้างแล้ว

Lines between triple quotes (`'''` or `"""`) are called docstrings – you can write them at the top of a file, class or method to describe what it does. มันจะไม่ถูกรันโดย Python

Admin URL คือหน้าที่คุณได้เข้าไปชมในบทก่อนหน้า แล้วมันก็อยู่ที่นี่แล้ว:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

บรรทัดนี้หมายความว่า ทุก URL ที่ขึ้นต้นด้วย `admin/` Django จะหา *view* ที่สอดคล้องให้ In this case, we're including a lot of admin URLs so it isn't all packed into this small file – it's more readable and cleaner.

## Your first Django URL!

Time to create our first URL! We want 'http://127.0.0.1:8000/' to be the home page of our blog and to display a list of posts.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.

Your `mysite/urls.py` file should now look like this:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django will now redirect everything that comes into 'http://127.0.0.1:8000/' to `blog.urls` and looks for further instructions there.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Here we're importing Django's function `path` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

After that, we can add our first URL pattern:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the root URL. This URL pattern will match an empty string and the Django URL resolver will ignore the domain name (i.e., http://127.0.0.1:8000/) that prefixes the full url path. This pattern will tell Django that `views.post_list` is the right place to go if someone enters your website at the 'http://127.0.0.1:8000/' address.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. This can be the same as the name of the view but it can also be something completely different. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Error](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/urls/