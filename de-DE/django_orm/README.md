# Django ORM (Querysets)

In diesem Kapitel lernst du, wie sich Django mit der Datenbank verbindet und Daten darin speichert. Lass uns loslegen!

## Was ist ein QuerySet?

Zusammengefasst ist ein QuerySet eine Liste von Objekten eines bestimmten Models. QuerySets erlauben dir, Daten aus der Datenbank zu lesen, zu filtern und zu sortieren.

Am besten wir sehen uns das an einem Beispiel an. Versuchen wir's?

## Django Shell

Öffne deine lokale Konsole (nicht in PythonAnywhere) und tippe dieses Kommando ein:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Das sollte angezeigt werden:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole) >>>
```

Nun bist du in der Interaktiven Konsole von Django. Die funktioniert wie der Python-Prompt, aber hat noch etwas zusätzliche Django-Magie. :) Du kannst hier natürlich auch alle Python-Befehle verwenden.

### Alle Objekte

Zunächst wollen wir alle unsere Blogposts ansehen. Das kannst du mit folgendem Kommando erreichen:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Hoppla! Eine Fehlermeldung ist erschienen. Sie sagt uns, dass Python "Post" nicht kennt. Und sie hat recht: Wir vergaßen das zu importieren!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

Wir importieren das Model `Post` aus `blog.models`. Versuchen wir nochmal, alle Posts anzuzeigen:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

Das ist eine Liste all der Posts, die wir zuvor erstellt haben! Wir haven diese Posts mit der Django-Admin-Oberfläche erstellt. Aber nun wollen wir weitere Posts mit Python erstellen! Wie geht das also?

### Objekt erstellen

So erstellst du ein neues Post-Objekt in der Datenbank:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Allerdings fehlt noch eine Zutat: `me`. Wir müssen eine Instanz des Models `User` als Autor übergeben. Wie macht man das?

Als Erstes müssen wir das User Model importieren:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Welche User sind in unserer Datenbank vorhanden? Finde es damit heraus:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

Das ist der Superuser, den wir vorhin erstellt haben! Lass uns jetzt eine Instanz des Users erstellen:

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

As you can see, we now `get` a `User` with a `username` that equals 'ola'. Neat! Of course, you have to adjust this line to use your own username.

Jetzt können wir schließlich unseren Post erstellen:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

Super! Wollen wir nachsehen, ob es funktioniert hat?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Da ist er, ein weiterer Post in der Liste!

### Mehrere Posts hinzufügen

You can now have a little fun and add more posts to see how it works. Add two or three more and then go ahead to the next part.

### Objekte filtern

A big part of QuerySets is the ability to filter them. Let's say we want to find all posts that user ola authored. Dafür nehmen wir `filter` statt `all` in `Post.objects.all()`. In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. The way to write it in Django is `author=me`. Jetzt sieht unser Code folgendermaßen aus:

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

> **Anmerkung:** Zwischen `title` und `contains` befinden sich zwei Unterstriche (`__`). Django's ORM uses this rule to separate field names ("title") and operations or filters ("contains"). If you use only one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

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

Dann publizieren wir ihn mit unserer `publish`-Methode:

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

### Objekte ordnen

Mit den QuerySets kannst du eine Liste auch nach bestimmten Kriterien ordnen. Lass uns das mit dem `created_date` Feld ausprobieren:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Wir können die Reihenfolge auch umdrehen, indem wir "`-`" davor schreiben:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Verkettung von QuerySets

Du kannst auch QuerySets kombinieren, indem du sie **verkettest**:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

Dies ist wirklich mächtig und lässt dich ziemlich komplexe Abfragen schreiben.

Cool! Jetzt bist du bereit für den nächsten Teil! Um die Konsole zu schließen, schreib das:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
```