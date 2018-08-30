# Estendere il template

Un'altra cosa bella di Django è l'**estensione del template**. Cosa significa? Significa che puoi usare le stesse parti del tuo HTML per pagine diverse del tuo sito.

Templates help when you want to use the same information or layout in more than one place. Non devi ripeterti in ogni file. And if you want to change something, you don't have to do it in every template, just one!

## Create a base template

Un template base è il template più semplice. Lo puoi estendere su ogni pagina del tuo sito.

Creiamo un file `base.html` in `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Then open it up in the code editor and copy everything from `post_list.html` to `base.html` file, like this:

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

Perchè? Hai appena creato un blocco! Hai appena usato un template tag `{% block %}` per creare un area che che avrà dell'HTML all'interno. That HTML will come from another template that extends this template (`base.html`). Ti mostreremo come farlo tra un attimo.

Now save `base.html` and open your `blog/templates/blog/post_list.html` again in the code editor. {% raw %}Rimuovi tutto quello che c'è prima di `{% for post in posts %}` e dopo `{% endfor %}`. When you're done, the file will look like this:{% endraw %}

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
            <h1><a href="">{{ post.title }}</a></h1>
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
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

That's it! Save the file, and check if your website is still working properly. :)

> If you get the error `TemplateDoesNotExist`, that means that there is no `blog/base.html` file and you have `runserver` running in the console. Try to stop it (by pressing Ctrl+C – the Control and C keys together) and restart it by running a `python manage.py runserver` command.