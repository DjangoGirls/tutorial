# Django ORM a QuerySets

V této kapitole se naučíš jak se Django spojuje s databází a jak do ní ukládá data. Pojďme na to!

## Co je QuerySet?

A QuerySet is, in essence, a list of objects of a given Model. QuerySets allow you to read the data from the database, filter it and order it.

Je snazší naučit se to na příkladu. Pojďme to zkusit, můžeme?

## Django shell

Otevři svou lokání konzoli (ne na Python Anywhere) a napiš tento příkaz:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Mělo by to mít takovýto efekt:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

You're now in Django's interactive console. It's just like the Python prompt, but with some additional Django magic. :) You can use all the Python commands here too.

### Všechny objekty

Pojďme zkusit zobrazit všechny naše příspěvky. To můžeš udělat následujícím příkazem:

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

### Vytvoř objekt

Takhle vytvoříš nový Post objekt v databázi:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=ja, title='titulek', text='Test')
```

But we have one missing ingredient here: `me`. We need to pass an instance of `User` model as an author. How do we do that?

Nejdříve pojďme importovat User model:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Jaké uživatele máme v naší databázi? Zkus tohle:

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

Teď můžeme konečně vytvořit příspěvek:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

Hurá! Chceš se podívat jestli to fungovalo?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

A je to tu, další příspěvek v seznamu!

### Přidej více příspěvků

You can now have a little fun and add more posts to see how it works. Add two or three more and then go ahead to the next part.

### Filtrování objektů

A big part of QuerySets is the ability to filter them. Let's say we want to find all posts that user ola authored. V `Post.objects.all()` použijeme `filter` místo `all`. In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. The way to write it in Django is `author=me`. Teď náš kus kódu vypadá takhle:

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

> **Poznámka** Mezi `title` a `contains` jsou dvě podtržítka (`_`). Django's ORM uses this rule to separate field names ("title") and operations or filters ("contains"). If you use only one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

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

A ten publikujeme pomocí naší metody `publish`:

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

### Řazení objektů

QuerySety ti také umožňují seřadit seznam objektů. Pojďme je zkusit seřadit podle data vytvoření (`created_date`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Můžeme je také seřadit obráceně přidáním `-` na začátek:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Řetězení QuerySetů

QuerySety můžeš také kombinovat dohromady pomocí **řetězení**:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

Je to mocný nástroj který ti umožňuje psát docela komplexní query.

Cool! Teď jsi připravená na další část! Pro zavření shell konzoli zadej toto:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```