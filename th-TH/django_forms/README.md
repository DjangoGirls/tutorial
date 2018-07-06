# Django Form

สิ่งสุดท้ายที่เราต้องการทำในเว็บไซต์ของเราคือการสร้างส่วนที่เอาไว้แก้ไขบล็อกโพสต์ของเรา หน้า Django `admin` นั้น ก็เจ๋งดีอยู่หรอกนะ แต่ก็ปรับแต่งได้ค่อนข้างยากอยู่เหมือนกัน With `forms` we will have absolute power over our interface – we can do almost anything we can imagine!

สิ่งที่ดีอย่างหนึ่งของ Django form คือ เราสามารถเริ่มสร้างจากศูนย์เลย หรือสร้าง `ModelForm` ซึ่งจะบันทึกผลลัพธ์จากฟอร์มไปยังโมเดลของเราทันที

นี่คือสิ่งที่เราต้องการจะทำ: เราจะสร้างฟอร์มจากโมเดล `Post` ของเรา

เช่นเดียวกับทุกส่วนของ Django ฟอร์ม ก็มีไฟล์เป็นของตัวเอง คือ: `forms.py`.

เราต้องสร้างไฟล์นี้ภายในไดเรกทอรี `blog`

    blog
       └── forms.py
    

เอาล่ะ เรามาเปิดไฟล์และพิมพ์โค้ดเหล่านี้ลงไปกันเถอะ:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

ก่อนอื่น เราต้องอิมพอร์ท Django form ซะก่อน (`from django import forms`) และแน่นอน โมเดล `Post` ของเรา (`form .models import Post`)

`PostForm` ใช่อย่างที่คุณสงสัยนั่นแหละ, มันคือชื่อฟอร์มของเรานั่นเอง เราต้องบอกให้ Django รู้ว่า ฟอร์มของเราคือ `ModelForm` (Django จะร่ายมนต์บางอย่างให้เรา) - `forms.ModelForm` จะเป็นผู้รับผิดชอบดังกล่าว

ถัดมา เรามี `class Meta` ที่ซึ่งเราจะบอก Django ว่าฟอร์มนี้ จะใช้โมเดลอะไร (`model = Post`).

สุดท้าย เราสามารถบอกได้ว่า เราจะใช้ฟิลด์ไหนบ้างในฟอร์มของเรา ในที่นี้ เราจะใช้แค่ `title` และ `text` เท่านั้น - `author` ควรจะเป็นคนที่ตอนนี้ login อยู่ (ก็คุณนั่นแหละ!) และ `created_date` ควรจะถูกกำหนดโดยอัตโนมัติเมื่อเราสร้างโพสต์ (เช่น ในโค้ด) ถูกป่ะ?

และนั่นแหละ! สิ้งที่เราต้องทำทั้งหมดในตอนนี้คือใช้ฟอร์มข้างใน *view* และโชว์มันในเทมเพลต

So once again we will create a link to the page, a URL, a view and a template.

## ลิงค์ไปยังหน้าเว็บด้วยฟอร์ม

ได้เวลาเปิดไฟล์ `blog/templates/blog/base.html` เราจะเพิ่มลิงค์ใน `div` ชื่อ `page-header`:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Note that we want to call our new view `post_new`. The class `"glyphicon glyphicon-plus"` is provided by the bootstrap theme we are using, and will display a plus sign for us.

After adding the line, your HTML file should now look like this:

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

หลังจากบันทึกไฟล์ และโหลดหน้าเว็บ http://127.0.0.1:8000 อีกครั้ง คุณจะเจอกับข้อผิดพลาด `NoReverseMatch`, คุ้นๆ ไหม?

## URL

เปิดไฟล์ `blog/urls.py` และเพิ่มบรรทัดนี้:

{% filename %}blog/urls.py{% endfilename %}

```python
url(r'^post/new/$', views.post_new, name='post_new'),
```

โค้ดสุดท้ายจะมีหน้าตาแบบนี้:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
    url(r'^post/new/$', views.post_new, name='post_new'),
]
```

หลังจากโหลดหน้าเว็บ เราจะเห็น `AttributeError`, เพราะเรายังไม่มี view `post_new` นั่นเอง งั้นเรามาสร้างกันเลยดีกว่า

## post_new view

ได้เวลาเปิดไฟล์ `blog/views.py` และเพิ่มบรรทัดเหล่านี้ลงไปพร้อมกับ `form`:

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

การสร้างฟอร์ม `Post` ใหม่, เราต้องเรียกใช้ `PostForm()` และส่งไปให้ template We will go back to this *view*, but for now, let's quickly create a template for the form.

## เทมเพลต

เราต้องสร้างไฟล์ `post_edit.html` ในไดเรกทอรี `blog/templates/blog`, ในการสร้างฟอร์มนั้น เราต้องการสองสามอย่าง:

* We have to display the form. We can do that with (for example) {% raw %}`{{ form.as_p }}`{% endraw %}.
* The line above needs to be wrapped with an HTML form tag: `<form method="POST">...</form>`.
* We need a `Save` button. We do that with an HTML button: `<button type="submit">Save</button>`.
* And finally, just after the opening `<form ...>` tag we need to add {% raw %}`{% csrf_token %}`{% endraw %}. ซึ่งส่วนี้สำคัญมาก เพราะมันทำให้ฟอร์มของคุณปลอดภัยขึ้น! If you forget about this bit, Django will complain when you try to save the form:

![หน้า CSFR Forbidden](images/csrf2.png)

OK, so let's see how the HTML in `post_edit.html` should look:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h1>New post</h1>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

ได้เวลาโหลดหน้าใหม่อีกครั้ง! เย้! ฟอร์มของคุณปรากฎขึ้นมาแล้ว!

![ฟอร์มใหม่](images/new_form2.png)

But, wait a minute! When you type something in the `title` and `text` fields and try to save it, what will happen?

Nothing! We are once again on the same page and our text is gone… and no new post is added. So what went wrong?

คำตอบคือ: ไม่มีอะไรผิดหรอก เราต้องทำเพิ่มเติมเล็กน้อยใน *view*.

## บันทึกฟอร์ม

Open `blog/views.py` once again. Currently all we have in the `post_new` view is the following:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

When we submit the form, we are brought back to the same view, but this time we have some more data in `request`, more specifically in `request.POST` (the naming has nothing to do with a blog "post"; it's to do with the fact that we're "posting" data). Remember how in the HTML file, our `<form>` definition had the variable `method="POST"`? ข้อมูลทั้งหมดจากฟอร์มตอนนี้คือใน `request.POST` เราไม่ควรเปลี่ยนชื่อ `POST` ไปเป็นอย่างอื่น (มีอีกหนึ่งค่าที่ใช้ได้สำหรับ `method` คือ `GET`, แต่เราไม่มีเวลาพอที่จะอธิบายความแตกต่างในตอนนี้)

So in our *view* we have two separate situations to handle: first, when we access the page for the first time and we want a blank form, and second, when we go back to the *view* with all form data we just typed. ดังนั้น เราต้องเพิ่มเงื่อนไขเหล่านี้ (เราจะใช้ `if` ในการจัดการ):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

It's time to fill in the dots `[...]`. If `method` is `POST` then we want to construct the `PostForm` with data from the form, right? We will do that as follows:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

The next thing is to check if the form is correct (all required fields are set and no incorrect values have been submitted). We do that with `form.is_valid()`.

เราตรวจสอบฟอร์ม ถ้าฟอร์มถูกต้อง เราก็สามารถบันทึกได้!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

โดยทั่วไป เรามีสองสิ่งตรงนี้: เราบันทึกฟอร์มด้วย `form.save` และเราเพิ่มผู้เขียน (ซึ่งเราไม่มี `author` ในฟอร์ม `PostForm` และข้อมูลส่วนนี้นั้นจำเป็นต้องม). `commit=False` means that we don't want to save the `Post` model yet – we want to add the author first. Most of the time you will use `form.save()` without `commit=False`, but in this case, we need to supply it. `post.save()` will preserve changes (adding the author) and a new blog post is created!

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

`blog. views. post_detail` คือชื่อของ view ที่เราต้องการที่จะเข้าถึง ยังจำได้ไหมที่ *view* นั้นต้องการตัวแปร `pk` ? To pass it to the views, we use `pk=post.pk`, where `post` is the newly created blog post!

OK, we've talked a lot, but we probably want to see what the whole *view* looks like now, right?

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

มาดูกันว่าทำงานถูกต้องไหม Go to the page http://127.0.0.1:8000/post/new/, add a `title` and `text`, save it… and voilà! The new blog post is added and we are redirected to the `post_detail` page!

You might have noticed that we are setting the publish date before saving the post. Later on, we will introduce a *publish button* in **Django Girls Tutorial: Extensions**.

เจ๋งไปเลย!

> As we have recently used the Django admin interface, the system currently thinks we are still logged in. There are a few situations that could lead to us being logged out (closing the browser, restarting the DB, etc.). If, when creating a post, you find that you are getting errors referring to the lack of a logged-in user, head to the admin page http://127.0.0.1:8000/admin and log in again. ตรงนี้จะแก้ไขปัญหาได้ชั่วคราว ซึ่งการแก้ปัญหานี้แบบถาวร รอคุณอยู่ในบท **การบ้าน: เพิ่มความปลอดภัยให้เว็บคุณ!** หลังจากจบบทเรียนหลักนี้แล้ว

![เข้าระบบผิดพลาด](images/post_create_error.png)

## Form validation

ตอนนี้ เราจะแสดงให้คุณได้เห็นถึงความเจ๋งของฟอร์ม Django บล็อกโพสต์ของเราต้องการข้อมูล `title` และ `text` In our `Post` model we did not say that these fields (as opposed to `published_date`) are not required, so Django, by default, expects them to be set.

Try to save the form without `title` and `text`. Guess what will happen!

![Form validation](images/form_validation2.png)

Django is taking care to validate that all the fields in our form are correct. Isn't it awesome?

## การแก้ไขฟอร์ม

ตอนนี้คุณทราบวิธีเพิ่มฟอร์มใหม่แล้ว แต่ถ้าเกิดคุณยังแก้ไขของเดิมที่มีอยู่แล้วล่ะ? This is very similar to what we just did. Let's create some important things quickly. (If you don't understand something, you should ask your coach or look at the previous chapters, since we covered all these steps already.)

เปิดไฟล์ `blog/templates/blog/post_detail.html` และเพิ่มบรรทัดนี้ลงไป

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
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

เปิดไฟล์ `blog/urls.py` และเพิ่มบรรทัดนี้:

{% filename %}blog/urls.py{% endfilename %}

```python
    url(r'^post/(?P<pk>\d+)/edit/$', views.post_edit, name='post_edit'),
```

เราจะนำ template `blog/templates/blog/post_edit.html` มาใช้อีกครั้ง ดังนั้นสิ่งที่ขาดไปสิ่งสุดท้ายคือ *view*.

Let's open `blog/views.py` and add this at the very end of the file:

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

หน้าตาเกือบจะเหมือนกับ view `post_new` ของเราเลยว่าไหม? แต่ไม่ใช่ทั้งหมด For one, we pass an extra `pk` parameter from urls. Next, we get the `Post` model we want to edit with `get_object_or_404(Post, pk=pk)` and then, when we create a form, we pass this post as an `instance`, both when we save the form…

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

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/1.11/topics/forms/

## ความปลอดภัย

การสร้างโพสต์ใหม่โดยแค่คลิกที่ลิงค์นั้น มันสุดยอดมาก! But right now, anyone who visits your site will be able to make a new blog post, and that's probably not something you want. Let's make it so the button shows up for you but not for anyone else.

ในไฟล์ `blog/templates/blog/base.html` ตรงส่วน `page-header` `div` ควรมีหน้าตาแบบนี้:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

We're going to add another `{% if %}` tag to this, which will make the link show up only for users who are logged into the admin. Right now, that's just you! เปลี่ยน tag `<a>` ให้มีหน้าตาแบบนี้:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

This `{% if %}` will cause the link to be sent to the browser only if the user requesting the page is logged in. นี่เป็นขั้นแรกในการป้องกันการสร้างโพสต์ใหม่เท่านั้น ยังมีส่วนอื่นที่เราต้องทำเพิ่มเติม เราจะอธิบายเรื่องความปลอดภัยในบทเสริมถัดไป

Remember the edit icon we just added to our detail page? We also want to add the same change there, so other people won't be able to edit existing posts.

Open `blog/templates/blog/post_detail.html` and find this line:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Change it to this:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Since you're likely logged in, if you refresh the page, you won't see anything different. Load the page in a different browser or an incognito window (called "InPrivate" in Windows Edge), though, and you'll see that the link doesn't show up, and the icon doesn't display either!

## มีอีกอย่างนึง: ได้เวลาเอาขึ้นเซิร์ฟเวอร์!

มาดูกันว่า มันจะทำงานได้บน PythonAnywhere ไหม ได้เวลาเอาขึ้นแล้ว!

* First, commit your new code, and push it up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* ต่อมา ในคอนโซล [PythonAnywhere Bash](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(โปรดจำไว้ว่าให้ใช้ `<your-pythonanywhere-username>` แทน username PythonAnywhere ที่แท้จริงของคุณโดยไม่ใช้วงเล็บปีกกา)

* สุดท้าย เปิด [Web tab](https://www.pythonanywhere.com/web_app_setup/) และกด **Reload**.

และนั่นควรเสร็จแล้ว! ยินดีด้วยนะ :)