# Шаблонне розширення

Інша хороша річ, яку має Django в своєму арсеналі це **шаблонне розширення**. Що це означає? А це означає, що ви можете використовувати одні й ті ж частини свого HTML коду для різних сторінок веб сайту.

Таким чином, вам не доведеться повторюватись у кожному файлі, коли ви захочете використати одну й ту ж інформацію/схему. І якщо ви захочете щось змінити, то не доведеться це робити в кожному шаблоні, а лише один раз!

## Створення базового шаблону

Базовий шаблон - це основний шаблон, який ви будете розширювати для кожної сторінки вашого веб сайту.

Створимо файл `base.html` в `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Відкрийте його і скопіюйте усе з `post_list.html` до файлу `base.html`, як тут:

```html
{% load staticfiles %}
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
                        <h1><a href="">{{ post.title }}</a></h1>
                        <p>{{ post.text|linebreaks }}</p>
                    </div>
                {% endfor %}
                </div>
            </div>
        </div>
    </body>
</html>
```
    

Далі для `base.html`, перепишіть усю частину для `<body>` (усе між `<body>` і `</body>`) на наступне:

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
    

В основному ми замінили усе між `{% for post in posts %}{% endfor %}` на:

```html
{% block content %}
{% endblock %}
```
    

Що це означає? Ви щойно створили блок - `block`, котрий є шаблонним тегом, що дозволяє вам вставляти в нього HTML в інших шаблонах, які розширюють `base.html`. Скоро ми покажемо вам як це зробити.

А тепер збережіть зміни і відкрийте знову свій `blog/templates/blog/post_list.html`. Видаліть усе інше, що міститься всередині блоку body і потім також видаліть `<div class="page-header"></div>`, таким чином файл виглядатиме так:

```html
{% for post in posts %}
    <div class="post">
        <div class="date">
            {{ post.published_date }}
        </div>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaks }}</p>
    </div>
{% endfor %}
```
    

А тепер додайте цей рядок на початок файлу:

```html
{% extends 'blog/base.html' %}
```
    

Це означає, що ми розширюємо шаблон `base.html` у файлі `post_list.html`. Залишився лише один момент: розмістіть усе (окрім щойно доданого рядку) між `{% block content %}` та `{% endblock content %}`. Як тут:

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaks }}</p>
        </div>
    {% endfor %}
{% endblock content %}
```
    

Ось і все! Перевірте чи ваш сайт все ще працює коректно :)

> Якщо з'явилася помилка `TemplateDoesNotExists`, то це говорить про те, що файлу `blog/base.html` не існує і ви маєте в консолі активований `runserver`, спробуйте зупинити його (натиснувши Ctrl+C - кнопки Control і C buttons разом) і перезавантажити запустивши команду `python manage.py runserver`.
