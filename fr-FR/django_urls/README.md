# Les URL de Django

Nous sommes sur le point de créer notre première page web : une page d'accueil pour votre blog ! Mais d'abord, commençons par en apprendre un peu plus sur les URL de Django.

## Qu'est-ce qu'une URL ?

Une URL est une adresse web. Vous pouvez voir une URL chaque fois que vous visitez un site web. Elle est visible dans la barre d'adresse de votre navigateur. (Oui ! `127.0.0.1:8000` est aussi une URL ! Et `https://djangogirls.org` est aussi une URL.)

![Url](images/url.png)

Chaque page internet a besoin de sa propre URL. C'est grâce à cela que votre application sait ce qu'elle doit afficher à un utilisateur qui ouvre cette URL. Dans Django, nous utilisons un outil appelé `URLconf` (Configuration d'URL). URLconf est un ensemble de modèles que Django va essayé de faire correspondre à l'URL demandée afin de trouver la vue adaptée.

## Comment les URLs fonctionnent-elles dans Django ?

Ouvrons le fichier `mysite/urls.py` dans notre éditeur de code et regardons à quoi il ressemble :

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

Comme vous pouvez le voir ici, Django a déjà préparé quelque chose pour nous.

Les lignes entre triples guillemets (`'''` or `"""`) sont appelées docstrings. Vous pouvez les écrire en haut d'un fichier, d'une classe ou d'une méthode pour décrire son fonctionnement. Elle ne seront pas exécutées par Python.

L'URL admin, que vous avez abordé dans le chapitre précédent est déjà là :

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

Cette ligne signifie que pour toutes les URL commençant par `admin/`, Django trouvera une *vue* correspondante. Dans cet exemple, nous incluons de nombreuses URL admin. Elles ne sont donc pas toutes contenues dans ce petit fichier. C'est plus lisible et plus propre.

## Votre première URL Django !

Il est temps de créer notre première URL ! Nous voulons que 'http://127.0.0.1:8000/' soit la page d'accueil de notre blog et qu'elle affiche la liste des articles.

Nous aimerions aussi garder notre fichier `mysite/urls.py` propre. Pour cela, nous allons importer les URLs de notre application `blog` dans notre fichier principal `mysite/urls.py`.

Allez-y ! Ajoutez une ligne qui importera `blog.urls`. Vous devrez également modifier la ligne ` from django.urls...` car nous utiliseront la fonction `include`. Il vous faudra ajouter cet import à la ligne.

Votre fichier `mysite/urls.py` devrait maintenant ressembler à ceci :

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django va maintenant rediriger tout ce qui arrive sur "http://127.0.0.1:8000/" vers `blog.urls` puis regardera dans ce fichier pour y trouver la suite des instructions à suivre.

## blog.urls

Créez un nouveau fichier vide nommé `urls.py` dans le répertoire `blog`, et ouvrez-le dans l'éditeur de code. Très bien ! Ajoutez ces deux premières lignes :

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Nous venons d'importer la fonction `path` de Django ainsi que toutes les `vues` liées à notre application `blog`. (Cependant, nous n'avons pas encore créé de vues ! Pas de problème : nous y viendrons dans une minute !)

Après ça, nous pouvons ajouter notre premier modèle (pattern) d'URL:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

Comme vous pouvez le voir, nous assignons une `vue` appelée `post_list` à l'URL racine. This URL pattern will match an empty string and the Django URL resolver will ignore the domain name (i.e., http://127.0.0.1:8000/) that prefixes the full url path. This pattern will tell Django that `views.post_list` is the right place to go if someone enters your website at the 'http://127.0.0.1:8000/' address.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. This can be the same as the name of the view but it can also be something completely different. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Error](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there. If you see a different error message, try restarting your web server. To do that, in the console window that is running the web server, stop it by pressing Ctrl+C (the Control and C keys together) and restart it by running a `python manage.py runserver` command.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/urls/