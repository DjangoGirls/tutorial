# Разширяване на шаблона

Друго хубаво нещо, което Django има за вас, е **разширяване на шаблона**. Какво означава това? Това означава, че можете да използвате същите части на вашия HTML за различни страници на вашия уебсайт.

Шаблоните помагат, когато искате да използвате една и съща информация или оформление на повече от едно място. Не е нужно да се повтаряте във всеки файл. И ако искате да промените нещо, не е необходимо да го правите във всеки шаблон, само в един!

## Създайте основен шаблон

Базовият шаблон е най-основният шаблон, който разширявате на всяка страница от вашия уебсайт.

Нека създадем `base.html` файл в `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

След това го отворете в редактора на кода и копирайте всичко от `post_list.html` във `base.html` файл, като този:

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

След това в `base.html` заменете целия си `<body>` (всичко между `<body>` и `</body>`) с това:

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

{% raw %}Може да забележите, че това замени всичко от `{% for post in posts %}` до `{% endfor %}` с: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Но защо? Току-що създадохте `block`! Използвахте шаблонния маркер `{% block %}`, за да направите област, в която да бъде вмъкнат HTML код. Този HTML код ще идва от друг шаблон, който разширява този шаблон (`base.html`). Ще ви покажем как да направите това след малко.

Сега запишете `base.html` и отворете вашия `blog/templates/blog/post_list.html` отново в редактора на кода. {% raw %} Ще премахнете всичко по-горе `{% for post in posts %}` и под `{% endfor %}`. Когато приключите, файлът ще изглежда така:{% endraw %}

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

Искаме да използваме това като част от нашия шаблон за всички съдържателни блокове. Време е да добавите блокови тагове към този файл!

{% raw %}Искате вашият маркер за блока да съвпада с маркера във вашия `base.html` файл. Освен това искате той да включва всички кодове, които принадлежат във вашите блокове на съдържание. За целта поставете всичко между `{% block content %}` и `{% endblock %}`. Ето така:{% endraw %}

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

Остана само едно нещо. Трябва да свържем тези два шаблона заедно. За това става въпрос в разширяващите се шаблони! Ще направим това, като добавим маркер за разширения в началото на файла. Ето така:

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

Това е! Запазете файла и проверете дали уебсайтът ви все още работи правилно. :)

> Ако получите грешката `TemplateDoesNotExist`, това означава, че няма `blog/base.html` файл и имате `runserver` работещ в конзолата. Опитайте се да го спрете (като натиснете Ctrl + C - клавишите Control и C заедно) и го рестартирайте, като изпълните команда `python Manag.py runserver`.