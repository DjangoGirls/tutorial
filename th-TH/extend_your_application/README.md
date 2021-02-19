{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# เพิ่มความสามารถให้เว็บคุณ

We've already completed all the different steps necessary for the creation of our website: we know how to write a model, URL, view and template. We also know how to make our website pretty.

ได้เวลาฝึกแล้ว!

สิ่งแรกที่เราต้องการสำหรับบล็อกของเราคือ หน้าเว็บที่จะแสดงโพสต์หนึ่งโพสต์ของเรา ถูกมั้ย?

ซึ่งเรามีโมเดล `Post` แล้ว ดังนั้น เราไม่จำเป็นต้องเพิ่มอะไรลงไปใน `models.py`.

## สร้าง template ที่แสดงหน้ารายละเอียดของโพสต์

We will start with adding a link inside `blog/templates/blog/post_list.html` file. Open it in the code editor, and so far it should look like this: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <article class="post">
            <time class="date">
                {{ post.published_date }}
            </time>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </article>
    {% endfor %}
{% endblock %}
```

{% raw %}We want to have a link from a post's title in the post list to the post's detail page. Let's change `<h2><a href="">{{ post.title }}</a></h2>` so that it links to the post's detail page:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h2><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h2>
```

{% raw %}ได้เวลาอธิบายบรรทัดเหล่านี้แล้ว `{% url 'post_detail' pk=post.pk %}` คุณอาจสงสัยว่าสัญลักษณ์ `{% %}` นี้หมายถึงอะไร มันหมายถึง เรากำลังใช้ template tag ของ Django ตอนนี้เราจะใช้มันเพื่อสร้าง URL ให้กับเรา!{% endraw %}

The `post_detail` part means that Django will be expecting a URL in `blog/urls.py` with name=post_detail

And how about `pk=post.pk`? `pk` is short for primary key, which is a unique identifier for each record in a database. Every Django model has a field which serves as its primary key, and whatever other name it has, it can also be referred to as "pk". Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a field named "id" holding a number that increases for each record, i.e. 1, 2, 3) and adds it as a field to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

ตอนนี้ เปิดหน้า: http://127.0.0.1:8000/ เราจะเจอข้อผิดพลาด (ตามที่คาดเอาไว้, เนื่องจากเรายังไม่มี URL หรือ *view* สำหรับ `post_detail`) โดยมีหน้าตาแบบนี้:

![NoReverseMatch error](images/no_reverse_match2.png)

## สร้าง URL สำหรับ รายละเอียดโพสต์

สร้าง URL ไฟล์ `urls.py` สำหรับ `post_detail` *view* ของเรา!

เราต้องการให้ละเอียดของโพสต์แรกของเรา แสดงที่นี่ **URL**: http://127.0.0.1:8000/post/1/

เรามาสร้าง URL ในไฟล์ `blog/urls.py` ที่ชี้ให้ Django ไปยัง *view* ที่ใช้ชื่อ `post_detail`, ซึ่งจะแสดงหน้าโพสต์ Open the `blog/urls.py` file in the code editor, and add the line `path('post/<int:pk>/', views.post_detail, name='post_detail'),` so that the file looks like this:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

This part `post/<int:pk>/` specifies a URL pattern – we will explain it for you:

- `post/` means that the URL should begin with the word **post** followed by a **/**. So far so good.
- `<int:pk>` – this part is trickier. It means that Django expects an integer value and will transfer it to a view as a variable called `pk`.
- `/` – then we need a **/** again before finishing the URL.

นั่นหมายถึง ถ้าคุณป้อน `http://127.0.0.1:8000/post/5/` เข้าไปยังเบราว์เซอร์ของคุณ Django จะเข้าใจว่าคุณกำลังมองหา *view* ที่ชื่อว่า `post_detail` และส่งข้อมูลคือ `pk` ซึ่งมีค่าเท่ากับ `5` ไปยัง *view*

OK, we've added a new URL pattern to `blog/urls.py`! Let's refresh the page: http://127.0.0.1:8000/ Boom! The server has stopped running again. Have a look at the console – as expected, there's yet another error!

![AttributeError](images/attribute_error2.png)

Do you remember what the next step is? It's adding a view!

## เพิ่ม view รายละเอียดของโพสต์

ตอนนี้ *view* ของเราจะได้พารามิเตอร์เพิ่มเข้ามาคือ `pk` Our *view* needs to catch it, right? ดังนั้นเราจะสร้างฟังก์ชั่นใหม่ โดยใช้ `def post_detail(request, pk):` Note that this parameter must have the exact same name as the one we specified in `urls` (`pk`). Also note that omitting this variable is incorrect and will result in an error!

ตอนนี้ เราต้องการโพสต์เดียวเท่านั้น เราสามารถทำได้ โดยใช้ queryset แบบนี้:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

แต่โค้ดนี้มีปัญหา ถ้าเกิดว่ามันไม่มี `Post` ตามค่า `primary key` (`pk`) ที่ส่งมา เราจะได้ข้อผิดพลาดหน้าตาน่าเกลียดสุดๆ!

![DoesNotExist error](images/does_not_exist2.png)

เราไม่ต้องการแบบนี้! But luckily Django comes with something that will handle that for us: `get_object_or_404`. ในกรณีที่ไม่มี `Post` จากค่า `pk` ที่ส่งไป มันจะแสดงหน้าเว็บที่ดูดีกว่าให้เรา (เรียกว่าหน้า `Page Not Found 404`)

![Page not found](images/404_2.png)

ข่าวดีคือ คุณสามารถสร้างหน้า `Page not found` เป็นของคุณเองได้ และทำให้สวยแค่ไหนก็ได้ตามที่คุณต้องการ แต่ตอนนี้ยังมันไม่จำเป็นเท่าไหร่นัก เราจะขอข้ามไปก่อน

เอาล่ะ ได้เวลาเพิ่ม *view* ไปยังไฟล์ `views.py` ของเราแล้ว!

In `blog/urls.py` we created a URL rule named `post_detail` that refers to a view called `views.post_detail`. This means that Django will be expecting a view function called `post_detail` inside `blog/views.py`.

We should open `blog/views.py` in the code editor and add the following code near the other `from` lines:

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

ใช้ได้แล้ว! แต่ เกิดอะไรขึ้นเมื่อคุณคลิกที่ลิงค์บนหัวข้อโพสต์?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

โอ้ ไม่นะ! ข้อผิดพลาดอีกอันแล้ว! แต่เรารู้วิธีรับมือปัญหานี้แล้ว ใช่มั้ย? เราต้องเพิ่ม template ยังไงล่ะ!

## สร้าง template ที่แสดงหน้ารายละเอียดของโพสต์

We will create a file in `blog/templates/blog` called `post_detail.html`, and open it in the code editor.

Enter the following code:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <article class="post">
        {% if post.published_date %}
            <time class="date">
                {{ post.published_date }}
            </time>
        {% endif %}
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endblock %}
```

เป็นอีกครั้งที่เรา extend ไฟล์ `base.html` ใน block `content` เราต้องการแสดง published_date ของโพสต์ (ถ้ามี), หัวข้อ และ เนื้อหา แต่เราควรจะมาปรึกษากันถึงเรื่องสำคัญอีกอย่างก่อน ดีมั้ย?

{% raw %}`{% if ... %} ... {% endif %}` คือ template tag ที่เราสามารถใช้ เมื่อเราต้องการตรวจสอบบางอย่าง (จำ `if ... else ...` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

เอาล่ะ เรามาลองโหลดหน้าเว็บของเราอีกครั้ง ตอนนี้หน้า `Page not found` ควรจะหายไปแล้ว

![Post detail page](images/post_detail2.png)

เย้! ใช้ได้แล้ว!

# ได้เวลา Deploy!

มันคงจะดี ถ้าเราจะดูหน้าเว็บของเราทำงานอยู่บน PythonAnywhere อีกครั้ง ใช่มั้ย? มา deploy กันอีกครั้ง

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

ต่อมา ใน [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

## Updating the static files on the server

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ workon <your-pythonanywhere-domain>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (from the menu button in the upper right of the console) and hit **Reload**, and then look at the https://subdomain.pythonanywhere.com page to see the result.

And that should be it. Congrats! :)