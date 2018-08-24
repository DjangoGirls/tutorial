# Django ORM és QuerySet-ek

Ebben a fejezetben megtanulod, hogy hogyan kapcsolódik az adatbázishoz a Django, és hogyan tárol benne adatokat. Ugorjunk fejest!

## Mi a QuerySet?

A QuerySet is, in essence, a list of objects of a given Model. QuerySets allow you to read the data from the database, filter it and order it.

A legkönnyebb, ha példákon keresztül tanulod meg. Próbáljuk csak ki!

## Django shell

Nyisd meg a lokális konzolodat (nem a PythonAnywhere-ét), és gépeld be ezt a parancsot:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Ezt fogod látni:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

You're now in Django's interactive console. It's just like the Python prompt, but with some additional Django magic. :) You can use all the Python commands here too.

### Az összes objektum

Először is próbáljuk meg az összes posztot megjeleníteni. A következő paranccsal tudod megtenni:

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

### Objektum létrehozása

Így hozhatsz létre egy új Post objektumot az adatbázisodban:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

But we have one missing ingredient here: `me`. We need to pass an instance of `User` model as an author. How do we do that?

Először importáljuk az User modellt:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Milyen felhasználók vannak az adatbázisban? Próbáld meg ezt:

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

Most pedig végre létrehozhatjuk a posztot:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

Hurrá! Meg akarod nézni, hogy működött-e?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Ott is van, egy újabb poszt a listában!

### Hozz létre még néhány posztot

You can now have a little fun and add more posts to see how it works. Add two or three more and then go ahead to the next part.

### Objektumok filterezése

A big part of QuerySets is the ability to filter them. Let's say we want to find all posts that user ola authored. Itt a `filter`-t fogjuk használni az `all` helyett a `Post.objects.all()`-ban. In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. The way to write it in Django is `author=me`. Most így néz ki a kódunk:

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

> **Note** A `title` és a `contains` (vagyis 'tartalmaz') között két underscore karakter (`_`) van. Django's ORM uses this rule to separate field names ("title") and operations or filters ("contains"). If you use only one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

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

Aztán közzétesszük a `publish` methoddal:

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

### Objektumok sorbarendezése

A QuerySetek segítségével sorba is rendezheted az objektumok listáját. Először próbáljuk meg a létrehozás dátuma (`created_date` mező) alapján rendezni őket:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Meg is fordíthatjuk a sorrendet, ha az elejére egy `-` jelet teszünk:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### QuerySetek összefűzése

A QuerySeteket kombinálhatod is, ha összefűződ őket (**chaining**):

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

Ez egy nagyon hatékony módszer, és a segítségével bonyolult query-ket írhatsz.

Remek! Most már készen állsz a következő részre! Hogy kilépj a shellből, gépeld be ezt:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```