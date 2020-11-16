# فرم در جنگو

آخرین چیزی که می‌خواهیم در وب سایت مان انجام دهیم ایجاد یک راه خوب برای اضافه کردن و ویرایش پست‌های وبلاگ است. `ادمین ` جنگو خوب است، اما سخت است که آن را زیبا یا سفارشی کنیم. با ` فرم‌ها ` ما کنترل کاملی بر روی صفحه خود داریم. تقریباً می‌توانیم هرکاری که بخواهیم انجام دهیم!

ویژگی فرم‌ها در جنگو این است که ما می‌توانیم یکی را از ابتدا تعریف کنیم یا از `ModelForm`استفاده کنیم که نتیجه فرم را به صورت مدل ذخیره می‌کند.

این دقیقا همان چیزی است که ما می‌خواهیم انجام دهیم: ما یک فرم را برای مدل ` Post` ایجاد خواهیم کرد.

مانند هر بخش مهمی از جنگو، فرم‌ها فایل خود را دارند: ` forms.py`.

ما باید یک فایل با این نام در پوشه ` blog` ایجاد کنیم.

    blog
       └── forms.py
    

خوب، اجازه دهید آن را در ویرایشگر کد باز کنیم و خطوط زیر را تایپ کنیم:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

باید در ابتدا فرم‌های جنگو را فراخوانی کنیم (`from django import forms`) سپس مدل مربوط به `Post` را نیز فراخوانی کنیم(`from .models import Post`).

` PostForm`، همانطور که احتمالاً حدس زده اید، نام فرم ما است. ما باید به جنگو بگوییم که این فرم یک نوع `ModelForm` است (بنابراین جنگو برای ما چند کار جادویی انجام خواهد داد) - `forms.ModelForm` مسئول انجام این کارها است.

بعد از این، ما `class Meta` را داریم، جایی که به جنگو می‌گویم که کدام مدل باید برای ایجاد این فرم (`model = Post`) استفاده شود.

در نهایت می‌توانیم بگوییم که کدام بخش‌ (بخش‌ها) باید در فرم ما باشد. در این سناریو ما تنها `title` و `text` را می‌خواهیم نشان دهیم - `author` باید فردی باشد که در حال حاضر وارد شده است (شما!) و `created_date` تاریخ ایجاد یک پست جدید است که باید به طور خودکار تنظیم شود، درست است؟

و همین! تمام مواردی که اکنون باید انجام دهیم، استفاده از فرم در یک *view* و نمایش آن در تمپلیت است.

بنابراین یک بار دیگر یک لینک، یک URL، یک view و یک تمپلیت ایجاد خواهیم کرد.

## لینک به یک صفحه با فرم

وقت آن است که فایل `blog/templates/blog/base.html` را در ویرایشگر کد باز کنید. در `div` که نام آن `page-header` است، یک لینک اضافه می‌کنیم:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

توجه داشته باشید که ما می‌خواهیم نام ویو جدیدمان`post_new`باشد. کلاس `"glyphicon glyphicon-plus"` که توسط تم بوت‌استرپ استفاده می‌شود علامت پلاس را برای ما نمایش می‌دهد.

پس از اضافه کردن خط، فایل HTML شما باید اینگونه باشد:

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

پس از ذخیره و بازخوانی صفحه http://127.0.0.1:8000 شما با یک خطای شناخته شده `NoReverseMatch` مواجه خواهید شد، درست است؟ بسیار عالی!

## آدرس اینترنتی

فایل `blog/urls.py` را باز کنید و خط زیر را به آن اضافه کنید:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

و کد نهایی مانند این خواهد بود:

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

پس از بازخوانی سایت، ما یک خطای `AttributeError` را مشاهده می‌کنیم، زیرا ما ویو `post_new` را به کار نبرده‌ایم. بگذارید آن را اضافه کنیم.

## ویو post_new

زمان آن است که فایل `blog/views.py` را در ویرایشگر کد بازکنید و خطوط زیر را در ردیف `from` ها اضافه کنید:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

و حالا *view* ما:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

برای ایجاد یک فرم جدید`Post`، ما باید`()PostForm` را فراخوانی کنیم و آن را به تمپلیت منتقل کنیم. ما به این *view* باز خواهیم گشت، اما در حال حاضر، بیایید به سرعت یک تمپلیت برای این فرم ایجاد کنیم.

## تمپلیت

لازم است یک فایل به نام `post_edit.html`در پوشه `blog/templates/blog`بسازیم و آن را در ویرایشگر کد بازکنیم. برای آنکه یک فرم کار کند به چند چیز نیاز داریم:

* ما باید فرم را نمایش دهیم. مثلاً می‌توانیم این کار را با {% raw %}`{{ form.as_p }}`{% endraw %} انجام دهیم.
* خط بالا باید درون تگ فرم HTML پیچیده شود: `<form method="POST">... </form>`.
* ما به یک دکمه `ذخیره کردن` نیاز داریم. این کار را با یک دکمه HTML انجام می‌دهیم: `<button type="submit">Save</button>`.
* و در نهایت، درست بعد از باز شدن تگ `<form ...>` باید {% raw %}`{% csrf_token %}`{% endraw %} را اضافه کنیم. نوشتن این عبارت بسیار مهم است، زیرا فرم‌های شما را امن می‌کند! اگر شما این تکه را فراموش کنید، جنگو هنگام تلاش برای ذخیره کردن فرم پیغام خطا می‌دهد:

![صفحه خطا CSRF](images/csrf2.png)

خوب، بگذار ببینیم HTML در فایل `post_edit.html` چطور باید باشد:

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

حالا زمان به روزرسانی پروژه است! بله فرم شما نمایش داده می‌شود!

![فرم جدید](images/new_form2.png)

اما یک دقیقه صبر کنید وقتی چیزی را در فیلدهای `title` و `text` تایپ کنید و سعی کنید آن را ذخیره کنید، چه اتفاقی خواهد افتاد؟

هیچ چی! ما یک بار دیگر در همان صفحه هستیم و متن ما رفته است... و هیچ پست جدیدی اضافه نشده است. پس چه اتفاقی افتاد؟

جواب این است: هیچ چیز. ما باید در *view* خودمان کمی کارهای بیشتری انجام دهیم.

## ذخیره فرم

یکبار دیگر فایل `blog/views.py` را در ویرایشگر کد باز کنید. در حال حاضر آنچه که در `post_new` داریم این هاست:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

هنگامی که فرم را ارسال می‌کنیم، ما به همان ویوی قبل باز می‌گردیم، اما این بار ما در `request` داده‌های بیشتری داریم، به ویژه در `request.POST` (نامگذاری request.POST هیچ ارتباطی با "پست" وبلاگ ندارد و به معنی آن است که ما در حال ارسال اطلاعات هستیم). به یاد می آورید که چگونه در فایل HTML، تعریف `<form>` دارای متغیر `method="POST"` بود؟ تمام فیلدهای فرم اکنون در `request.POST` قرار دارند. شما نباید عبارت `POST` را در اینجا به چیز دیگری تغییر دهید (تنها مقدار معتبر دیگر برای `method` مقدار `GET` است، اما الان وقت آن را نداریم تا تفاوت آن‌ها را توضیح دهیم).

بنابراین در *view*، ما دو موقعیت جداگانه برای رسیدگی داریم: اول اینکه زمانی که ما برای اولین بار به صفحه می‌رویم و یک فرم خالی را می‌خواهیم، و دوم، وقتی با اطلاعات نوشته شده درون فرم، به *view* برمی‌گردیم. بنابراین ما نیاز به اضافه کردن یک شرط داریم (ما از `if`برای این منظور استفاده می‌کنیم):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

وقت آن است که نقاط `[...]` را پر کنید. اگر مقدار `method` برابر با `POST` باشد، ما می خواهیم که با اطلاعات درون فرم `PostForm` را بسازیم، درست است؟ ما این کار را به صورت زیر انجام خواهیم داد:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

قدم بعدی این است که بررسی کنید که آیا فرم صحیح است (تمام فیلدهای لازم تنظیم شده و مقادیر نادرست وارد نشده است). ما این کار را با `form.is_valid()` انجام می‌دهیم.

ما بررسی می کنیم که آیا فرم معتبر است و اگر چنین باشد، می توانیم آن را ذخیره کنیم!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

اساساً، ما دو چیز در اینجا داریم: فرم را با `form.save` ذخیره می‌کنیم سپس یک نویسنده برای مطلب تعیین می‌کنیم (از آنجا که فیلد `author` در فرم موجود نبوده و داشتن نویسنده برای مطلب در `PostForm`الزامی است). `commit=False` بدین معنی است که ما نمی‌خواهیم مدل `Post` را ذخیره کنیم - ما می‌خواهیم ابتدا نویسنده را اضافه کنیم. در بیشتر موارد شما از `()form.save` بدون `commit=False` استفاده می‌کنید، اما در این مورد، ما باید آن را استفاده کنیم. `()post.save` تغییرات (اضافه کردن نویسنده) را اعمال می‌کند و یک پست جدید بلاگ ایجاد می‌شود!

سرانجام، خوب بود اگر می‌توانستیم بلافاصله به صفحه جزییات پست جدید `post_detail` که هم اکنون ساخته‌ایم برویم، درست است؟ برای این کار ما نیاز به فراخوانی دیگری داریم:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

آن را در ابتدای فایل خود اضافه کنید. و اکنون می‌توان گفت، "به صفحه جزییات پست `post_detail` برای پست جدید برو":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` نام ویویی است که ما می‌خواهیم به آن برویم. به یاد دارید که این *view* نیاز به متغیر `pk` دارد؟ برای فرستادن آن به ویو، از `pk=post.pk` استفاده می‌کنیم، که در آن `post` جدیدترین پست وبلاگ است!

خوب، ما خیلی صحبت کرده‌ایم، اما احتمالاً می‌خواهید ببینید که کل *view* چگونه به نظر می‌رسد، درست است؟

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

بیایید ببینیم که آیا کار می‌کند. به صفحه http://127.0.0.1:8000/post/new/ بروید، یک `title` و یک `text` اضافه کنید و نتیجه را ببینید! پست جدید وبلاگ اضافه شده است و ما به صفحه `post_detail` هدایت می‌شویم!

ممکن است متوجه شده باشید که قبل از ذخیره پست، تاریخ انتشار را تنظیم کرده‌ایم. بعدها، ما دکمه *publish button* را در بخش **Django Girls Tutorial: Extensions** معرفی می‌کنیم.

این عالیه!

> همانطور که اخیراً رابط کاربری ادمین جنگجو را استفاده کردیم، سیستم در حال حاضر فکر می‌کند ما هنوز در سیستم لاگین هستیم. چند موقعیت وجود دارد که می تواند منجر به خروج ما از رابط کاربری مدیریت شود (بسته شدن مرورگر، راه اندازی مجدد دیتابیس و غیره). اگر در هنگام ایجاد یک پست متوجه شدید که خطایی در رابطه با عدم وجود یک کاربر ایجاد شده است، به صفحه مدیریت http://127.0.0.1:8000/admin بروید و دوباره وارد شوید. این مسأله به طور موقت حل خواهد شد. یک تکلیف اضافه برای خانه که بعد از بخش اصلی آموزش، انتظار شما را می‌کشد رفع مشکلات امنیتی وبسایت در بخش **Homework: add security to your website!** است.

![خطا ورود به سیستم](images/post_create_error.png)

## اعتبارسنجی فرم

حالا به شما نشان می‌دهیم که فرم‌ها در جنگو چقدر جالب هستند. یک پست وبلاگ باید فیلدهای `title` و `text` را داشته باشد. در مدل `Post` ما نگفتیم که این فیلدها (به غیر از `published_date`) الزامی نیستند، بنابراین، جنگو به طور پیش فرض آن‌ها را الزامی می‌داند.

سعی کنید فرم را بدون `title` و `text` ذخیره کنید. حدس بزنید چه اتفاقی خواهد افتاد!

![اعتبارسنجی فرم](images/form_validation2.png)

جنگو مواظب است که تمام فیلدهای موجود در فرم ما صحیح پر شده باشند. فوق‌العاده نیست؟

## ويرايش فرم

حالا ما می‌دانیم که چگونه یک پست جدید اضافه کنیم. اما اگر بخواهیم یک فرم موجود را ویرایش کنیم، چه؟ این کار بسیار شبیه آنچه ما انجام داده‌یم است. بگذارید برخی از چیزهای مهم را سریع بسازیم. (اگر چیزی را درک نمی‌کنید، باید از مربی خود بپرسید یا در فصل‌های قبلی نگاه کنید، زیرا ما قبلاً همه این مراحل را پوشش دادیم.)

فایل `blog/templates/blog/post_detail.html` را در ویرایشگر کد بازکنید و خط زیر را به آن اضافه کنید

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

قالب فوق شبیه به این خواهد شد:

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

فایل `blog/urls.py` را باز کنید و خط زیر را به آن اضافه کنید:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

ما از این تمپلیت `blog/templates/blog/post_edit.html` مجدداً استفاده خواهیم کرد پس تنها قطعه باقی مانده *view* است.

فایل `blog/views.py` را باز کنید و خط زیر را به آن اضافه کنید:

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

این ویو شبیه ویوی `post_new` ماست، درست است؟ اما نه دقیقاً. در ابتدا ما یک پارامتر `pk` اضافی از `urls` ارسال کرده‌ایم. سپس مدل `Post` را که می‌خواهیم اصلاح کنیم با دستور `get_object_or_404(Post, pk=pk)` می‌گیریم و بعد از آن یک فرم می‌سازیم و این فرم را به صورت `instance`ارسال می‌کنیم، هر دو این کارها وقتی اتفاق می‌افتد که فرم را ذخیره می‌کنیم…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

… و هنگامی که یک فرم را به این صورت برای تغییر دادن باز می‌کنیم:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

بسیار خوب، حالا بیایید امتحان کنیم که آیا کار می‌کند! به صفحه `post_detail` بروید. باید یک کلید edit در گوشه سمت راست بالا باشد:

![کلید Edit](images/edit_button2.png)

وقتی بر روی آن کلیک کنید یک فرم که با اطلاعات پست وبلاگی ما پر شده است نشان داده می‌شود:

![فرم Edit](images/edit_form2.png)

به راحتی محتوای پست را تغییر دهید و آن را ذخیره کنید!

تبریک! برنامه شما کامل و کامل‌تر می‌شود!

اگر اطلاعات بیشتری در مورد فر‌م‌ها در جنگو نیاز دارید، باید مستندات جنگو را مطالعه کنید: https://docs.djangoproject.com/en/2.2/topics/forms/

## امنیت

ساختن یک پست جدید فقط با یک کلیک، بسیار فوق العاده است! اما همین الان هرکسی که از صفحه شما بازدید می‌کند می‌تواند به راحتی یک پست جدید بسازد و این احتمالاً چیزی نیست که شما بخواهید. حالا بیایید کاری کنیم که این دکمه فقط برای شما نشان داده شود و کس دیگری آن را نبیند.

فایل `blog/templates/blog/base.html` را در ویرایشگر کد باز کنید بخش `div` با نام `page-header` را پیدا کنید. باید چیزی شبیه به این باشد:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

حالا ما می‌خواهیم یک تگ `{% if %}` دیگر به این اضافه کنیم که باعث خواهد شد این لینک فقط برای کاربری نشان داده شود که به عنوان ادمین وارد شده باشد که در حال حاضر فقط شما هستید! تگ `<a>` را به شکل زیر تغییر دهید:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

تگ `{% if %}` باعث خواهد شد که لینک فقط در صورتی به مرورگر ارسال شود که کاربر درخواست کننده صفحه، با حساب کاربری ادمین وارد شده باشد. این کار به طور کامل ساختن پست جدید را محافظت نمی‌کند اما قدم اولیه‌ی خوبی است. مباحث بیشتری از امنیت را در بخش‌های اضافه آموزش پوشش خواهیم داد.

کلید edit را که به صفحه جزییات یک پست اضافه کردیم به یاد دارید؟ حالا همین کار را برای آن صفحه نیز می‌خواهیم انجام دهیم تا دیگران قادر به تغییر محتوای یک پست نباشند.

فایل `blog/templates/blog/post_detail.html` را باز کنید و خط زیر را پیدا کنید:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

آن را به شکل زیر تغییر دهید:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

از آنجا که احتمالاً هنوز به عنوان ادمین در سیستم لاگین کرده‌اید، اگر صفحه را دوباره بازخوانی کنید، تغییر خاصی را نمی‌بینید. صفحه را در یک مرورگر دیگر یا یک پنجره ناشناس incognito window (در Windows Edge به آن "InPrivate" می‌گویند) بارگذاری کنید. خواهید دید که لینک و آیکون اصلاح پست، نمایش داده نمی‌شود!

## یک چیز دیگر: زمان دیپلوی است!

بیایید ببینیم آیا همه این تغییرات در PythonAnywhere کار می‌کند. وقت یک دیپلوی کردن دیگر است!

* ابتدا کد جدید را کامیت کنید و آن را به GitHub بفرستید:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* سپس در کنسول [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/) تایپ کنید:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(یادتان باشد که `<your-pythonanywhere-domain>` را با زیر دامنه اصلی خود در PythonAnywhere عوض کنید البته بدون آکولادها.)

* در نهایت به صفحه ["Web" page](https://www.pythonanywhere.com/web_app_setup/) بروید (از کلید منو در بالا و سمت راست کنسول استفاده کنید) و کلید **Reload** را بزنید. آدرس وبلاگ خودتان https://subdomain.pythonanywhere.com را باز کنید تا تغییرات را ببینید.

And that should be it. Congrats! :)