# Rozširovanie šablón

Ďalšia super možnosť, ktorú ti Django ponúka je **rozširovanie šablón**. Znamená to, že môžeš použiť rovnaké časti HTML kódu na rôznych stránkach svojho webu.

Šablóny ti pomôžu, keď chceš použiť rovnaké informácie alebo zobrazenie na viac ako jednom mieste. Nemusíš dokola opakovať to isté. A ak chceš niečo zmeniť, nemusíš to urobiť v každej šablóne, len v jednej!

## Vytvorenie základnej šablóny

Základná šablóna je najzákladnejšia šablóna, ktorú rozširuješ na každej stránke svojej web stránky.

Vytvorme súbor `base.html` v `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Otvor ho a skopíruj doň všetko z `post_list.html` do súboru `base.html`:

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

Potom v `base.html` nahraď celé `<body>` (všetko medzi `<body>` a `</body>`) týmto:

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

{% raw %}Možno si si všimla, že toto nahradilo všetko od `{% for post in posts %}` po `{% endfor %}` s: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Ale prečo? Práve si vytvorila `block`! Použila si šablónový tag `{% block %}` aby si vytvoila časť, do ktorej bude vložené HTML. To HTML bude pochádzať z inej šablóny, ktorá rozšíri túto šablónu (`base.html`). Hneď ti ukážeme, ako sa to robí.

Teraz ulož `base.html` a znova otvor `blog/templates/blog/post_list.html`. {% raw %}Odstrániš všetko nad `{% for post in posts %}` a pod `{% endfor %}`. Keď skončíš, súbor bude vyzerať nasledovne:{% endraw %}

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

Chceme toto použiť ako súčasť našej šablóny pre všetky bloky. Je čas pridať blokové tagy do tohto súboru!

{% raw %}Blokový tag by sa mal zhodovať s tagom v `base.html` súbore. Taktiež by mal obsahovať celý kód, čo patrí do tvojích obsahových blokov. Aby si to urobila, vlož všetko medzi `{% block content %}` a `{% endblock %}`. Takto:{% endraw %}

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

Ešte zostála len jediná vec. Potrebujeme prepojiť tieto dve šablóny. O tomto je rozširovanie šablón! Urobíme to pridaním extends tagu na začiatku súboru. Nasledovne:

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

A je to! Skontroluj či tvoja web stránka funguje tak, ako má. :)

> Ak sa ti zobrazí chyba `TemplateDoesNotExist`, to znamená, že neexistuje `blog/base.html` súbor a `runserver` beží v konzole. Skús ho zastaviť (stlačením Ctrl+C – Control a C tlačidiel spolu) a spusti ho znova pomocou príkazu `python manage.py runserver`.