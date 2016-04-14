# Héritage de template

Django vous réserve encore bien des surprises : une assez géniale est **l'héritage de template**. Qu'est ce que ça signifie ? C'est une fonctionnalité qui vous permet de réutiliser certains morceaux de HTML dans différentes pages de votre site web.

Concrètement, cela permet d'éviter de vous répéter dans chaque fichier lorsque vous voulez utiliser la même information ou mise en page. Ainsi, lorsque vous voudrez changer quelque chose, vous n'aurez à le faire qu'une seule fois!

## Créer un template de base

Un template de base est le template le plus simple que vous pouvez faire hériter à chaque page de votre site web.

Créons le fichier `base.html` dans le dossier `blog/templates/blog/` :

    blog
    └───templates
        └───blog
                base.html
                post_list.html


Ensuite, ouvrez ce fichier `base.html` et collez-y tout ce qui se trouve dans le fichier `post_list.html`. Ça devrait ressembler à ça :

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
                        <p>{{ post.text|linebreaks }}</p>
                    </div>
                {% endfor %}
                </div>
            </div>
        </div>
    </body>
</html>
```

Puis, dans le fichier `base.html`, remplacez tout ce qui se trouve dans `<body>` (de `<body>` à `</body>`) par ceci :

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

Nous venons concrètement de remplacer tout ce qui se trouve entre `{% for post in posts %}{% endfor %}` par :

```html
{% block content %}
{% endblock %}
```

Qu'est-ce que cela signifie ? Vous venez simplement de créer un `block` : c'est une balise de template qui vous permet d'insérer le HTML de ce block dans d'autres templates qui héritent de `base.html`. Nous vous expliquerons comment faire dans un instant.

Maintenant, sauvegardez votre fichier puis ouvrez à nouveau `blog/templates/blog/post_list.html`. Supprimez tout ce qui n'est pas dans body. Supprimez aussi `<div class="page-header"></div>`. Votre fichier doit maintenant ressembler à ça :

```html
{% for post in posts %}
    <div class="post">
        <div class="date">
            {{ post.published_date }}
        </div>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaks }}</p>
    </div>
{% endfor %}
```

Maintenant, ajoutez cette ligne au début du fichier :

```html
{% extends 'blog/base.html' %}
```

{% raw %}Cela signifie que nous sommes en train d'étendre le modèle du template `base.html` dans `post_list.html`. Une dernière chose à faire : déplacez tout le contenu du fichier dans la partie située entre `{% block content %}` et `{% endblock content %}`. Attention à ne pas déplacer la ligne que nous venons juste d'insérer. Comme ceci :{% endraw %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaks }}</p>
        </div>
    {% endfor %}
{% endblock content %}
```

Et voilà ! Vérifiez que votre site fonctionne toujours correctement :)

> Si jamais vous rencontrez une erreur de type `TemplateDoesNotExists` qui signale que le fichier `blog/base.html` n'existe pas et que `runserver` tourne dans votre console, tuez-le (en appuyant sur les touches Ctrl+C en même temps) et relancez votre server à l'aide de la commande `python manage.py runserver`.
