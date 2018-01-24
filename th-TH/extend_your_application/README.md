# เพิ่มความสามารถให้เว็บคุณ

เราได้เรียนรู้ขั้นตอนทั้งหมดในการสร้างเว็บไซต์แล้ว: เรารู้วิธีสร้าง โมเดล, url, view และ template รวมถึงการทำให้เว็บเราสวยงามขึ้น

ได้เวลาฝึกแล้ว!

สิ่งแรกที่เราต้องการสำหรับบล็อกของเราคือ หน้าเว็บที่จะแสดงโพสต์หนึ่งโพสต์ของเรา ถูกไหม?

ซึ่งเรามีโมเดล `Post` แล้ว ดังนั้น เราไม่จำเป็นต้องเพิ่มอะไรลงไปใน `models.py`.

## สร้าง template ที่แสดงหน้ารายละเอียดของโพสต์

We will start with adding a link inside `blog/templates/blog/post_list.html` file. So far it should look like this: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

{% raw %}เราต้องการที่จะมีลิงค์ที่ชื่อของโพสต์ในหน้ารายการโพสต์ เพื่อไปยังหน้ารายละเอียดของโพสต์ เปลี่ยนบรรทัด `<h1><a href="">{{ post.title }}</a></h1>` ให้เป็นแบบนี้:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}ได้เวลาอธิบายบรรทัดเหล่านี้แล้ว `{% url 'post_detail' pk=post.pk %}` คุณอาจสงสัยสัญลักษณ์ `{% %}` นี้ ซึ่งก็คือ เรากำลังใช้ template tag ของ Django ตอนนี้เราจะใช้เพื่อสร้าง URL ให้กับเรา!{% endraw %}

The `post_detail` part means that Django will be expecting a URL in `blog/urls.py` with name=post_detail

And how about `pk=post.pk`? `pk` is short for primary key, which is a unique name for each record in a database. Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a number that increases by one for each record, i.e. 1, 2, 3) and adds it as a field named `pk` to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Now when we go to http://127.0.0.1:8000/ we will have an error (as expected, since we do not yet have a URL or a *view* for `post_detail`). It will look like this:

![NoReverseMatch error](images/no_reverse_match2.png)

## สร้าง URL สำหรับ รายละเอียดโพสต์

สร้าง URL ไฟล์ `urls.py` สำหรับ `post_detail` *view* ของเรา!

เราต้องการให้รายละเอียดของโพสต์แรกของเรา แสดงโดยการเข้าถึง **URL**: http://127.0.0.1:8000/post/1/

เรามาสร้าง URL ในไฟล์ `blog/urls.py` ให้ชี้ Django ไปยัง *view* ชื่อ `post_detail`, ซึ่งจะแสดงหน้าโพสต์ Add the line `url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),` to the `blog/urls.py` file. ตอนนี้ ไฟล์ของคุณควรมีหน้าตาแบบนี้:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
]
```

This part `^post/(?P<pk>\d+)/$` looks scary, but no worries – we will explain it for you:

- it starts with `^` again – "the beginning".
- `post/` just means that after the beginning, the URL should contain the word **post** and a **/**. So far so good.
- `(?P<pk>\d+)` – this part is trickier. มันหมายถึง Django จะรับข้อมูลเข้ามา และส่งต่อไปยัง view โดยผ่านตัวแปรชื่อ `pk` (Note that this matches the name we gave the primary key variable back in `blog/templates/blog/post_list.html`!) `\d` also tells us that it can only be a digit, not a letter (so everything between 0 and 9). `+` หมายถึง ต้องมีตัวเลขอย่างน้อยหนึ่งหลัก So something like `http://127.0.0.1:8000/post//` is not valid, but `http://127.0.0.1:8000/post/1234567890/` is perfectly OK!
- `/` – then we need a **/** again.
- `$` – "the end"!

นั่นคือ ถ้าคุณป้อน `http://127.0.0.1:8000/post/5/` มายังเบราว์เซอร์ของคุณ Django จะเข้าใจว่าคุณกำลังมองหา *view* ชื่อ `post_detail` และส่งข้อมูลคือ `pk` ซึ่งมีค่าเท่ากับ `5` ไปยัง *view* นั้น.

OK, we've added a new URL pattern to `blog/urls.py`! Let's refresh the page: http://127.0.0.1:8000/ Boom! The server has stopped running again. Have a look at the console – as expected, there's yet another error!

![AttributeError](images/attribute_error2.png)

คุณยังจำขั้นตอนถัดไปได้ไหม? แน่นอน: เพิ่ม view ใหม่!

## เพิ่ม view รายละเอียดของโพสต์

This time our *view* is given an extra parameter, `pk`. *view* ของเราต้องจับมันไว้ ใช่ไหม? ดังนั้นเราจะสร้างฟังก์ชันใหม่ โดยใช้ `def post_detail(request, pk):` สังเกตว่าเราต้องใช้ชื่อเดียวกันกับชื่อที่เรากำหนดไว้ใน url (`pk`) การละเว้นตัวแปรนี้ จะทำให้เกิดขึ้นผิดพลาด!

Now, we want to get one and only one blog post. To do this, we can use querysets, like this:

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

But this code has a problem. If there is no `Post` with the given `primary key` (`pk`) we will have a super ugly error!

![DoesNotExist error](images/does_not_exist2.png)

เราไม่ต้องการแบบนี้! แต่ แน่ล่ะ Django มาพร้อมกับสิ่งที่สามารถจัดการปัญหานี้ได้: `get_object_or_404` In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![Page not found](images/404_2.png)

ข่าวดีคือ คุณสามารถสร้างหน้า `Page not found` เป็นของคุณเองได้ และทำให้สวยแค่ไหนก็ได้ตามแต่คุณต้องการ แต่ตอนนี้ยังไม่จำเป็นเท่าไหร่นัก เราจะขอข้ามไปก่อน

OK, time to add a *view* to our `views.py` file!

In `blog/urls.py` we created a URL rule named `post_detail` that refers to a view called `views.post_detail`. This means that Django will be expecting a view function called `post_detail` inside `blog/views.py`.

We should open `blog/views.py` and add the following code near the other `from` lines:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

And at the end of the file we will add our *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

ได้เวลาโหลดหน้าเว็บนี้ใหม่: http://127.0.0.1:8000/

![Post list view](images/post_list2.png)

ใช้ได้แล้ว! แต่ เกิดอะไรขึ้นเมื่อคุณคลิกที่ลิงค์บนชื่อโพสต์?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

โอ้ ไม่นะ! ข้อผิดพลาดอีกแล้ว! แต่เรารู้วิธีรับมือปัญหานี้แล้ว ถูกไหม? เราต้องเพิ่ม template ไงล่ะ!

## Create a template for the post details

เราจะสร้างไฟล์ใน `blog/templates/blog` ชื่อ `post_detail.html`.

ผลลัพธ์จะคล้ายนี้:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

เป็นอีกครั้งที่เรา extend ไฟล์ `base.html` ใน block `content` เราต้องการแสดง published_date ของโพสต์ (ถ้ามี), ชื่อโพสต์ และ เนื้อหา แต่เราควรจะมาคุยกันถึงเรื่องสำคัญอีกอย่างก่อน ดีไหม?

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ..` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, we can refresh our page and see if `TemplateDoesNotExist` is gone now.

![Post detail page](images/post_detail2.png)

เย้! ใช้ได้แล้ว!

## มีอีกอย่างนึง: ได้เวลาเอาขึ้นเซิร์ฟเวอร์!

มันคงจะดี ถ้าเราจะดูหน้าเว็บของเราทำงานอยู่บน PythonAnywhere อีกครั้ง ใช่ไหม? มา deploy กันอีกครั้ง

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

ต่อมา ในคอนโซล [PythonAnywhere Bash](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd my-first-blog
    $ git pull
    [...]
    

สุดท้าย เปิด [Web tab](https://www.pythonanywhere.com/web_app_setup/) และกด **Reload**.

และนั่นควรเสร็จแล้ว! ยินดีด้วย :)