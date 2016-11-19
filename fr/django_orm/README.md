# L'ORM Django et les QuerySets

Dans ce chapitre, nous allons apprendre comment Django se connecte à la base de données et comment il y enregistre des choses. On respire un grand coup et on y va !

## Qu'est-ce qu'un QuerySet ?

Un QuerySet est, par essence, une liste d'objets d'un modèle donné. C'est ce qui vous permet de lire, trier et organiser, des données présentes dans une base de données.

Il est plus simple d'apprendre avec un exemple. Et si nous nous intéressions à celui-ci ?

## Le shell Django

Ouvrez la console de votre ordinateur (et non celle de PythonAnywhere) et tapez la commande suivante :

    (myvenv) ~/djangogirls$ python manage.py shell


Ceci devrait maintenant s'afficher dans votre console :

    (InteractiveConsole)
    >>>


Vous êtes maintenant dans la console interactive de Django. C'est comme celle de Python, mais avec toute la magie qu'apporte Django :). Du coup, les commandes Python sont aussi utilisables dans cette console.

### Lister tous les objets

Essayons tout d'abord d'afficher tous nos posts. Vous pouvez le faire à l'aide de cette commande :

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Ooops ! Voilà que ça nous renvoie une erreur qui nous dit qu'il n'existe pas de Post. En effet, nous avons oublié de commencer par un "import" !

```python
>>> from blog.models import Post
```

Rien de compliqué : nous importons le modèle `Post` depuis notre `blog.models`. Essayons à nouveau la commande précédente :

```python
>>> Post.objects.all()
[<Post: my post title>, <Post: another post title>]
```

Cela nous permet d'obtenir une liste des posts que nous avons créé tout à l'heure ! Rappelez-vous : nous avions créé ces posts à l'aide de l'interface d'administration de Django. Cependant, nous aimerions maintenant créer de nouveaux posts à l'aide de Python : comment allons-nous nous y prendre ?

### Créer des objets

Voici comment créer un nouveau objet Post dans la base de données :

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Cependant, il nous manque un petit quelque chose : `me`. Nous avons besoin de lui passer une instance du modèle `User` en guise d'auteur (author). Comment faire ?

Tout d'abord, il nous faut importer le modèle User :

```python
>>> from django.contrib.auth.models import User
```

Avons-nous des utilisateurs dans notre base de données ? Voyons voir :

```python
>>> User.objects.all()
[<User: ola>]
```

C'est le superutilisateur que nous avions créé tout à l'heure ! Essayons maintenant d'obtenir une instance de l'utilisateur :

```python
me = User.objects.get(username='ola')
```

Comme vous pouvez le voir, nous obtenons (`get`) un utilisateur (`User`) avec comme nom d'utilisateur (`username`) 'ola'. Cool ! Bien sûr, vous pouvez utiliser votre nom si vous le souhaitez.

Nous allons enfin pouvoir créer notre post :

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Youpi ! Et si on vérifiait quand même si ça a marché ?

```python
>>> Post.objects.all()
[<Post: my post title>, <Post: another post title>, <Post: Sample title>]
```

Et voilà : un post de plus dans la liste !

### Ajouter plus de posts

Amusez-vous à ajouter d'autres posts pour vous entrainer un peu. Essayez d'ajouter 2-3 posts en plus puis passez à la partie suivante.

### Filtrer les objets

L'intérêt des QuerySets, c'est que l'on peut les filtrer. Disons que nous aimerions retrouver tous les posts écrits par l'utilisateur Ola. Pour cela, nous allons utiliser `filter` à la place de `all` dans `Post.objects.all()`. Les parenthèses vont nous servir à préciser quelles sont les conditions auxquelles un post de blog doit se conformer pour être retenu par notre QuerySet. Dans notre exemple, `author` est égal à `me`. La manière de le dire en Django c'est : `author=me`. Maintenant, votre bout de code doit ressembler à ceci:

```python
>>> Post.objects.filter(author=me)
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

Et si nous voulions chercher les posts qui contiennent uniquement le mot "titre" dans le champs `title`?

```python
>>> Post.objects.filter(title__contains='title')
[<Post: Sample title>, <Post: 4th title of post>]
```

> **Note** Il y a deux tirets bas (`_`) entre `title` et `contains`. L'ORM de Django utilise cette syntaxe afin de séparer les noms de champ ("title") et les opérations ou les filtres ("contains"). Si vous n'utilisez qu'un seul tiret bas, vous allez obtenir une erreur du type : "FieldError: Cannot resolve keyword title_contains".

Comment obtenir une liste de tous les posts publiés ? Cela se fait facilement en filtrant tous les posts qui ont une date de publication, `published_date`, dans le passé :

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
```

Malheureusement, le post que nous avons créé dans la console Python n'est pas encore publié. Allons corriger ce problème ! Dans un premier temps, nous aimerions obtenir une instance du post que nous voulons publier :

```python
>>> post = Post.objects.get(title="Sample title")
```

Ensuite, publions-le grâce à notre méthode `publish`!

```python
>>> post.publish()
```

Maintenant, essayez d'obtenir à nouveau la liste des posts publiés. Pour cela, appuyez trois fois sur la flèche du haut et appuyez sur `entrée` :

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
[<Post: Sample title>]
```

### Classer les objets

Les QuerySets permettent aussi de trier la liste des objets. Essayons de les trier par le champ `created_date` :

```python
>>> Post.objects.order_by('created_date')
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

On peut aussi inverser l'ordre de tri en ajouter `-` au début:

```python
>>> Post.objects.order_by('-created_date')
[<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]
```

### Chainer les QuerySets

Vous pouvez aussi combiner les QuerySets and les **chainant** les unes aux autres :

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

C'est un outil très puissant qui va vous permettre d'écrire des requêtes complexes.

Génial ! Vous êtes maintenant prête à passer à l'étape suivante ! Pour fermer le shell, tapez ceci:

```python
>>> exit()
$
```
