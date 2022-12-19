# Rozširovanie šablón

Ďalšia super možnosť, ktorú ti Django ponúka, je **rozširovanie šablón** (template extending). Znamená to, že môžeš použiť rovnaké časti HTML kódu na rôznych stránkach svojho webu.

Šablóny ti pomôžu, keď chceš použiť rovnaké informácie alebo formát obsahu na viac ako jednom mieste. Nemusíš dokola opakovať to isté. A ak chceš niečo zmeniť, nemusíš to urobiť v každej šablóne, len v jednej!

## Vytvorenie základnej šablóny

Základná šablóna (base template) je najzákladnejšia šablóna, ktorú rozširuješ na každej stránke svojej web stránky.

Vytvorme súbor `base.html` v priečinku `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Otvor ho v editore a skopíruj všetko z `post_list.html` do `base.html` takto:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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

Potom v `base.html` nahraď celé `<body>` (všetko medzi `<body>` a `</body>`) týmto:

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

{% raw %}Možno si si všimla, že toto nahradilo všetko od `{% for post in posts %}` po `{% endfor %}` týmto: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Ale prečo? Práve si vytvorila `blok`! Použila si šablónový tag `{% block %}`, aby si vytvoila časť, do ktorej bude vložené HTML. To HTML bude pochádzať z inej šablóny, ktorá rozšíri túto šablónu (`base.html`). Hneď ti ukážeme, ako sa to robí.

Teraz ulož `base.html` a znova otvor `blog/templates/blog/post_list.html` v editore. {% raw %}Odstrániš všetko nad `{% for post in posts %}` a pod `{% endfor %}`. Keď skončíš, súbor bude vyzerať nasledovne:{% endraw %}

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

Chceme toto použiť ako súčasť našej šablóny pre všetky bloky. Je načase pridať blokové tagy do tohto súboru!

{% raw %}Blokový tag by sa mal zhodovať s tagom v `base.html` súbore. Taktiež by mal obsahovať celý kód, čo patrí do tvojich obsahových blokov. To docieliš tak, že vložíš všetko medzi `{% block content %}` a `{% endblock %}`. Takto:{% endraw %}

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

Už zostáva len jediná vec. Potrebujeme tieto dve šablóny prepojiť. To je celá podstata rozširovania šablón! Urobíme to pridaním "extends" tagu na začiatku súboru. Nasledovne:

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

A je to! Súbor ulož a skontroluj, či tvoja web stránka stále funguje tak, ako má. :)

> Ak sa ti zobrazí chyba `TemplateDoesNotExist`, znamená to, že neexistuje súbor `blog/base.html` a `runserver` beží v konzole. Skús ho zastaviť (stlačením Ctrl+C – tlačidiel Control a C spolu) a spustiť znova pomocou príkazu `python manage.py runserver`.