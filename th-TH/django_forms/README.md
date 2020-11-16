# Django Form

สิ่งสุดท้ายที่เราต้องการทำในเว็บไซต์ของเราคือการสร้างส่วนที่เอาไว้แก้ไขบล็อกโพสต์ของเรา หน้า Django `admin` นั้น ก็เจ๋งดีอยู่หรอกนะ แต่ก็ปรับแต่งได้ค่อนข้างยากอยู่เหมือนกัน With `forms` we will have absolute power over our interface – we can do almost anything we can imagine!

สิ่งที่ดีอย่างหนึ่งของ Django form คือ เราสามารถเริ่มสร้างจากศูนย์เลย หรือสร้าง `ModelForm` ซึ่งจะบันทึกผลลัพธ์จากฟอร์มไปยังโมเดลของเราทันที

นี่คือสิ่งที่เราต้องการจะทำ: เราจะสร้างฟอร์มจากโมเดล `Post` ของเรา

เช่นเดียวกับทุกส่วนของ Django ฟอร์ม ก็มีไฟล์เป็นของตัวเอง คือ: `forms.py`.

เราต้องสร้างไฟล์นี้ภายในไดเรกทอรี `blog`

    blog
       └── forms.py
    

OK, let's open it in the code editor and type the following code:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

We need to import Django forms first (`from django import forms`) and our `Post` model (`from .models import Post`).

`PostForm` ใช่อย่างที่คุณสงสัยนั่นแหละ, มันคือชื่อฟอร์มของเรานั่นเอง เราต้องบอกให้ Django รู้ว่า ฟอร์มของเราคือ `ModelForm` (Django จะร่ายมนต์บางอย่างให้เรา) - `forms.ModelForm` จะเป็นผู้รับผิดชอบดังกล่าว

ถัดมา เรามี `class Meta` ที่ซึ่งเราจะบอก Django ว่าฟอร์มนี้ จะใช้โมเดลอะไร (`model = Post`).

สุดท้าย เราสามารถบอกได้ว่า เราจะใช้ฟิลด์ไหนบ้างในฟอร์มของเรา ในที่นี้ เราจะใช้แค่ `title` และ `text` เท่านั้น - `author` ควรจะเป็นคนที่ตอนนี้ login อยู่ (ก็คุณนั่นแหละ!) และ `created_date` ควรจะถูกกำหนดโดยอัตโนมัติเมื่อเราสร้างโพสต์ (เช่น ในโค้ด) ถูกป่ะ?

และนั่นแหละ! สิ้งที่เราต้องทำทั้งหมดในตอนนี้คือใช้ฟอร์มข้างใน *view* และโชว์มันในเทมเพลต

และเป็นอีกครั้งที่เราจะสร้างลิงค์ไปยังหน้าเพจ, URL, view และ เทมแพลต

## ลิงค์ไปยังหน้าเว็บด้วยฟอร์ม

It's time to open `blog/templates/blog/base.html` in the code editor. In the `div` named `page-header`, we will add a link:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Note that we want to call our new view `post_new`. The class `"glyphicon glyphicon-plus"` is provided by the bootstrap theme we are using, and will display a plus sign for us.

หลังจากเพิ่มบรรทัดนี้ ไฟล์ html ของคุณจะมีหน้าตาแบบนี้:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div class="page-header">
            <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>
        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                    {% block content %}
                    {% endblock %}
                </div>
            </div>
        </div>
    </body>
</html>
```

After saving and refreshing the page http://127.0.0.1:8000 you will see a familiar `NoReverseMatch` error. Is that the case? Good!

## URL

We open `blog/urls.py` in the code editor and add a line:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

โค้ดสุดท้ายจะมีหน้าตาแบบนี้:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path 
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
    path('post/new/', views.post_new, name='post_new'),
]
```

หลังจากโหลดหน้าเว็บ เราจะเห็น `AttributeError`, เพราะเรายังไม่มี view `post_new` นั่นเอง งั้นเรามาสร้างกันเลยดีกว่า

## post_new view

Time to open the `blog/views.py` file in the code editor and add the following lines with the rest of the `from` rows:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

และ *view* ของเรา:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

การสร้างฟอร์ม `Post` ใหม่, เราต้องเรียกใช้ `PostForm()` และส่งไปให้ template เดี๋ยวเราจะกลับไปที่ *view* แต่ตอนนี้ เรามาสร้างเทมเพลตสำหรับฟอร์มของเรากันก่อน

## เทมเพลต

We need to create a file `post_edit.html` in the `blog/templates/blog` directory, and open it in the code editor. To make a form work we need several things:

* We have to display the form. We can do that with (for example) {% raw %}`{{ form.as_p }}`{% endraw %}.
* The line above needs to be wrapped with an HTML form tag: `<form method="POST">...</form>`.
* เราจำเป็นต้องมีปุ่ม `Save` เราสามารถทำได้โดยใช้ HTML button: `<button type="submit">Save</button>`
* และสุดท้าย หลังจากเปิด tag `<form ...>` เราต้องเพิ่ม `{% raw %}{% csrf_token %}{% endraw %}` ซึ่งส่วนี้สำคัญมาก เพราะมันทำให้ฟอร์มของคุณปลอดภัยขึ้น! If you forget about this bit, Django will complain when you try to save the form:

![หน้า CSFR Forbidden](images/csrf2.png)

เอาล่ะ มาดูกันว่า HTML ใน `post_edit.html` จะมีหน้าตาเป็นยังไง:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h2>New post</h2>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

ได้เวลาโหลดหน้าใหม่อีกครั้ง! เย้! ฟอร์มของคุณปรากฎขึ้นมาแล้ว!

![ฟอร์มใหม่](images/new_form2.png)

แต่เดี๋ยวนะ! ถ้าคุณพิมพ์บางอย่างในช่อง `title` และ `text` และพยายามจะบันทึกมัน - จะเกิดอะไรขึ้นล่ะ?

ไม่มีอะไรเลย! เราได้หน้าเดิมอีกครั้งและข้อความของเราหายไป... และ ไม่มีโพสต์ใหม่เพิ่มมา ถ้างั้น มีอะไรผิดไปล่ะ?

คำตอบคือ: ไม่มีอะไรผิดหรอก เราต้องทำเพิ่มเติมเล็กน้อยใน *view*.

## บันทึกฟอร์ม

Open `blog/views.py` once again in the code editor. Currently all we have in the `post_new` view is the following:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

เมื่อเราบันทึกฟอร์ม เราจะถูกพากลับไปยัง view อันเดิม แต่ตอนนี้เรามีข้อมูลใน `request` มากขึ้น เจาะจงลงไปใน `request.POST` (ชื่อนี้ไม่เกี่ยวอะไรกับที่เรากำลังทำบล็อก "post" มันคือการบอกว่าเรากำลัง "posting" ข้อมูล) จำได้ไหมว่า ในไฟล์ HTML `<form>` มีตัวแปร `method="POST"`? ข้อมูลทั้งหมดจากฟอร์มตอนนี้คือใน `request.POST` เราไม่ควรเปลี่ยนชื่อ `POST` ไปเป็นอย่างอื่น (มีอีกหนึ่งค่าที่ใช้ได้สำหรับ `method` คือ `GET`, แต่เราไม่มีเวลาพอที่จะอธิบายความแตกต่างในตอนนี้)

So in our *view* we have two separate situations to handle: first, when we access the page for the first time and we want a blank form, and second, when we go back to the *view* with all form data we just typed. ดังนั้น เราต้องเพิ่มเงื่อนไขเหล่านี้ (เราจะใช้ `if` ในการจัดการ):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

ถึงเวลาแล้วที่จะเติมอะไรลงในจุด `[...]` If `method` is `POST` then we want to construct the `PostForm` with data from the form, right? We will do that as follows:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

สิ่งต่อไปคือการตรวจสอบว่าแบบฟอร์มถูกต้องหรือไม่ (ต้องกรอกข้อมูลทั้งหมดในฟิลด์ที่กำหนดและต้องไม่มีการส่งค่าที่ไม่ถูกต้อง) เราทำแบบนั้นโดยใช้ `form.is_valid()`

เราตรวจสอบฟอร์ม ถ้าฟอร์มถูกต้อง เราก็สามารถบันทึกได้!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

โดยทั่วไป เรามีสองสิ่งตรงนี้: เราบันทึกฟอร์มด้วย `form.save` และเราเพิ่มผู้เขียน (ซึ่งเราไม่มี `author` ในฟอร์ม `PostForm` และข้อมูลส่วนนี้นั้นจำเป็นต้องม). `commit=False` หมายถึง เราจะยังไม่บันทึกโมเดล `Post` ในตอนนี้ - เราต้องเพิ่มชื่อผู้เขียนซะก่อน ส่วนใหญ่เราจะใช้ `form.save()` โดยไม่มี `commit=False` แต่นี้กรณีนี้เราต้องใช้มัน `post.save()` จะเก็บการเปลี่ยนแปลง (เพิ่มผู้เขียน) และโพสต์ใหม่ก็จะถูกสร้าง!

Finally, it would be awesome if we could immediately go to the `post_detail` page for our newly created blog post, right? To do that we need one more import:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Add it at the very beginning of your file. And now we can say, "go to the `post_detail` page for the newly created post":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`blog. views. post_detail` คือชื่อของ view ที่เราต้องการที่จะเข้าถึง ยังจำได้ไหมที่ *view* นั้นต้องการตัวแปร `pk` ? การส่งค่านี้ไปที่ view เราจะใช้ `pk=post.pk`, โดยที่ `post` คือโพสต์ที่เราสร้างขึ้นใหม่

เอาล่ะ พูดมาเยอะแล้ว เราอยากเห็นว่าตอนนี้ *view* ทั้งหมดนั้นหน้าตาเป็นยังไงแล้วใช่มั้ย?

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

มาดูกันว่าทำงานถูกต้องไหม ไปยังหน้า http://127.0.0.1:8000/post/new/ เพิ่ม `title` และ `text` บันทึกมันซะ แล้วก็ทาด้าาาา! โพสต์ใหม่ได้ถูกเพิ่มเข้าไป และเราจะถูกพาไปยังหน้า `post_detail`!

คุณอาจจะสังเกตว่า เรามีการกำหนดวันที่เผยแพร่ก่อนที่จะบันทึกโพสต์ แต่หลังจากนี้เราจะทำปุ่ม *publish* ในบท **Django Girls Tutorial: Extensions**.

เจ๋งไปเลย!

> อย่างที่เราได้เคยใช้ใน Django admin อินเตอร์เฟส ตอนนี้ระบบคิดว่าเรายังล็อกอินอยู่ มีสถานการณ์บางอย่างที่อาจทำให้เราถูกล็อกเอ้าท์ออกจากระบบ (ปิดเบราว์เซอร์ รีสตาร์ทฐานข้อมูล ฯลฯ) ถ้าคุณพบข้อผิดพลาดหลังจากสร้างโพสต์ใหม่เพราะคุณยังไม่ได้เข้าสู่ระบบ ให้ไปยังหน้า admin http://127.0.0.1:8000/admin เพื่อเข้าสู่ระบบอีกครั้ง ตรงนี้จะแก้ไขปัญหาได้ชั่วคราว ซึ่งการแก้ปัญหานี้แบบถาวร รอคุณอยู่ในบท **การบ้าน: เพิ่มความปลอดภัยให้เว็บคุณ!** หลังจากจบบทเรียนหลักนี้แล้ว

![เข้าระบบผิดพลาด](images/post_create_error.png)

## Form validation

ตอนนี้ เราจะแสดงให้คุณได้เห็นถึงความเจ๋งของฟอร์ม Django บล็อกโพสต์ของเราต้องการข้อมูล `title` และ `text` In our `Post` model we did not say that these fields (as opposed to `published_date`) are not required, so Django, by default, expects them to be set.

ลองบันทึกฟอร์มโดยที่ไม่ใส่ข้อมูลใน `title` และ `text` คุณลองเดาซิว่าจะเกิดไรขึ้น!

![Form validation](images/form_validation2.png)

Django จะตรวจสอบความถูกต้อง ว่าข้อมูลทั้งหมดในแบบฟอร์มของเรานั้นถูกต้อง มันเจ๋งสุดๆเลยใช่ม้าา?

## การแก้ไขฟอร์ม

Now we know how to add a new post. แต่ถ้าเกิดคุณอยากแก้ไขของเดิมที่มีอยู่แล้วล่ะ? มันก็จะคล้ายๆกับที่เราเคยทำมาแหละ งั้นเรามาสร้างอะไรที่สำคัญๆกันเถอะ (ถ้ามีอะไรที่คุณไม่เข้าใจ คุณควรที่จะถามโค้ชของคุณหรือเปิดดูบทที่ผ่านๆมาที่เราได้ครอบคลุมขั้นตอนเหล่านี้ทั้งหมดไปแล้ว)

Open `blog/templates/blog/post_detail.html` in the code editor and add the line

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

ดังนั้นเทมเพลตควรจะมีหน้าตาแบบนี้:

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
        <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Open `blog/urls.py` in the code editor, and add this line:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

เราจะนำ template `blog/templates/blog/post_edit.html` มาใช้อีกครั้ง ดังนั้นสิ่งที่ขาดไปสิ่งสุดท้ายคือ *view*.

Let's open `blog/views.py` in the code editor and add this at the very end of the file:

{% filename %}blog/views.py{% endfilename %}

```python
def post_edit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```

หน้าตาเกือบจะเหมือนกับ view `post_new` ของเราเลยว่าไหม? แต่ไม่ใช่ทั้งหมด For one, we pass an extra `pk` parameter from `urls`. Next, we get the `Post` model we want to edit with `get_object_or_404(Post, pk=pk)` and then, when we create a form, we pass this post as an `instance`, both when we save the form…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

... และเมื่อเราเปิดฟอร์มขึ้นมาพร้อมกับโพสต์ที่ต้องการแก้ไข:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

เอาล่ะ เรามาทดสอบกันดูว่ามันเวิร์คมั้ย! ไปยังหน้า `post_detail` ซึ่งควรจะมีปุ่มแก้ไขที่ตำแหน่งมุมบน-ขวา:

![ปุ่มแก้ไข](images/edit_button2.png)

เมื่อคุณคลิกมัน คุณจะเห็นฟอร์มพร้อมข้อมูลของโพสต์เรา:

![การแก้ไขฟอร์ม](images/edit_form2.png)

ลองแก้ไข title หรือ text ได้ตามสะดวก แล้วเซฟมันมันด้วยล่ะ!

ยินดีด้วย! แอพของคุณใกล้จะเสร็จเข้าไปทุกทีแล้ว!

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.2/topics/forms/

## ความปลอดภัย

Being able to create new posts by clicking a link is awesome! แต่ตอนนี้ ใครก็ตามที่เข้ามายังหน้าเว็บของคุณจะสามารถเพิ่มโพสต์ใหม่ได้ และนั่นคงจะไม่ใช่สิ่งที่คุณต้องการ งั้นเรามาทำให้ปุ่มนี้มันแสดงให้เฉพาะเราที่เห็นมันได้เท่านั้น

Open `blog/templates/blog/base.html` in the code editor, find our `page-header` `div` and the anchor tag you put in there earlier. It should look like this:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

เราจะทำการเพิ่ม `{% if %}` อีกอัน เพื่อแสดงผลลัพธ์เฉพาะผู้ใช้ที่เข้าระบบแล้วเรียบร้อยที่หน้า admin ซึ่งตอนนี้ ก็คือคุณไง! เปลี่ยน tag `<a>` ให้มีหน้าตาแบบนี้:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

This `{% if %}` will cause the link to be sent to the browser only if the user requesting the page is logged in. นี่เป็นขั้นแรกในการป้องกันการสร้างโพสต์ใหม่เท่านั้น ยังมีส่วนอื่นที่เราต้องทำเพิ่มเติม เราจะอธิบายเรื่องความปลอดภัยในบทเสริมถัดไป

Remember the edit icon we just added to our detail page? We also want to add the same change there, so other people won't be able to edit existing posts.

Open `blog/templates/blog/post_detail.html` in the code editor and find this line:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

เปลี่ยนมันให้เป็นแบบนี้:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Since you're likely logged in, if you refresh the page, you won't see anything different. Load the page in a different browser or an incognito window (called "InPrivate" in Windows Edge), though, and you'll see that the link doesn't show up, and the icon doesn't display either!

## มีอีกอย่างนึง: ได้เวลาเอาขึ้นเซิร์ฟเวอร์!

มาดูกันว่า มันจะทำงานได้บน PythonAnywhere ไหม ได้เวลาเอาขึ้นแล้ว!

* อย่างแรก บันทึกโค้ดใหม่ของคุณ และส่งไปเก็บไว้ที่ Github:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* ต่อมา ในคอนโซล [PythonAnywhere Bash](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (use the menu button in the upper right of the console) and hit **Reload**. Refresh your https://subdomain.pythonanywhere.com blog to see the changes.

And that should be it. Congrats! :)