# Estendere il template

Un'altra cosa bella di Django è l'**estensione del template**. Cosa significa? Significa che puoi usare le stesse parti del tuo HTML per pagine diverse del tuo sito.

I template ti aiutano quando vuoi usare le stesse informazioni o gli stessi layout in pagine diverse. Non devi ripetere lo stesso codice in ogni file. E se vuoi cambiare qualcosa, non lo devi fare in ogni template, ma solo in uno!

## Creare un template di base

Un template di base è il template più semplice. Lo puoi estendere ad ogni pagina del tuo sito.

Creiamo un file `base.html` in `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Poi aprilo nell'editor di codice e copia tutto da `post_list.html` al file `base.html`, in questo modo:

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

Poi nel `base.html`, rimpiazza tutto il tuo `<body>` (tutto quello che si trova tra `<body>` e `</body>`) con questo:

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

{% raw %}Potresti aver notato che questo sostituisce tutto da `{% for post in posts %}` a `{% endfor %}` con: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Perchè? Hai appena creato un blocco! Hai appena usato un template tag `{% block %}` per creare un area che che avrà dell'HTML all'interno. Questo codice HTML verrà da altri template che estenderanno questo (`base.html`). Ti mostreremo come farlo tra un attimo.

Ora salva `base.html` e apri di nuovo il tuo `blog/templates/blog/post_list.html` nell'editor di codice. {% raw %}Rimuovi tutto quello che c'è prima di `{% for post in posts %}` e dopo `{% endfor %}`. Quando hai finito, il file apparirà così:{% endraw %}

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

Vogliamo usare questa parte del nostro template per ogni blocco per i contenuti. Aggiungiamo un tag block in questo file!

{% raw %}Dobbiamo fare in modo che il tuo tag block combaci con quello nel tuo file`base.html`. Dobbiamo anche includere tutto il codice del blocco dei contenuti. Per farlo, metti tutto tra `{% block content %}` e `{% endblock %}`. Come questo:{% endraw %}

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

Un'ultima cosa. Dobbiamo collegare questi due template. È questo che vuol dire estendere i template! Lo faremo aggiungendo un tag extends all'inizio del file. Così:

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

Ecco fatto! Salva il file e controlla se il tuo sito web funziona ancora correttamente. :)

> Se ottieni l'errore `TemplateDoesNotExist`, significa che non c'è nessun file `blog/base.html` e `runserver` è in esecuzione nella console. Prova ad arrestarlo (premendo Ctrl+C, i tasti Control e C insieme) e riavvialo utilizzando il comando `python manage.py runserver`.