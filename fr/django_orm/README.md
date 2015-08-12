# Django ORM and QuerySets

Dans ce chapitre, nous allons apprendre comment Django se connecte à la base de données et comment il y enregistre des choses. On respire un grand coup et on y va!

## Qu'est-ce qu'un QuerySet?

Un QuerySet est, par essence, une liste d'objets d'un modèle donné. C'est ce qui vous permet de lire, trier et organiser, des données présentes dans une base de données.

Il est plus simple d'apprendre avec un exemple. Et si nous nous intéressions à celui-ci?

## Le shell Django

Ouvrez votre console et tapez cette commande:

    (myvenv) ~/djangogirls$ python manage.py shell
    

Ceci devrait maintenant s'afficher dans votre console:

    (InteractiveConsole)
    >>>
    

Vous êtes maintenant dans la console interactive de Django. C'est comme celle de Python, mais avec toute la magie qu'apporte Django :). Du coup, les commandes Python sont aussi utilisables dans cette console.

### Lister tous les objets

Essayons tout d'abord d'afficher tous nos posts. Vous pouvez le faire à l'aide de cette commande:

    >>> Post.objects.all()
    Traceback (most recent call last):
          File "<console>", line 1, in <module>
    NameError: name 'Post' is not defined
    

Ooops! Voilà que ça nous renvoie une erreur! Cela nous dit qu'il n'existe pas de Post. En effet, nous avons oublié de commencer par un "import"!

    >>> from blog.models import Post
    

Rien de compliqué: nous importons le modèle `Post` depuis notre `blog.models`. Essayons à nouveau la commande précédente:

    >>> Post.objects.all()
    []
    

Ce double crochet signifie que notre liste est vide. Ce qui est totalement correct: nous n'avons pas encore créé de post! Corrigeons ça de suite.

### Créer des objets

Voilà comment créer un objet Post dans notre base de données:

    >>> Post.objects.create(author=moi, title='Exemple de titre', text='Test')
    

Cependant, il nous manque un petit quelque chose: `moi`. Nous avons besoin de lui passer une instance du modèle `User` en guise d'auteur (author). Comment faire?

Tout d'abord, il nous faut importer le modèle User:

    >>> from django.contrib.auth.models import User
    

Avons-nous des utilisateurs dans notre base de données? Voyons voir:

    >>> User.objects.all()
    []
    

Nous n'avons pas d'utilisateur! Il nous faut donc nous en créer un:

    >>> User.objects.create(username='ola')
    <User: ola>
    

Avons-nous bien créé un utilisateur dans notre base de données? Pour le savoir, tapons la commande suivante:

    >>> User.objects.all()
    [<User: ola>]
    

Cool! L'utilisateur que nous avons créé dans cet exemple s'appelle Ola. Essayons maintenant d'obtenir l'instance de cet utilisateur:

    moi = User.objects.get(username='ola')
    

Comme vous pouvez le voir, nous obtenons (`get`) un utilisateur (`User`) avec comme nom d'utilisateur (`username`) 'ola'. Cool! Bien sûr, vous pouvez utiliser votre nom si vous le souhaitez.

Maintenant, nous pouvons enfin créer notre premier post:

    >>> Post.objects.create(author = moi, title = 'Exemple de titre', text = 'Test')
    

Youpi! Et si on vérifiait quand même si ça a marché?

    >>> Post.objects.all()
    [<Post: Exemple de titre>]
    

### Ajouter plus de posts

Amusez-vous à ajouter plusieurs posts avec ce que nous venons de voir. Ajoutez en deux ou trois puis passez à la suite.

### Filtrer les objets

L'intérêt des QuerySets, c'est qu'on peut les filtrer. Disons que nous voulons trouver les posts écrits par l'utilisateur Ola. Nous allons utiliser `filter` à la place de `all` dans `Post.objects.all()`. Les parenthèses vont nous servir à préciser le⋅s condition⋅s nécessaire⋅s aux différents posts pour qu'ils puissent se retrouver dans notre QuerySet. Dans notre exemple, `author` est égal à `moi`. La manière de le dire en Django c'est: `author=moi`. Maintenant, votre bout de code doit ressembler à ceci:

    >>> Post.objects.filter(author=moi)
    [<Post: Exemple de titre>, <Post: Deuxième post>, <Post: Troisième post!>, <Post: Quatrième titre de post!>]
    

Et si nous voulions chercher les posts qui contiennent uniquement le mot "titre" dans le champs `title`?

    >>> Post.objects.filter(title__contains='title')
    [<Post: Exemple de titre>, <Post: Quatrième titre de post!>]
    

> **Note** Il y a deux tirets bas (`_`) entre `title` et `contains`. L'ORM de Django utilise cette syntaxe afin de séparer les noms de champ ("title") et les opérations ou les filtres ("contains"). Si vous n'utilisez qu'un seul tiret bas, vous allez obtenir une erreur du type: "FieldError: Cannot resolve keyword title_contains".

Vous pouvez aussi obtenir une liste de tous les posts publiés. Pour cela, nous allons seulement conserver les posts qui possèdent une date de publication (`published_date`):

    >>> Post.objects.filter(published_date__isnull=False)
    []
    

Malheureusement, aucun de nos posts n'a été publié pour l'instant. Changeons ça! Tout d'abord, obtenons une instance du post que nous souhaitons publier:

    >>> post = Post.objects.get(id=1)
    

Ensuite, publions-le grâce à notre méthode `publish`!

    >>> post.publish()
    

Réessayons d'obtenir une liste des posts publiés (pour aller plus vite, appuyez trois fois sur la flèche du haut de votre clavier et appuyer sur entrer):

    >>> Post.objects.filter(published_date__isnull=False)
    [<Post: Exemple de titre>]
    

### Classer les objets

Les QuerySets vous permettent aussi de classer des listes d'objets. Essayons de les classer par date de création (champ `created_date`):

    >>> Post.objects.order_by('created_date')
    [<Post: Exemple de titre>, <Post: Deuxième post>, <Post: Troisième post!>, <Post: Quatrième titre de post!>]
    

Nous pouvons inverser l'ordre en mettant un `-` au début du nom de notre champ:

    >>> Post.objects.order_by('-created_date')
    [<Post: Quatrième titre de post!>,  <Post: Troisième post!>, <Post: Deuxième post>, <Post: Exemple de titre>]
    

Cool! Maintenant, vous êtes prêt⋅e à passer à la partie suivante! Pour fermer le shell, tapez ceci:

    >>> exit()
    $
