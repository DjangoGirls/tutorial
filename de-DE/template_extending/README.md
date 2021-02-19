# Erweiterung der Templates

Eine weitere praktische Sache von Django ist das **template extending**, Erweiterungen des Templates. Was bedeutet das? Damit kannst du Teile deines HTML-Codes für andere Seiten deiner Website nutzen.

Templates helfen, wenn du die selben Informationen oder das selbe Layout an mehreren Stellen verwenden willst. Du musst dich so nicht in jeder Datei wiederholen. Und wenn du etwas ändern willst, dann musst du es nicht in jedem einzelnen Template tun, sondern nur in einem!

## Ein Basis-Template erstellen

Ein Basis-Template ist das grundlegende Template, welches dann auf jeder einzelnen Seite deiner Website erweitert wird.

Wir erstellen jetzt eine `base.html`-Datei in `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Öffne sie im Code-Editor, kopiere alles von `post_list.html` und füge es wie folgt in die `base.html`-Datei ein:

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

Dann ersetze in `base.html` den gesamten `<body>` (alles zwischen `<body>` und `</body>`) hiermit:

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

{% raw %}Vielleicht hast du bemerkt, dass das alles von `{% for post in posts %}` bis `{% endfor %}` mit dem Folgenden ersetzt: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Aber warum? Du hast gerade einen `block` erstellt! Du hast den Template-Tag `{% block %}` benutzt, um einen Bereich zu schaffen, der HTML aufnehmen kann. Dieses HTML kommt aus einem anderen Template, welches das Template hier (`base.html`) erweitert. Wir zeigen dir gleich, wie das geht.

Speichere nun die Datei `base.html` und öffne wieder `blog/templates/blog/post_list.html` im Code-Editor. {% raw %}Du löschst alles oberhalb von `{% for post in posts %}` und unterhalb von `{% endfor %}`. Wenn du das gemacht hast, sieht die Datei so aus:{% endraw %}

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

Dieser Teil unseres Templates soll nun das Basis-Template erweitern. Wir müssen daher Block-Tags ergänzen!

{% raw %}Deine Block-Tags müssen mit den Tags in der `base.html`-Datei übereinstimmen. Stelle sicher, dass die Block-Tags den ganzen Code deines content-Blocks umschließen. Um das zu erreichen, umschließt du ihn mit `{% block content %}` und `{% endblock %}`. So hier:{% endraw %}

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

Nur eine Sache noch. Wir müssen die beiden Templates miteinander verknüpfen. Darum geht es ja bei der Template-Erweiterung! Dafür ergänzen wir einen Tag für Erweiterung (extends tag) ganz oben in der Datei. Und zwar so:

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

Das war's! Speichere die Datei und probier aus, ob deine Website noch richtig funktioniert. :)

> Wenn du den Fehler `TemplateDoesNotExist` erhältst, dann heißt das, dass es die Datei `blog/base.html` nicht gibt und dass `runserver` in der Konsole läuft. Halte ihn an (durch Drücken von Ctrl+C bzw. Strg+C – Control- und die C-Taste gleichzeitig) und starte ihn neu, indem du den Befehl `python manage.py runserver` ausführst.