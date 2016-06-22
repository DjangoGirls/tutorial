# Rozbudowa szablonów

Kolejną fajną rzeczą, którą Django daje Ci do dyspozycji, jest możliwość **rozszerzania szablonów**. Co to oznacza? To znaczy, że możesz używać tych samych części Twojego kodu HTML na różnych stronach Twojej aplikacji.

Dzięki temu, jeśli chcesz mieć te same informacje albo ten sam layout to nie musisz się powtarzać w każdym pliku. Tak samo jeśli chcesz coś zmienić - nie musisz edytować kilku plików, robisz to tylko raz!

## Tworzenie szablonu bazowego

Szablon bazowy to najbardziej podstawowy szablon, który możesz rozszerzać na każdej stronie twojej aplikacji.

Stwórzmy plik `base.html` w `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html


Następnie otwórz go i skopiuj całą zawartość pliku `post_list.html` do pliku `base.html`, w taki sposób:

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

W zasadzie zastąpiłyśmy całą treść wewnątrz `{% for post in posts %}{% endfor %}` tym:

```html
{% block content %}
{% endblock %}
```

Co to znaczy? Stworzyłaś właśnie `block` (blok), który jest znacznikiem szablonu umożliwiającym Ci wstawienie HTML wewnątrz tego bloku w innych szablonach, które rozszerzają `base.html`. Za chwilę pokażemy Ci, jak to się robi.

Teraz zapisz zmiany, a potem otwórz jeszcze raz plik `blog/templates/blog/post_list.html`. Usuń całą zawartość z wyjątkiem zawartości znacznika body, a potem usuń także `<div class="page-header"></div>`, aby plik wyglądał tak:

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

A teraz dodaj ten wiersz na początku pliku:

```html
{% extends 'blog/base.html' %}
```  

{% raw %}To znaczy, że rozszerzamy szablon `base.html` w pliku `post_list.html`. Zostało już tylko jedno: wstaw całą treść (pomijając wiersz, który właśnie dodałyśmy) pomiędzy `{% block content %}` a `{% endblock content %}`. O tak:{% endraw %}

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

I już! Sprawdź, czy twoja strona nadal działa poprawnie. :)

> Jeżeli dostajesz błąd `TemplateDoesNotExists` mówiący, że brakuje pliku `blog/base.html` i masz uruchomiony `runserver` w konsoli, spróbuj go zatrzymać (wciśnij Ctrl+C - klawisze Control i C jednocześnie) i uruchomić ponownie za pomocą polecenia `python manage.py runserver`.
