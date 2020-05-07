{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Finaliser votre application

Nous avons déjà franchi toutes les étapes nécessaires à la création de notre site web : nous savons maintenant comment écrire un modèle, une URL, une vue et un template. Nous avons même réussi à rendre notre site web plus joli .

C'est le moment de pratiquer tout ce que vous avez appris !

Tout d'abord, il faudrait que notre blog possède une page qui permet d'afficher un post, n'est-ce pas ?

Nous avons déjà un modèle `Post`, nous n'avons donc pas besoin d'ajouter quoi que ce soit à `models.py`.

## Créer un lien dans un template

Nous allons tout d'abord ajouter un lien à l'intérieur du fichier `blog/templates/blog/post_list.html`. Ouvrez-le dans l’éditeur de code et voyez qu'il devrait ressembler à ceci : {% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

{% raw %}Nous aimerions pouvoir cliquer sur le titre du post et arriver sur une page avec le contenu de celui-ci. Pour cela, changeons `<h2><a href="">{{ post.title }}</a></h2>` pour qu'il pointe vers la page de contenu du post :{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h2><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h2>
```

{% raw %}C'est le moment parfait pour expliquer ce mystérieux `{% url 'post_detail' pk=post.pk %}`. Vous vous souvenez peut-être que la notation `{% %}` nous permet d'utiliser les balises de template Django. Cette fois-ci, nous allons utiliser des balises qui vont s'occuper de créer des URLs à notre place !{% endraw %}

La partie `post_detail` signifie que Django s'attend de trouver une URL en `blog/urls.py` avec nom = post_detail

Et qu’en est-il de `pk=post.pk` ? `pk` est l’abréviation de clé primaire (« primary key » en anglais), qui est un identifiant unique pour chaque entrée dans une base de données. Chaque modèle Django a un champ qui sert de clé primaire, et peu importe son autre nom, il peut aussi être appelé par le nom « pk ». Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a field named "id" holding a number that increases for each record, i.e. 1, 2, 3) and adds it as a field to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Maintenant si nous jetons un coup d’œil à http://127.0.0.1:8000/, nous rencontrons une erreur. Ceci est prévisible, puisque nous n'avons ni d'URL ni de *view* pour `post_detail`. L'erreur ressemble à ceci :

![Erreur NoReverseMatch](images/no_reverse_match2.png)

## Créer une URL vers le contenu d'un post

Allons créer notre URL dans le fichier `urls.py` pour notre *vue* `post_detail` !

Nous aimerions que le contenu de notre premier post s'affiche à cette **URL** : http://127.0.0.1:8000/post/1/

Allons créer une URL dans le fichier `blog/urls.py` qui dirigera Django vers une *vue* appelée `post_detail`. Cela nous permettra d'afficher l'intégralité d'un post de blog. Ouvrez le fichier `blog/urls.py` dans l’éditeur de code et ajoutez la ligne `path('post/<int:pk>/', views.post_detail, name='post_detail'),` afin que le fichier ressemble à ceci :

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

La partie `post/<int:pk>/` spécifie un modèle d’URL – allons voir plus dans le détail :

- `post/` signifie que l’URL doit commencer par le mot **post** suivie d’un **/**. OK, pas très compliqué.
- `<int:pk>`– cette partie est plus délicate. Cela signifie que Django s’attend à une valeur entière (int), qu'en suite il transférera à une vue comme variable de nom `pk`.
- `/` – il nous faut un **/** à nouveau avant la fin de l’URL.

Concrètement, cela signifie que si vous entrez `http://127.0.0.1:8000/post/5/` dans votre barre d'adresse, Django va comprendre que vous cherchez à atteindre une *vue* appelée `post_detail` et qu'il doit communiquer à cette *vue* que `pk` est égal à `5`.

OK, nous avons ajouté un nouveau modèle d’URL à `blog/urls.py` ! Actualisons la page : http://127.0.0.1:8000/ Boom ! Le serveur a cessé de marcher à nouveau. Jetez un oeil sur la console – comme prévu, il y a encore une autre erreur !

![AttributeError](images/attribute_error2.png)

Vous souvenez-vous de ce qu'il faut faire ensuite ? Il faut ajouter une vue !

## Ajouter une vue pour le contenu du post

Cette fois-ci, nous allons donner un paramètre supplémentaire à notre *vue* : `pk`. Notre *vue* va avoir besoin de le récupérer, n'est ce pas ? Pour cela, nous allons définir une fonction : `def post_detail(request, pk):`. Notez que ce paramètre doit avoir exactement le même nom que celui que nous avons spécifié dans le fichier `urls` (`pk`). Notez aussi qu’oublier de mettre cette variable est incorrect et produira une erreur !

Maintenant, nous aimerions obtenir qu'un seul blog post. Pour cela, nous allons utiliser des QuerySets qui ressemblent à ceux-ci:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Cependant, il y a un petit problème dans cette ligne de code. Si aucun de nos `Posts` ne possèdent cette `primary key (clef primaire)` (`pk`), nous allons nous retrouver avec une super erreur bien cracra!

![Erreur DoesNotExist](images/does_not_exist2.png)

Dans l'idéal, nous aimerions pouvoir éviter ça! Encore une fois, Django nous offre l'outil parfait pour ça : `get_object_or_404`. Dans le cas où il n'existerait pas de `Post` avec le `pk` indiqué, une page d'erreur beaucoup plus sympathique s'affichera : c'est ce qu'on appelle une `erreur 404 : page non trouvée`.

![Page non trouvée](images/404_2.png)

La bonne nouvelle, c'est que vous pouvez créer vous-mêmes votre page `Page non trouvée` et en faire ce que vous voulez ! Reconnaissez que ce n'est pas le plus important pour le moment donc nous allons zapper cette partie ;).

Ok, ajoutons notre *vue* à notre fichier `views.py`!

Dans le fichier `blog/urls.py` nous avons crée un modèle d'URL `post_detail` qui fait référence à la vue `views.post_detail`. En conséquence, Django s'attend à qu'une fonction `post_detail` soit définie dans le fichier `blog/views.py`.

Ouvrez maintenant le fichier `blog/views.py` dans l'éditeur de code et ajoutez la ligne suivante après les autres lignes du type `from` qui existent déjà :

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

A la fin du fichier nous ajoutons finalement notre *view* :

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Hop, réactualisons la page http://127.0.0.1:8000/

![Vue post_list](images/post_list2.png)

C'est bon, ça a marché ! Mais que ce passe-t-il lorsque nous cliquons sur un lien dans un titre de blog post ?

![Erreur TemplateDoesNotExist](images/template_does_not_exist2.png)

Oh non ! Encore une erreur ! Mais cette fois, vous savez quoi faire : nous avons besoin d'un template !

## Créer un template pour le contenu du post

Nous allons créer un fichier `post_detail.html` dans le dossier `blog/templates/blog` et nous l'ouvrons ensuite avec notre éditeur de code.

Entrez le code suivant :

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Une nouvelle fois, nous faisons hériter de `base.html`. Dans le `content` block, nous voulons afficher la date de publication d'un post (si elle existe), son titre et son texte. Mais vous souhaitez peut-être quelques éclaircissements avant, non?

{% raw %}`{% if ... %} ... {% endif %}` est une balise de template que nous pouvons utiliser si nous voulons vérifier quelque chose. (Vous souvenez-vous de `if ... else ..` que nous avons appris dans le chapitre **Introduction à Python** ?) Dans ce cas spécifique, nous voulons vérifier que `published_date` existe.{% endraw %}

Ok, vous pouvez maintenant actualiser votre page et voir si `TemplateDoesNotExist` a enfin disparu.

![Page détaillée d'un post](images/post_detail2.png)

Yay ! Ça marche!

# C'est le moment de deployer !

Ce serait bien de mettre à jour la version de notre site sur PythonAnywhere. On s'accroche et on déploie encore une fois :)

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Puis, dans la console bash de [PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(N’oubliez pas de remplacer `<your-pythonanywhere-domain>` avec votre propre sous-domaine PythonAnywhere, sans les chevrons.)

## Mise à jour des fichiers statiques sur le serveur

Des serveurs comme PythonAnywhere réservent un traitement particuliers aux "fichiers statiques" (par exemple les fichiers CSS), notamment afin de les charger plus rapidement. En conséquence, à chaque fois que nos fichiers CSS changent, nous devons executer une commande pour que le serveur les mette à jour. Cette commande s'appelle `collectstatic`.

Démarrez en activant votre virtualenv, s'il n'est pas toujours actif (PythonAnywhere propose la commande `workon`, ce qui est l'équivalent de `source myenv/bin/activate` sur votre ordinateur) :

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ workon <your-pythonanywhere-domain>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

La commande `manage.py collectstatic` nous rappelle un peu `manage.py migrate`. Nous apportons des changements à notre code, puis nous disons à Django *d'appliquer* ces changements, que ce soit pour la gestion des fichiers statiques ou pour la structure de la base de données.

Maintenant nous sommes prêtes à aller sur [« Web »](https://www.pythonanywhere.com/web_app_setup/) (depuis le menu en haut à droite de la console), appuyer sur **Reload** et voir les résultats à votre adresse https://sous-domaine.pythonanywhere.com.

Normalement, ça devrait suffire ! Encore bravo :)