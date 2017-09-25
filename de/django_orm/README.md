# Django ORM (Querysets)

In diesem Kapitel lernst du, wie sich Django mit der Datenbank verbindet und Daten darin speichert. Lass uns loslegen!

## Was ist ein QuerySet?

Ein QuerySet ist im Wesentlichen eine Liste von Objekten eines bestimmten Models. Mit dem QuerySet kann man Daten aus der Datenbank auslesen, filtern und ordnen.

Am besten wir sehen uns das an einem Beispiel an. Versuchen wir's?

## Django Shell

Öffne deine lokale Konsole (nicht in PythonAnywhere) und tippe dieses Kommando ein:

```
(myvenv) ~/djangogirls$ python manage.py shell
```

Das sollte angezeigt werden:

```python
(InteractiveConsole)
>>>
```

Du befindest dich jetzt in Djangos interaktiver Konsole. Das ist fast das gleiche wie die Python-Prompt, aber besitzt etwas zusätzliche Django-Magie :) . Natürlich sind alle Python Kommandos hier trotzdem vorhanden.

### Alle Objekte

Zunächst wollen wir alle unsere Blogposts ansehen. Das kannst du mit folgendem Kommando erreichen:

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Ups! Das gibt einen Fehler. Die Konsole sagt uns, dass es noch keine Posts gibt. Das stimmt! Wir haben vergessen, diese vorher zu importieren!

```python
>>> from blog.models import Post
```

Das lässt sich einfach ändern: Wir importieren `Post` aus `blog.models`. Jetzt versuchen wir nochmal, alle Posts anzeigen zu lassen:

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

Das ist die Liste, die wir vorhin erstellt haben! Wir haben diese Posts über die Django Admin Oberfläche erstellt. Aber jetzt wollen wir mit Python neue Einträge erstellen, also wie machen wir das?

### Objekt erstellen

So erstellst du ein neues Post-Objekt in der Datenbank:

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Allerdings fehlt noch eine Zutat: `me`. Wir müssen eine Instanz des Models `User` als Autor übergeben. Wie macht man das?

Als Erstes müssen wir das User Model importieren:

```python
>>> from django.contrib.auth.models import User
```

Welche User sind in unserer Datenbank vorhanden? Finde es damit heraus:

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

Das ist der Superuser, den wir vorhin erstellt haben! Lass uns jetzt eine Instanz des Users erstellen:

```python
>>> me = User.objects.get(username='ola')
```

Wie du siehst, haben wir jetzt ein `User`-Objekt mit einem `username` 'ola'. Schön! Natürlich verwendest du hier deinen eigenen Benutzernamen.

Jetzt können wir schließlich unseren Post erstellen:

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Super! Wollen wir nachsehen, ob es funktioniert hat?

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Da ist er, ein weiterer Post in der Liste!

### Mehrere Posts hinzufügen

Du kannst jetzt noch ein bisschen damit rumprobieren und noch weitere Posts hinzufügen. Erstelle noch zwei oder drei weitere und geh dann zum nächsten Punkt.

### Objekte filtern

Eine wichtige Eigenschaft von QuerySets ist, dass die Einträge gefiltert werden können. Zum Beispiel wollen wir alle Posts des Users Ola finden. Dafür nehmen wir `filter` statt `all` in `Post.objects.all()`. In Klammern schreiben wir die Bedingung(en), die erfüllt werden müssen, damit ein Blogpost in unser Queryset kommt. So soll jetzt z.B. `author` gleich `me` sein, damit nur die Blogposts des Autors "me" herausgefiltert werden. In Django schreiben wir deshalb: `author=me`. Jetzt sieht unser Code folgendermaßen aus:

```python
>>> Post.objects.filter(author=me)
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

Oder vielleicht wollen wir alle Posts haben, die das Wort "title" im `title`-Feld haben?

```python
>>> Post.objects.filter(title__contains='title')
[<Post: Sample title>, <Post: 4th title of post>]
```

> **Anmerkung:** Zwischen `title` und `contains` befinden sich zwei Unterstriche (`__`). Das ORM von Django nutzt diese Syntax, um Feldnamen ("title") und Operationen oder Filter ("contains") voneinander zu trennen. Wenn du nur einen Unterstrich benutzt, bekommst du einen Fehler wie "FieldError: Cannot resolve keyword title_contains".

Du kannst auch eine Liste aller bereits publizierten Posts erhalten, indem wir nach allen Posts suchen, deren `published_date` in der Vergangenheit liegt:

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
[]
```

Unglücklicherweise ist der Post, den wir über die Python-Konsole hinzugefügt haben, noch nicht veröffentlicht. Das können wir ändern! Als Erstes holen wir eine Instanz des Posts, den wir veröffentlichen wollen:

```python
>>> post = Post.objects.get(title="Sample title")
```

Dann publizieren wir ihn mit unserer `publish`-Methode!

```python
>>> post.publish()
```

Jetzt versuch, eine Liste von veröffentlichten Posts zu bekommen (drücke dreimal "Pfeil nach oben" und `enter`):

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
[<Post: Sample title>]
```

### Objekte ordnen

Mit den QuerySets kannst du eine Liste auch nach bestimmten Kriterien ordnen. Lass uns das mit dem `created_date` Feld ausprobieren:

```python
>>> Post.objects.order_by('created_date')
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

Wir können die Reihenfolge auch umdrehen, indem wir "`-`" davor schreiben:

```python
>>> Post.objects.order_by('-created_date')
[<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]
```

### Verkettung von QuerySets

Du kannst auch QuerySets kombinieren, indem du sie **verkettest**:

```
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
``` 

Dies ist wirklich mächtig und lässt dich ziemlich komplexe Abfragen schreiben.

Cool! Jetzt bist du bereit für den nächsten Teil! Um die Konsole zu schließen, schreib das:

```python
>>> exit()
$
```
