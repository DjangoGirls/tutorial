# Mallutökning

En annan trevlig sak Django har åt dig är **mallutökning**. Vad betyder detta? Det innebär att du kan använda samma delar av din HTML för olika sidor på din webbplats.

Mallar hjälper dig när du vill använda samma information eller layout på mer än ett ställe. Du behöver inte upprepa dig själv i varje fil. Och om du vill ändra något behöver du inte göra det i varje mall, bara en!

## Skapa en basmall

En basmall är den mest grundläggande mallen som du utökar på varje sida på din webbplats.

Låt oss skapa en `base.html` fil i `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Öppna sedan upp den i kodeditorn och kopiera allt från `post_list.html` till `base.html` fil, så här:

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
                        <h2><a href="">{{ post.title }}</a></h2>
                        <p>{{ post.text|linebreaksbr }}</p>
                    </div>
                {% endfor %}
                </div>
            </div>
        </div>
    </body>
</html>
```

Därefter, i `base.html`, ersätt hela din `<body>` (allt mellan `<body>` och `</body>`) med detta:

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

{% raw %}Du kanske märker att detta ersatte allt från `{% for post in posts %}` till `{% endfor %}` med: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Men varför? Du har precis skapat ett `block`! Du använde malltaggen `{% block %}` för att skapa ett område som kommer att ha HTML insatt i den. HTML-koden kommer från en annan mall som utökar denna mall (`base.html`). Vi kommer att visa dig hur du ska göra detta om ett ögonblick.

Spara nu `base.html` och öppna din `blog/templates/blog/post_list.html` i kodeditorn. {% raw %}Du kommer att ta bort allt över `{% for post in posts %}` och under `{% endfor %}`. När du är klar kommer filen att se ut så här:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <div class="date">
            {{ post.published_date }}
        </div>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

Vi vill använda detta som en del av vår mall för alla innehållsblock. Dags att lägga till blocktaggar till denna fil!

{% raw %}Du vill att din blocktagg ska matcha taggen i din `base.html`. Du vill också att den ska innehålla all kod som hör hemma i dina innehållsblock. För att göra det, lägg allt mellan `{% block content %}` och `{% endblock %}`. Såhär:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

Bara en sak kvar. Vi behöver sammankoppla de här två mallarna. Detta är vad mallutökning handlar om! Vi kommer att göra detta genom att lägga till en "extends"-tagg till början av filen. Såhär:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

Det är allt! Spara filen, och kontrollera att din webbplats fortfarande fungerar som den ska. :)

> Om du får felet `TemplateDoesNotExist`, betyder det att det inte finns någon `blog/base.html`-fil och du har `runserver` körandes i konsolen. Försök att stoppa den (genom att trycka på Ctrl+C – Control- och C-tangenten tillsammans) och starta om den genom att köra kommandot `python manage.py runserver`.