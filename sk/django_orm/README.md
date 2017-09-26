# Django ORM a QuerySety

V tejto kapitole sa naučíš, ako sa Django pripája k databáze a ukladá do nej údaje. Poďme na to!

## Čo je QuerySet?

A QuerySet is, in essence, a list of objects of a given Model. QuerySets allow you to read the data from the database, filter it and order it.

Najjednoduchšie bude ukázať si to na príklade. Vyskúšajme si to.

## Django shell (konzola)

Otvor svoju lokálnu konzolu (nie na PythonAnywhere) a napíš tento príkaz:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Malo by to mať tento efekt:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

You're now in Django's interactive console. It's just like the Python prompt, but with some additional Django magic. :) You can use all the Python commands here too, of course.

### Všetky objekty

Skúsme najskôr zobraziť všetky naše príspevky. To môžeš urobiť týmto príkazom:

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

This is simple: we import the model `Post` from `blog.models`. Let's try displaying all posts again:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

This is a list of the posts we created earlier! We created these posts using the Django admin interface. But now we want to create new posts using Python, so how do we do that?

### Vytvorenie objektu

Takto vytvoríš nový Post objekt v databáze:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

But we have one missing ingredient here: `me`. We need to pass an instance of `User` model as an author. How do we do that?

Najskôr naimportujme User model:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Akých užívateľov máme v našej databáze? Skús toto:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

This is the superuser we created earlier! Let's get an instance of the user now:

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

As you can see, we now `get` a `User` with a `username` that equals 'ola'. Neat! Of course, you have to adjust this line to use your own username.

Teraz už konečne môžeme vytvoriť náš prvý príspevok:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Hurá! Chceš si overiť, či to fungovalo?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Je to tam, jeden príspevok v zozname pribudol!

### Pridaj viac príspevkov

You can now have a little fun and add more posts to see how it works. Add two or three more and then go ahead to the next part.

### Filtrovanie objektov

A big part of QuerySets is the ability to filter them. Let's say we want to find all posts that user ola authored. Použijeme `filter` namiesto `all` v príkaze `Post.objects.all()`. In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. The way to write it in Django is `author=me`. Náš kúsok kódu bude teraz vyzerať takto:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=ja)
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

Or maybe we want to see all the posts that contain the word 'title' in the `title` field?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
[<Post: Sample title>, <Post: 4th title of post>]
```

> **Poznámka** Medzi `title` a `contains` sú dva podčiarkovníky (`_`). Django's ORM uses this rule to separate field names ("title") and operations or filters ("contains"). If you use only one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

You can also get a list of all published posts. We do this by filtering all the posts that have `published_date` set in the past:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
[]
```

Unfortunately, the post we added from the Python console is not published yet. But we can change that! First get an instance of a post we want to publish:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

And then publish it with our `publish` method:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Now try to get list of published posts again (press the up arrow key three times and hit `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
[<Post: Sample title>]
```

### Radenie objektov

QuerySety tiež umožňujú zoradiť zoznamy objektov. Skúsme ich zoradiť podľa dátumu vytvorenia (pole `created_date`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

Môžeme ich tiež zoradiť naopak pridaním `-` na začiatok:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
[<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]
```

### Reťazenie QuerySetov

QuerySety môžeš dokonca kombinovať pomocou **reťazenia**:

    >>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    

To je skutočne mocný nástroj, s ktorým môžeš písať dosť komplexné požiadavky (queries).

Super! Teraz už si pripravená na ďalšiu časť! Shell zatvoríš príkazom:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```