# Template-kiegészítés

Egy másik szuper dolog, amit a Django tud, a **template extending**, vagyis template-kiegészítés. Mit jelent ez? Azt, hogy a HTML-ed egyes részeit több oldalon is fel tudod használni az alkalmazásodban.

Így nem kell megismételned magad minden fájlban, ha ugyanazt az információt szeretnéd felhasználni, vagy ugyanolyan layout-ot tervezel. És ha meg szeretnél változtatni valamit, nem kell minden sablonban külön megtenned, csak egyszer!

## Hozd létre az alap template-et

A base (alap) template a legegyszerűbb sablon, amit az alkalmazásod összes oldalán kiegészítesz.

Hozz létre egy `base.html` fájlt a `blog/templates/blog/`-ban:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Majd nyisd meg, és másolj át mindent a `post_list.html`-ből a `base.html`-be, így:

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

Aztán a `base.html`-ben cseréld ki az egész `<body>`-t (mindent a `<body>` és a `</body>` között) erre:

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

Lényegében a `{% for post in posts %}{% endfor %}` részt kicseréltük erre:

```html
{% block content %}
{% endblock %}
```

Ez mit is jelent? Létrehoztál egy `block`-ot. Ez egy olyan template tag, amely segítségével HTML-t illeszthetsz be a blokkba más template-ekben, ezzel kiegészítve a `base.html`-t. Máris megmutatjuk, hogy működik.

Most mentsd el, és nyisd meg újra a `blog/templates/blog/post_list.html`-t. Törölj ki mindent a body-n kívül, és a `<div class="page-header"></div>` részt is, hogy így nézzen ki a fájl:

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

És most add hozzá ezt a sort a fájl elejéhez:

    {% extends 'blog/base.html' %}
    

{% raw %}Ez azt jelenti, hogy most a `base.html` template-et egészítjük ki a `post_list.html`-ben. Már csak egy dolog van hátra: az előző sor kivételével rakj mindent `{% block content %}` és `{% endblock content %}` közé. Így:{% endraw %}

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

Ez az! Nézd meg, hogy még mindig működik-e a weboldalad :)

> Ha `TemplateDoesNotExists` (a template nem létezik) hibát kapsz, ami azt mondja, nincs `blog/base.html` fájlod, és fut a `runserver` a konzolban, próbáld meg leállítani (Ctrl+C-vel, vagyis egyszerre nyomd meg a Control és a C billentyűt) és indítsd el újra a `python manage.py runserver` paranccsal.