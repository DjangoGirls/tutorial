# Données dynamiques dans les templates

Nous avons différents morceaux en place : le modèle `Post` qui est définit dans le fichier `models.py`, la vue `post_list` dans `views.py` et nous venons de créer notre template. Mais comment allons-nous faire pour faire apparaître nos posts dans notre template HTML ? Car au final, n'est-ce pas le but que nous souhaiterions atteindre ? Nous aimerions prendre du contenu, en l’occurrence notre modèle sauvegardé dans notre base de données, et réussir à joliment l'afficher dans notre template.

C'est à ça que servent les *vues* : connecter les modèles et les templates. Dans notre *vue* `post_list`, nous allons avoir besoin de prendre les modèles dont nous avons besoin et de les passer au template. C'est dans la *vue* que nous allons décider ce qui va s'afficher (quel modèle) dans un template.

Ok, et sinon, on fait comment ?

Nous allons avoir besoin d'ouvrir le fichier `blog/views.py` dans l'éditeur de code. Pour l'instant, la *vue* `post_list` ressemble à ceci :

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Est-ce que vous vous souvenez de comment rajouter des morceaux de code écris dans d'autres fichiers ? Nous en avons parlé dans un chapitre précédent. Nous allons devoir importer notre modèle qui est défini dans le fichier `models.py`. Pour cela, nous allons ajouter la ligne `from .models import Post` de la façon suivante :

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

Le point avant `models` signifie *dossier courant* ou *application courante*. Les fichiers `views.py` et `models.py` sont dans le même répertoire. Cela signifie que nous pouvons utiliser `.` suivi par le nom du fichier (sans `.py`). Ensuite, nous importons le modèle (`Post`).

Ok, et après ? Afin de pouvoir aller chercher les véritables posts de blog de notre modèle `Post`, nous avons besoin de quelque chose qui s'appelle un `QuerySet`.

## QuerySet

Normalement, ce mot doit vous évoquer quelque chose. Nous en avons un peu parlé dans la section [Django ORM (QuerySets)](../django_orm/README.md).

Maintenant, nous allons nous intéresser à comment publier les post classés par date de publication (`published_date`). Ça tombe bien, on a déjà fait ça dans la section sur les QuerySets !

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Ouvrons donc le fichier `blog/views.py` dans l’éditeur de code et ajoutons le morceau de code suivant à la fonction `def post_list(request)`. N’oubliez pas d’ajouter d’abord `from django.utils import timezone`.

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

To display our QuerySet on our blog's post list, we have two things left to do:

1. Pass the `posts` QuerySet to the template context, by changing the `render` function call. We'll do this now.
2. Modify the template to display the `posts` QuerySet. We'll cover this in a later chapter.

Veuillez noter que nous créons une *variable* pour notre QuerySet : `posts`. Considérez que c'est le nom de notre QuerySet. À partir de maintenant, nous allons pouvoir faire référence à notre QuerySet en utilisant ce nom.

Dans la fonction `render`, nous avons un paramètre `request`, qui désigne tout ce que nous recevons d'un utilisateur par l'intermédiaire d'Internet, et un autre qui signale le fichier template (`'blog/post_list.html'`). Le dernier paramètre, `{}`, va nous permettre de glisser des informations que notre template va utiliser. Nous devons donner des noms à ces informations (nous allons rester sur `'posts'` pour le moment). :) Ça va ressembler à ça : `{'posts': posts}`. La partie située avant `:` est une chaine de caractères ; vous devez donc l'entourer de guillemets : `''`.

Au final, notre fichier `blog/views.py` doit ressembler à ceci maintenant :

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

Et voilà, c'est bon ! Nous allons retourner du côté de notre template pour que notre QuerySet puisse s'afficher correctement !

Si vous voulez en savoir plus sur les QuerySets, n'hésitez pas à consulter la documentation officielle du framework : https://docs.djangoproject.com/en/2.2/ref/models/querysets/