# Rozbudowa szablonów

Kolejną fajną rzeczą, którą Django daje Ci do dyspozycji, jest możliwość **rozszerzania szablonów**. Co to oznacza? To znaczy, że możesz używać tych samych części Twojego kodu HTML na różnych stronach Twojej aplikacji.

Szablony pomagają, gdy chcesz użyć te same informacje lub ten sam kod w wielu miejscach. W takim wypadku nie musisz się powtarzać w każdym pliku. I jak będziesz chciała zmienić cokolwiek, nie będziesz musiała tego zrobić w każdym szablonie, wystarczy tylko w jednym!

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

{% raw %}Mogłaś zauważyć, że zamieniło to wszystko od `{% for post in posts %}` do `{% endfor %}` na: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Ale czemu? Właśnie stworzyłaś `block`! Użyłaś znacznika szablonu `{% block %}` by zaznaczyć obszar, w który zostanie wstawiony HTML. Ten HTML będzie pochodził z innego szablonu, który rozszerza ten szablon (`base.html`). Za chwilę pokażemy Ci, jak to się robi.

To teraz zapisz `base.html` i otwórz ponownie swój `blog/templates/blog/post_list.html`. {% raw %}Usuniemy teraz wszystko powyżej `{% for post in posts %}` i poniżej `{% endfor %}`. Jak to zrobisz, plik będzie wyglądać tak:{% endraw %}

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

Będziemy chciały użyć tych kliku linii jako części szablonu dla wszystkich bloków treści. Najwyższy czas dodać znaczniki block w tym pliku!

{% raw %}Musimy zrobić to tak, by nasz znacznik block zgadzał się ze znacznikiem w pliku `base.html`. Chcesz też by zawierał on cały kod, który należy do twoich bloków treści. By to osiągnąć, umieść wszystko pomiędzy `{% block content %}` i `{% endblock %}`. O tak:{% endraw %}

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