# Rozbudowa szablonów

Kolejną fajną rzeczą, którą Django daje Ci do dyspozycji, jest możliwość **rozszerzania szablonów**. Co to oznacza? To znaczy, że możesz używać tych samych części Twojego kodu HTML na różnych stronach Twojej aplikacji.

Szablony pomagają, gdy chcesz te same informacje lub ten sam układ strony użyć w wielu miejscach. You don't have to repeat yourself in every file. And if you want to change something, you don't have to do it in every template, just one!

## Tworzenie szablonu bazowego

Szablon bazowy to najbardziej podstawowy szablon, który możesz rozszerzać na każdej stronie twojej aplikacji.

Stwórzmy plik `base.html` w `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Następnie otwórz go i skopiuj całą zawartość pliku `post_list.html` do pliku `base.html`, w taki sposób:

{% filename %}blog/templates/blog/base.html{% endfilename %}

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

Następnie, w `base.html`, zamień całą zawartość `<body>` (wszystko, co znajduje się pomiędzy `<body>` a `</body>`) na to:

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

{% raw %}You might notice this replaced everything from `{% for post in posts %}` to `{% endfor %}` with: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

But why? You just created a `block`! You used the template tag `{% block %}` to make an area that will have HTML inserted in it. That HTML will come from another template that extends this template (`base.html`). Za chwilę pokażemy Ci, jak to się robi.

Now save `base.html` and open your `blog/templates/blog/post_list.html` again. {% raw %}You're going to remove everything above `{% for post in posts %}` and below `{% endfor %}`. When you're done, the file will look like this:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

We want to use this as part of our template for all the content blocks. Time to add block tags to this file!

{% raw %}You want your block tag to match the tag in your `base.html` file. You also want it to include all the code that belongs in your content blocks. To do that, put everything between `{% block content %}` and `{% endblock %}`. O tak:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
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
{% endblock %}
```

Została jeszcze jedna rzecz. Musimy połączyć te dwa szablony razem. To właśnie na tym polega rozszerzaniem szablonów! Dokonamy tego dodając tag extend na początku nasze pliku. Właśnie tak:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

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
{% endblock %}
```

I już! Sprawdź, czy twoja strona nadal działa poprawnie. :)

> Jeżeli dostaniesz błąd `TemplateDoesNotExist`, oznacza to, że nie ma jesze pliku `blog/base.html` i jednocześnie w konsoli działa uruchomiony `runserver`. Spróbuj go zatrzymać (wciskając Ctrl+C - czy razem klawisze Control i C) i uruchomić ponownie przy użyciu polecenia `python manage.py runserver`.