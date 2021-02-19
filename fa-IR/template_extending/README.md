# توسعه template

چیز دیگری که جنگو برای شما دارد **توسعه template** است. معنای آن چیست؟ به این معنی است که شما می‌توانید بخش‌هایی از یک کد HTML را در چندین صفحه مختلف از وب سایت خود استفاده کنید.

زمانی که قصد دارید از اطلاعات یا ترکیب بندی خاصی چندین بار استفاده کنید، template ها به کمک شما خواهند آمد. نیازی نیست که یک کار تکراری را برای همه فایل ها انجام دهید. و اگر قصد داشتید چیزی را تغییر دهید، لازم نیست آن تغییر را در تک تک template ها اعمال کنید. فقط یکبار کافی است!

## ساخت یک template پایه

یک template پایه، اساسی ترین template است که شما آن را در هر صفحه وب سایت خود توسعه می‌دهید.

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
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <header class="page-header">
          <div class="container">
              <h1><a href="/">Django Girls Blog</a></h1>
          </div>
        </header>

        <main class="container">
            <div class="row">
                <div class="col">
                {% for post in posts %}
                    <article class="post">
                        <time class="date">
                            {{ post.published_date }}
                        </time>
                        <h2><a href="">{{ post.title }}</a></h2>
                        <p>{{ post.text|linebreaksbr }}</p>
                    </article>
                {% endfor %}
                </div>
            </div>
        </main>
    </body>
</html>
```

سپس در فایل `base.html`, همه محتویات تگ `<body>` (همه چیز بین `<body>` و `</body>`) را با کد زیر عوض کنید:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<body>
    <header class="page-header">
      <div class="container">
          <h1><a href="/">Django Girls Blog</a></h1>
      </div>
    </header>
    <main class="container">
        <div class="row">
            <div class="col">
            {% block content %}
            {% endblock %}
            </div>
        </div>
    </main>
</body>
```

{% raw %} ممکن است توجه کرده باشید که این عمل هر چیزی بین `{% for post in posts %}` و `{% endfor %}` را با کد زیر عوض کرده است: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

ولی چرا؟ شما همین الان یک `block` ساختید! شما از تمپلیت تگ `{% block %}` برای ساخت یک ناحیه استفاده کردید، که کد HTML در آن قرار می‌گیرد. زمانی که تمپلیت `base.html` را در فایل تمپلیت دیگری گسترش می‌دهیم، کدهای HTML مذکور را داخل تگ block می‌نویسیم. ما نحوه انجام کار را همین الان به شما نشان خواهیم داد.

فایل `base.html` را ذخیره کنید و فایل `blog/templates/blog/post_list.html` را دوباره در ویرایشگر متنی باز کنید. {% raw %} شما قرار است همه چیز را از بالای `{% for post in posts %}` و زیر `{% endfor %}` حذف کنید. زمانی که کار گفته شده را انجام دادید، فایل به این شکل خواهد بود:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <article class="post">
        <time class="date">
            {{ post.published_date }}
        </time>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endfor %}
```

ما می‌خواهیم از این بخش template برای تمام بلاک‌های محتوا استفاده کنیم. زمان اضافه کردن تگ‌های block به این فایل رسیده‌است!

{% raw %} شما می‌خواهید که تگ block با تگ‌های فایل `base.html` هماهنگ باشد. هم چنین می‌خواهید تا این تگ تمام کدهای متعلق به بلاک محتوا را شامل شود. برای انجام این کار، همه چیز را بین `{% block content %}` و `{% endblock %}` قرار دهید. به این صورت:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
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

تنها یک کار باقی مانده. ما باید این دو template را به یکدیگر متصل کنیم. هدفمان از گسترش template همین است! با اضافه کردن تگ extends در ابتدای فایل، این کار را انجام می‌دهیم. مانند زیر:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

همین است! فایل را ذخیره کنید، و چک کنید که آیا وب‌سایت شما هنوز به درستی کار می‌کند. :)

> اگر خطای`TemplateDoesNotExist` را دریافت کردید، به معنای آن است که فایل `blog/base.html` وجود ندارد و دستور `runserver` در کنسول خط فرمان در حال اجرا است. سعی کنید دستور را متوقف کنید (با زدن Ctrl+C - کلید Control و کلید C به صورت همزمان) و وب سرور را دوباره با دستور `python manage.py runserver` راه اندازی کنید.