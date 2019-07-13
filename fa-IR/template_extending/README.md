# توسعه template

چیز دیگری که جنگو برای شما دارد **توسعه template** است. معنای آن چیست؟ به این معنی است که شما می‌توانید بخش هایی از یک کد HTML را در چندین صفحه مختلف از وب سایت خود استفاده کنید.

زمانی که قصد دارید از اطلاعات یا ترکیب بندی خاصی چندین بار استفاده کنید، template ها به کمک شما خواهند آمد. نیازی نیست که یک کار تکراری را برای همه فایل ها انجام دهید. و اگر قصد داشتید چیزی را تغییر دهید، لازم نیست آن تغییر را در تک تک template ها اعمال کنید. فقط یکبار کافی است!

## ساخت یک template پایه

یک template پایه، اساسی ترین template است که شما آن را در هر صفحه وب سایت خود توسعه می دهید.

اجازه دهید تا یک فایل `base.html` در مسیر `blog/templates/blog/` بسازیم:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

سپس فایل را در ویرایشگر متنی باز کنید و همه چیز را از فایل `post_list.html` داخل فایل `base.html` کپی کنید، مانند زیر:

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
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                {% for post in posts %}
                    <div class="post">
                        <div class="date">
                            {{ post.published_date }}
                        </div>
                        <h2><a href="">{{ post.title }}</a></h2>
                        <p>{{ post.text|linebreaksbr }}</p>
                    </div>
                {% endfor %}
                </div>
            </div>
        </div>
    </body>
</html>
```

سپس در فایل `base.html`, همه چیز بین `<body>` و &lt;/body&gt; را با کد زیر جایگذاری کنید:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<body>
    <div class="page-header">
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
```

{% raw %} ممکن است توجه کرده باشید که این عمل هر چیزی بین `{% for post in posts %}` و `{% endfor %}` با: {% endraw %} جایگذاری کرده است

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

ولی چرا؟ شما همین الان یک `block` ساختید! شما از تمپلیت تگ `{% block %}` برای ساخت یک ناحیه استفاده کردید، که کد HTML در آن قرار می گیرد. زمانی که تمپلیت `base.html` را در فایل تمپلیت دیگری گسترش میدهیم، کدهای HTML مذکور را داخل تگ block می نویسیم. ما نحوه انجام کار را همین الان به شما نشان خواهیم داد.

فایل `base.html` را ذخیره کنید و فایل `blog/templates/blog/post_list.html` را دوباره در ویرایشگر متنی باز کنید. {% raw %} شما قرار است همه چیز را از بالای `{% for post in posts %}` و زیر `{% endfor %}` حذف کنید. زمانی که کار گفته شده را انجام دادید، فایل بذین شکل خواهد بود:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <div class="date">
            {{ post.published_date }}
        </div>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

ما میخواهیم از این بخش template برای تمام بلاک های محتوا استفاده کنیم. زمان اضافه کردن تگ های block به این فایل رسیده است!

{% raw %} شما میخواهید که تگ block با تگ های فایل `base.html` هماهنگ باشد. هم چنین میخواهید تا این تگ تمام کدهای متعلق به بلاک محتوا را شامل شود. To do that, put everything between `{% block content %}` and `{% endblock %}`. Like this:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

Only one thing left. We need to connect these two templates together. This is what extending templates is all about! We'll do this by adding an extends tag to the beginning of the file. Like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

That's it! Save the file, and check if your website is still working properly. :)

> If you get the error `TemplateDoesNotExist`, that means that there is no `blog/base.html` file and you have `runserver` running in the console. Try to stop it (by pressing Ctrl+C – the Control and C keys together) and restart it by running a `python manage.py runserver` command.