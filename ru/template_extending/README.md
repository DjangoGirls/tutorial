# Расширение шаблона

Еще одной удобной вещью в Django является **расширение шаблонов**. Что это значит? Ты можешь использовать различные блоки HTML-кода для разных частей своего веб-сайта.

Так тебе не придется повторяться каждый раз, когда потребуется использовать туже информацию/структуру. И если появится необходимость что-то изменить - не придется вносить правки в каждую страницу - достаточно скорректировать шаблон!

## Создаем базовый шаблон

Базовый шаблон - это наиболее общая типовая форма страницы, которую ты расширяешь для отдельных случев.

Давай создадим файл `base.html` в директории `blog/templates/blog/`:

```
    blog
    └───templates
        └───blog
                base.html
                post_list.html
```

Теперь открой его и скопируй все из `post_list.html` в `base.html`:

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
                            <p>{{ post.text|linebreaksbr }}</p>
                        </div>
                    {% endfor %}
                    </div>
                </div>
            </div>
        </body>
    </html>
```

Затем в файле `base.html` замени все между тегами `<body>` и `</body>` следующим кодом:

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

Мы просто заменили все между `{% for post in posts %}{% endfor %}` следующим:

```html
    {% block content %}
    {% endblock %}
```

Что это означает? Ты только что создала `block` - тег шаблона, позволяющий вставлять HTML-код этого блока в другие шаблоны, расширяющие `base.html`. Мы покажем как это сделать через секунду.

Теперь сохрани все и открой `blog/templates/blog/post_list.html` снова. Тебе нужно удалить весь код вне тегов body, а также `<div class="page-header"></div>`, в итоге файл будет выглядеть следующим образом:

```html
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
```

А теперь добавь следующую строку в начало файла:

```
    {% extends 'blog/base.html' %}
```

{% raw %}Таким образом мы расширили шаблон `base.html` шаблоном `post_list.html`. Осталось последнее: обернуть все (кроме добавленной выше первой строки) в `{% block content %}` и `{% endblock content %}`. Таким образом:{% endraw %}

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
    {% endblock content %}
```

Готово! Проверь, что твой веб-сайт работает нормально :)

> Если появилась ошибка `TemplateDoesNotExists`, которая говорит что не существует файла `blog/base.html`, после того как ты запустила веб-сервер через команду `runserver` в рабочей строке, попробуй остановить его (одновременно нажми Ctrl + C находясь в командной строке) и перезапусти веб-сервер командой `python manage.py runserver`.
