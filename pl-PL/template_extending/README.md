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
    

Następnie otwórz ten plik w edytorze kodu i skopiuj całą zawartość pliku `post_list.html` do pliku `base.html`, w taki sposób:

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

Następnie, w `base.html`, zamień całą zawartość `<body>` (wszystko, co znajduje się pomiędzy `<body>` a `</body>`) na to:

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

{% raw %}Mogłaś zauważyć, że zamieniło to wszystko od `{% for post in posts %}` do `{% endfor %}` na: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Ale czemu? Właśnie stworzyłaś `block`! Użyłaś znacznika szablonu `{% block %}` by zaznaczyć obszar, w który zostanie wstawiony HTML. Ten HTML będzie pochodził z innego szablonu, który rozszerza ten szablon (`base.html`). Za chwilę pokażemy Ci, jak to się robi.

Teraz zapisz `base.html` i otwórz ponownie w edytorze swój `blog/templates/blog/post_list.html`. {% raw %}Usuniemy teraz wszystko powyżej `{% for post in posts %}` i poniżej `{% endfor %}`. Jak to zrobisz, plik będzie wyglądać tak:{% endraw %}

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

Będziemy chciały użyć tych kliku linii jako części szablonu dla wszystkich bloków treści. Najwyższy czas dodać znaczniki block w tym pliku!

{% raw %}Musimy zrobić to tak, by nasz znacznik block zgadzał się ze znacznikiem w pliku `base.html`. Chcesz też by zawierał on cały kod, który należy do twoich bloków treści. By to osiągnąć, umieść wszystko pomiędzy `{% block content %}` i `{% endblock %}`. O tak:{% endraw %}

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

Została jeszcze jedna rzecz. Musimy połączyć te dwa szablony razem. To właśnie na tym polega rozszerzaniem szablonów! Dokonamy tego dodając tag extend na początku nasze pliku. Właśnie tak:

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

To wszystko! Zapisz plik i sprawdź, czy Twoja strona nadal działa poprawnie. :)

> Jeżeli dostaniesz błąd `TemplateDoesNotExist`, oznacza to, że nie ma jesze pliku `blog/base.html` i jednocześnie w konsoli działa uruchomiony `runserver`. Spróbuj go zatrzymać (wciskając Ctrl+C - czy razem klawisze Control i C) i uruchomić ponownie przy użyciu polecenia `python manage.py runserver`.