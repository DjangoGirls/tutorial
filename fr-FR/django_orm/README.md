# L'ORM Django et les QuerySets

Dans ce chapitre, nous allons apprendre comment Django se connecte à la base de données et comment il y enregistre des choses. On respire un grand coup et on y va !

## Qu'est-ce qu'un QuerySet ?

A QuerySet is, in essence, a list of objects of a given Model. QuerySets allow you to read the data from the database, filter it and order it.

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

You're now in Django's interactive console. It's just like the Python prompt, but with some additional Django magic. :) You can use all the Python commands here too.

### Lister tous les objets

Essayons tout d'abord d'afficher tous nos posts. Vous pouvez le faire à l'aide de cette commande :

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Oops! An error showed up. It tells us that there is no Post. It's correct – we forgot to import it first!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

We import the model `Post` from `blog.models`. Let's try displaying all posts again:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

This is a list of the posts we created earlier! We created these posts using the Django admin interface. But now we want to create new posts using Python, so how do we do that?

### Créer des objets

Voici comment créer un nouveau objet Post dans la base de données :

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

But we have one missing ingredient here: `me`. We need to pass an instance of `User` model as an author. How do we do that?

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

This is the superuser we created earlier! Let's get an instance of the user now (adjust this line to use your own username):

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

As you can see, we now `get` a `User` with a `username` that equals 'ola'. Neat!

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

You can now have a little fun and add more posts to see how it works. Add two or three more and then go ahead to the next part.

### Filtrer les objets

A big part of QuerySets is the ability to filter them. Let's say we want to find all posts that user ola authored. Pour cela, nous allons utiliser `filter` à la place de `all` dans `Post.objects.all()`. In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. The way to write it in Django is `author=me`. Maintenant, votre bout de code doit ressembler à ceci:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Or maybe we want to see all the posts that contain the word 'title' in the `title` field?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Note** Il y a deux tirets bas (`_`) entre `title` et `contains`. Django's ORM uses this rule to separate field names ("title") and operations or filters ("contains"). If you use only one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

You can also get a list of all published posts. We do this by filtering all the posts that have `published_date` set in the past:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Unfortunately, the post we added from the Python console is not published yet. But we can change that! First get an instance of a post we want to publish:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

Ensuite, publions-le grâce à notre méthode `publish`:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Now try to get list of published posts again (press the up arrow key three times and hit `enter`):

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

### Chainer les QuerySets

Vous pouvez aussi combiner les QuerySets and les **chainant** les unes aux autres :

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