# Estendere il template

Un'altra cosa bella di Django è l'**estensione del template**. Cosa significa? Significa che puoi usare le stesse parti del tuo HTML per pagine diverse del tuo sito.

Così non hai bisogno di ripetere le stesse informazioni/layout in ogni file. E se vuoi cambiare qualcosa, non devi cambiarlo in ogni templates, ma soltanto una volta!

## Crea un template di base

Un template base è il template più semplice. Lo puoi estendere su ogni pagina del tuo sito.

Creiamo un file `base.html` in `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Poi aprilo e copia tutto da `post_list.html` e incollalo sul file `base.html`, così:

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

Poi nel `base.html`, rimpiazza tutto il tuo `<body>` (tutto quello che si trova tra `<body>` e `</body>`) con questo:

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

Abbiamo praticamente rimpiazzato tutto quello tra `{% for post in posts %}{% endfor %}` con:

```html
{% block content %}
{% endblock %}
```

Che cosa significa? Che hai appena creato un `blocco`, ovvero un tag di template che ti permette di inserire l'HTML presente in questo blocco all'interno di altri template che estendono `base.html`. Ti mostreremo come farlo tra un attimo.

Ora salvalo, e apri il tuo `blog/templates/blog/post_list.html` di nuovo. Cancella tutto quello che non è all'interno del body e poi cancella anche `<div class="page-header"></div>`, in modo che il file appaia così:

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

Ed ora aggiungi questa riga all'inizio del file:

```python
{% extends 'blog/base.html' %}
```

{% raw %}Significa che stiamo estendendo il template `base.html` in `post_list.html`. Rimane solo una cosa da fare: metti tutto (tranne la riga che abbiamo appena aggiunto) tra `{% block content %}` e `{% endblock content %}`. Come questo:{% endraw %}

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

È tutto! Controlla se il tuo sito sta ancora funzionando correttamente :)

> Se hai un errore `TemplateDoesNotExists` che dice che non c'è un file `blog/base.html` e hai `runserver` in esecuzione nella console, prova a fermarlo (premendo Ctrl+C - I tasti Control e C insieme) e riavvialo mettendo in esecuzione il comando `python manage.py runserver`.