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
    

Öffne sie, kopiere alles von `post_list.html` und füge es wie folgt in die `base.html`-Datei ein:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
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

{% raw %}Vielleicht hast du bemerkt, dass das alles von `{% for post in posts %}` bis `{% endfor %}` mit dem Folgenden ersetzt: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Aber warum? Du hast gerade einen `block` erstellt! Du hast den Template Tag `{% block %}` benutzt, um einen Bereich zu schaffen, der HTML aufnehmen kann. Dieses HTML kommt aus einem anderen Template, welches das Template hier (`base.html`) erweitert. Wir zeigen dir gleich, wie das geht.

Speichere nun die Datei `base.html` und öffne wieder `blog/templates/blog/post_list.html`. {% raw %}Du löschst alles oberhalb von `{% for post in posts %}` und unterhalb von `{% endfor %}`. Wenn du das gemacht hast, sieht die Datei so aus:{% endraw %}

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

Dieser Teil unseres Templates soll nun das Basis-Template erweitern. Wir müssen daher Block-Tags ergänzen!

{% raw %}Deine Block Tags müssen mit den Tags in der `base.html`-Datei übereinstimmen. Du möchtest auch, dass der ganze Code dieser Datei mit eingeschlossen wird. Um das zu erreichen, umschließt du ihn mit `{% block content %}` und `{% endblock %}`. So hier:{% endraw %}

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

Nur eine Sache noch. Wir müssen die beiden Templates natürlich miteinander verknüpfen. Darum geht es ja bei der Template Erweiterung! Dafür ergänzen wir einen Tag für Erweiterung (extends tag) ganz oben in der Datei. So hier:

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

Das war's! Probier aus, ob deine Website noch richtig funktioniert. :)

> Wenn du einen Fehler `TemplateDoesNotExist` erhältst, dann heißt das, es gibt keine `blog/base.html` Datei und `runserver` läuft in der Konsole. Halte ihn an (durch Drücken von Ctrl+C – Control und die C Taste gleichzeitig) und starte ihn neu, in dem du den Befehl `python manage.py runserver` ausführst.