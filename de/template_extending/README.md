# Template Erweiterung

Eine weitere praktische Sache von Django ist das **template extending**, Erweiterungen des Templates. Was bedeutet das? Damit kannst du Teile deiner HTML-Site für verschiedene Seiten deiner Website nutzen.

Dadurch musst du dich nicht in jeder Datei wiederholen, wenn du das gleiche Layout oder den gleichen Inhalt nutzen möchtest. Und wenn du etwas ändern willst, musst du das nicht in jedem Template machen, sondern nur einmal!

## Base-Template erstellen

Ein Base-Template ist das grundlegende Template, welches dann auf jeder einzelnen Seite deiner Website erweitert wird.

Wir erstellen jetzt eine `base.html`-Datei in `blog/templates/blog/`:

```
blog
└───templates
    └───blog
            base.html
            post_list.html
```

Öffne sie, kopiere alles von `post_list.html` und füge es wie folgt in die `base.html`-Datei ein:

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

Dann ersetze in `base.html` den gesamten `<body>` (alles zwischen `<body>` und `</body>`) hiermit:

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

Wir haben nun also alles zwischen `{% for post in posts %}{% endfor %}` ersetzt mit:

```html
{% block content %}
{% endblock %}
```

Was bedeutet das jetzt? Du hast gerade einen `block` erstellt. Dies ist ein Template Tag, mithilfe dessen du HTML innerhalb dieses Blocks in anderen Templates einsetzen kannst, die sich auf `base.html` beziehen. Wir zeigen dir gleich, wie das geht.

Speichere nun und öffne wieder `blog/templates/blog/post_list.html`. Lösche hier alles, was nicht im Body steht und lösche auch `<div class="page-header"></div>`, die Datei sollte dann so aussehen:

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

Schreibe nun diese Zeile an den Anfang:

    {% extends 'blog/base.html' %}
    

Das heißt, dass das `post_list.html`-Template nun das `base.html`-Template erweitert ("extend"). Als Letztes müssen wir noch Folgendes machen: Verschiebe alles (außer der Zeile, die wir gerade hinzugefügt haben) zwischen `{% block content %}` und `{% endblock content %}`. So hier:

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

Das war's! Probier aus, ob deine Website noch richtig funktioniert :)

> Wenn du einen Fehler `TemplateDoesNotExists` bekommst, mit dem Hinweis, dass es keine `blog/base.html`-Datei gibt und der Server in der Konsole noch läuft: Stoppe ihn mit Ctrl+C (Control und C zusammen drücken) und starte ihn nochmal neu mit dem Befehl `python manage.py runserver`.
