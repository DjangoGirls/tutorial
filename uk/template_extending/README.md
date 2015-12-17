# Розширення шаблону

Інша хороша річ, яку має Django в своєму арсеналі - це __розширення шаблону__. Що це означає? Це значить, що ви можете використовувати одні й ті ж частини свого HTML коду для різних сторінок веб-сайту.

Шаблони допомогають у випадку, коли ви хочете використати однакову інформацію/схему. Вам не потрібно повторюватись в кожному файлі. І якщо ви захочете щось змінити, то не доведеться це робити в кожному шаблоні, а лише один раз!

## Створення базового шаблону

Базовий шаблон - це основний шаблон, який ви будете розширювати для кожної сторінки вашого веб-сайту.

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

Далі для `base.html`, замініть ціле тіло `<body>` (все між `<body>` і `</body>`) цим:

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

{% raw %}Зауважте, це замінило все, починаючи від `{% for post in posts %}` до `{% endfor %}`, цим: {% endraw %}

```html
{% block content %}
{% endblock %}
```
Що це означає? Ви щойно створили блок `block`! Використали шаблонний тег `{% block %}` для того, щоб створити місце, в яке буде вставлено HTML. Цей HTML міститиметься в інших шаблонах, які розширюють цей шаблон (`base.html`). Скоро ми покажемо вам, як це зробити.

А тепер збережіть зміни і відкрийте знову свій `blog/templates/blog/post_list.html`.
{% raw %}Видаліть усе, що вище `{% for post in posts %}` і нижче `{% endfor %}`. Коли ви закінчите, файл виглядатиме так:{% endraw %}

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

Ми хочемо використати це як частина нашого шаблону для всіх блоків контенту.
Час додати теги блоків до цього файлу!

{% raw %}Ви хочете, щоб ваший тег блоку підходив до тегу у файлі `base.html`. Ви такоже хочете, щоб він включав в себе весь код, що належить вашим блокам з контентом. Щоб зробити це, розмістіть все між `{% block content %}` і `{% endblock content %}`. Як тут: {% endraw %}

```html

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
{% endblock %}
```
Залишився один момент. Нам потрібно поєднати ці два шаблони разом. Це і є розширенням шаблонів. Ми зробимо це додаванням на початок файлу тегу розширення. Як тут:
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
{% endblock %}
```

Ось і все! Перевірте, чи ваш сайт все ще коректно працює :)

> Якщо з'явилася помилка `TemplateDoesNotExists`, то це говорить про те, що файлу `blog/base.html` не існує і ви маєте в консолі запущений `runserver`, спробуйте зупинити його (натиснувши Ctrl+C - кнопки Control і C buttons разом) і перезавантажити командою `python manage.py runserver`.
