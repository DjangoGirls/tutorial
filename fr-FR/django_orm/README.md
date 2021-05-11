# L'ORM Django et les QuerySets

Dans ce chapitre, nous allons apprendre comment Django se connecte à la base de données et comment il y enregistre des choses. On respire un grand coup et on y va !

## Qu'est-ce qu'un QuerySet ?

Un QuerySet est, par essence, une liste d'objets d'un modèle donné. C'est ce qui vous permet de lire, trier et organiser, des données présentes dans une base de données.

Il est plus simple d'apprendre avec un exemple. Et si nous nous intéressions à celui-ci ?

## Le shell Django

Ouvrez la console de votre ordinateur (et non celle de PythonAnywhere) et tapez la commande suivante :

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Ceci devrait maintenant s'afficher dans votre console :

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

Vous êtes maintenant dans la console interactive de Django. C'est comme celle de Python, mais avec toute la magie qu'apporte Django :). Les commandes Python sont aussi utilisables dans cette console.

### Lister tous les objets

Essayons tout d'abord d'afficher tous nos posts. Vous pouvez le faire à l'aide de cette commande :

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Oups ! Voilà que ça nous renvoie une erreur qui nous dit qu'il n'existe pas de Post. En effet, nous avons oublié de commencer par un "import" !

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

Nous importons le modèle `Post` depuis notre `blog.models`. Essayons à nouveau la commande précédente :

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

Cela nous permet d'obtenir une liste des posts que nous avons créés tout à l'heure ! Rappelez-vous : nous avions créé ces posts à l'aide de l'interface d'administration de Django. Cependant, nous aimerions maintenant créer de nouveaux posts à l'aide de python : comment allons-nous nous y prendre ?

### Créer des objets

Voici comment créer un nouveau objet Post dans la base de données :

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Cependant, il nous manque un petit quelque chose : `moi`. Nous avons besoin de lui passer une instance du modèle `User` en guise d'auteur (author). Comment faire ?

Tout d'abord, il nous faut importer le modèle User :

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Avons-nous des utilisateurs dans notre base de données ? Voyons voir :

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

Il s'agit du superutilisateur que nous avons crée tout à l'heure ! Sauvegardons une instance de cet utilisateur (modifie la ligne suivante avec ton nom d'utilisateur) :

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

Comme vous pouvez le constater, nous avons maintenant obtenu (`get`) un utilisateur (`User`) avec un nom d’utilisateur `username` qui est égale à « ola ». Très bien !

Nous allons enfin pouvoir créer notre post :

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

Et voilà ! Vous aimeriez voir ci ça a vraiment marché ?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Et voilà : un post de plus dans la liste !

### Ajouter plus de posts

Amusez-vous à ajouter d'autres posts pour vous entrainer un peu. Essayez d'ajouter deux ou trois posts en plus puis passez à la partie suivante.

### Filtrer les objets

L'intérêt des QuerySets, c'est que l'on peut les filtrer. Disons que nous aimerions retrouver tous les posts écrits par l'utilisateur Ola. Pour cela, nous allons utiliser `filter` à la place de `all` dans `Post.objects.all()`. Les parenthèses vont nous servir à préciser quelles sont les conditions auxquelles un post de blog doit se conformer pour être retenu par notre queryset. Dans notre exemple, la condition est que `author` soit égal à `me`. La manière de le dire en Django c'est : `author=me`. Maintenant, votre bout de code doit ressembler à ceci:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Et si nous voulions chercher les posts qui contiennent uniquement le mot "titre" ("title" en anglais) dans le champs `title`?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Note** Il y a deux tirets bas (`_`) entre `title` et `contains`. L'ORM de Django utilise cette règle afin de séparer les noms de champ ("title") et les opérations ou les filtres ("contains"). Si vous n'utilisez qu'un seul tiret bas, vous allez obtenir une erreur du type : "FieldError: Cannot resolve keyword title_contains".

Vous pouvez aussi obtenir une liste de tous les posts publiés. Pour cela, nous allons filtrer les posts qui possèdent une date de publication (`published_date`) dans le passé :

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Malheureusement, le post que nous avons créé dans la console Python n'est pas encore publié. Allons corriger ce problème ! Dans un premier temps, nous aimerions obtenir une instance du post que nous voulons publier :

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

Ensuite, publions-le grâce à notre méthode `publish`:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Maintenant, essayez d'obtenir à nouveau la liste des posts publiés (appuyez trois fois sur la flèche du haut, puis `entrée`) :

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### Classer les objets

Les QuerySets permettent aussi de trier la liste des objets. Essayons de les trier par le champs `created_date` :

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

On peut aussi inverser l'ordre de tri en ajouter `-` au début:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Requêtes complexes grâce au chaînage des méthodes

Comme vous l'avez vu, quand on applique certaines méthodes à `Post.objects` on obtient un QuerySet en résultat. Les mêmes méthodes peuvent également être appliquées sur un QuerySet, ce qui ensuite donnera lieu à un nouveau QuerySet. Ainsi, vous pouvez combiner leur effet en les **enchaînant** l'une après l'autre :

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

C'est un outil très puissant qui va vous permettre d'écrire des requêtes complexes.

Génial ! Vous êtes maintenant prête à passer à l'étape suivante ! Pour fermer le shell, tapez ceci:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```