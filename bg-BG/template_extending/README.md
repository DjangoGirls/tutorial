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

Но защо? Току-що създадохте `block`! Използвахте шаблонния маркер `{% block %}`, за да направите област, в която да бъде вмъкнат HTML код. That HTML will come from another template that extends this template (`base.html`). We will show you how to do this in a moment.

Now save `base.html` and open your `blog/templates/blog/post_list.html` again in the code editor. {% raw %}You're going to remove everything above `{% for post in posts %}` and below `{% endfor %}`. When you're done, the file will look like this:{% endraw %}

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

We want to use this as part of our template for all the content blocks. Time to add block tags to this file!

{% raw %}You want your block tag to match the tag in your `base.html` file. You also want it to include all the code that belongs in your content blocks. To do that, put everything between `{% block content %}` and `{% endblock %}`. Like this:{% endraw %}

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