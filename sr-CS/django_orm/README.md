# Django ORM i Query postavke

U ovom poglavlju ćemo naučiti kako se Django povezuje sa bazom podataka i kako čuva te podatke. Hajde da to otkrijemo!

## Šta su to Query postavke?

Query postavke (eng. QuerySets) su lista objekata za dati model. One omogućavaju da čitate podatke iz baze, da ih filtrirate i sortirate.

Najlakše je da to naučite na primeru. Hajde da to pokušamo, hoćemo li?

## Django shell

Otvorite Vašu lokalnu konzolu (ne onu na PythonAnywhere) i ukucajte ovu komandu:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Trebalo bi da dobijete ovo:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

Sada ste u Django interaktivnoj konzoli. To je nešto slično Python konzoli, samo sa dodatnim Django efektima :) Ovde takođe možete da koristite Python naredbe.

### Svi objekti

Hajde prvo da pokušamo da prikažemo sve naše postove. To možete da uradite sledećom komandom:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Ups! Pojavila se greška koja nam govori da post ne postoji. To je tačno - zaboravili smo da ga prvo uvezemo!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

Uvešćemo model `Post` iz `blog.models`. Hajde da sada ponovo pokušamo da prikažemo sve postove:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

Ovo je lista postova koje smo ranije kreirali. To smo učinili koristeći Django admin interfejs. Ali sada želimo da kreiramo nove postove koristeći Python. Kako ćemo to da uradimo?

### Kreirajte objekat

Ovo je način na koji kreirate novi post objekat u bazi podataka:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Ali nam nešto ovde nedostaje: `mi`. Potrebno je da prosledimo instancu modela `korisnik` kao autora. Kako da to uradimo?

Hajde da prvo uvezemo model korisnika:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Koje sve korisnike imamo u našoj bazi podataka? Pokušajte ovo da ukucate:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

Ovo je super korisnik, kog smo kreirali ranije! Hajde da sada dobijemo instancu korisnika (prilagodite ovu liniju tako da u njoj piše Vaše korisničko ime):

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

Kao što možete da vidite, sada dobijamo `korisnika` sa `korisničkim imenom` 'ola'. Odlično!

Sada konačno možemo da kreiramo naš post:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

Uspeli smo! Želite li da proverite da li radi?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Evo ga, još jedan post na listi!

### Dodajte još postova

Sada možete i da se malo zabavite i da dodajete još postova kako biste razumeli kako ovo funkcioniše. Dodajte još 2-3 posta i pređite na naredni deo.

### Filtrirajte objekte

Važan deo Query postavki je mogućnost da ih filtrirate. Hajde da pokušamo da pronađemo sve postove koje je kreirao korisnik "ola". Koristićemo `filter` umesto `all` u `Post.objects.all()`. In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. The way to write it in Django is `author=me`. Now our piece of code looks like this:

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

> **Note** There are two underscore characters (`_`) between `title` and `contains`. Django's ORM uses this rule to separate field names ("title") and operations or filters ("contains"). If you use only one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

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

And then publish it with our `publish` method:

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

### Ordering objects

QuerySets also allow you to order the list of objects. Let's try to order them by `created_date` field:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

We can also reverse the ordering by adding `-` at the beginning:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Complex queries through method-chaining

As you saw, some methods on `Post.objects` return a QuerySet. The same methods can in turn also be called on a QuerySet, and will then return a new QuerySet. Thus, you can combine their effect by **chaining** them together:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

This is really powerful and lets you write quite complex queries.

Cool! You're now ready for the next part! To close the shell, type this:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```