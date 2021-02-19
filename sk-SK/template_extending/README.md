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
    

Then open it up in the code editor and copy everything from `post_list.html` to `base.html` file, like this:

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

{% raw %}Možno si si všimla, že toto nahradilo všetko od `{% for post in posts %}` po `{% endfor %}` s: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Ale prečo? Práve si vytvorila `block`! Použila si šablónový tag `{% block %}` aby si vytvoila časť, do ktorej bude vložené HTML. To HTML bude pochádzať z inej šablóny, ktorá rozšíri túto šablónu (`base.html`). Hneď ti ukážeme, ako sa to robí.

Now save `base.html` and open your `blog/templates/blog/post_list.html` again in the code editor. {% raw %}Odstrániš všetko nad `{% for post in posts %}` a pod `{% endfor %}`. Keď skončíš, súbor bude vyzerať nasledovne:{% endraw %}

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

Chceme toto použiť ako súčasť našej šablóny pre všetky bloky. Je čas pridať blokové tagy do tohto súboru!

{% raw %}Blokový tag by sa mal zhodovať s tagom v `base.html` súbore. Taktiež by mal obsahovať celý kód, čo patrí do tvojích obsahových blokov. Aby si to urobila, vlož všetko medzi `{% block content %}` a `{% endblock %}`. Takto:{% endraw %}

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

Ešte zostála len jediná vec. Potrebujeme prepojiť tieto dve šablóny. O tomto je rozširovanie šablón! Urobíme to pridaním extends tagu na začiatku súboru. Nasledovne:

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

That's it! Save the file, and check if your website is still working properly. :)

> Ak sa ti zobrazí chyba `TemplateDoesNotExist`, to znamená, že neexistuje `blog/base.html` súbor a `runserver` beží v konzole. Skús ho zastaviť (stlačením Ctrl+C – Control a C tlačidiel spolu) a spusti ho znova pomocou príkazu `python manage.py runserver`.