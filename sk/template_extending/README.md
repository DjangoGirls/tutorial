# Rozširovanie šablón

Ďalšou milou vecou, ktorú ti Django ponúka je **rozširovanie šablón**. Znamená to, že môžeš použiť rovnaké časti HTML kódu na rôznych stránkach svojho webu.

Vďaka tomu nemusíš všetko opakovať v každom súbore, ak chceš použiť rovnakú informáciu alebo layout. A ak chceš niečo zmeniť, nemusíš to robiť v každej šablóne zvlášť, ale iba raz!

## Vytvorenie základnej šablóny

Základná šablóna je jednoducho šablóna, ktorú rozširuješ na každej stránke svojej web stránky.

Vytvorme súbor `base.html` v `blog/templates/blog/`:

```
blog
└───templates
    └───blog
            base.html
            post_list.html
```

Otvor ho a skopíruj doň všetko z `post_list.html` do súboru `base.html`:

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

Potom v `base.html` nahraď celé `<body>` (všetko medzi `<body>` a `</body>`) týmto:

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

V podstate sme nahradili všetko medzi `{% for post in posts %}{% endfor %}` týmto:

```html
{% block content %}
{% endblock %}
```

Čo to znamená? Práve si vytvorila `block` (blok), čo je vlastne šablóna tagov, ktorá ti umožní vkladať HTML v tomto bloku do ďalších šablón, ktoré rozširujú `base.html`. Hneď ti ukážeme, ako sa to robí.

Teraz to ulož a znova otvor `blog/templates/blog/post_list.html`. Zmaž všetko, okrem toho, čo je vnútri body a tiež zmaž `<div class="page-header"></div>`, takže súbor bude vyzerať takto:

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

A teraz pridaj tento riadok na začiatok súboru:

```html
{% extends 'blog/base.html' %}
```

{% raw %}To znamená, že rozširujeme šablónu `base.html` v `post_list.html`. Už ostáva len jedna vec: daj všetko (teda okrem riadku, ktorý sme práve pridali) medzi `{% block content %}` a `{% endblock content %}`. Takto:{% endraw %}

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

A je to! Skontroluj či tvoja web stránka funguje tak, ako má :)

> Ak sa ti zobrazí chyba `TemplateDoesNotExists`, ktorá hovorí, že súbor `blog/base.html` neexistuje a v konzole ti beží `runserver`, skús ho zastaviť (stlačením Ctrl + C) a reštartuj ho spustením príkazu `python manage.py runserver`.
