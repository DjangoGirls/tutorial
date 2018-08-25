# Django-ORM und QuerySets

In diesem Kapitel lernst du, wie sich Django mit der Datenbank verbindet und Daten darin speichert. Lass uns loslegen!

## Was ist ein QuerySet?

Zusammengefasst ist ein QuerySet eine Liste von Objekten eines bestimmten Models. QuerySets erlauben es dir, Daten aus der Datenbank zu lesen, zu filtern und zu sortieren.

Am besten wir sehen uns das an einem Beispiel an. Versuchen wir's?

## Django-Shell

Öffne deine lokale Konsole (nicht in PythonAnywhere) und tippe dieses Kommando ein:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Das sollte angezeigt werden:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole) >>>
```

Nun bist du in der interaktiven Konsole von Django. Die funktioniert wie der Python-Prompt, aber hat noch etwas zusätzliche Django-Magie. :) Du kannst hier auch alle Python-Befehle verwenden.

### Alle Objekte

Zunächst wollen wir alle unsere Blogposts ansehen. Das kannst du mit folgendem Kommando erreichen:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Hoppla! Eine Fehlermeldung ist erschienen. Sie sagt uns, dass Python "Post" nicht kennt. Und sie hat recht: Wir haben vergessen zu importieren!

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

Das ist eine Liste all der Posts, die wir zuvor lokal erstellt haben! Wir haben diese Posts mit der Django-Admin-Oberfläche erstellt. Aber nun wollen wir weitere Posts mit Python erstellen! Wie geht das also?

### Objekt erstellen

So erstellst du ein neues Post-Objekt in der Datenbank:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Allerdings fehlt noch eine Zutat: `me`. Wir müssen eine Instanz des Models `User` als Autor übergeben. Wie macht man das?

Als Erstes müssen wir das User-Model importieren:

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

Das ist der Superuser, den wir vorhin erstellt haben! Lass uns jetzt eine Instanz des Users erstellen (passe diese Zeile an, so dass dein eigener Benutzername verwendet wird):

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

As you can see, we now `get` a `User` with a `username` that equals 'ola'. Neat!

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

Du kann jetzt nach Belieben weitere Blogposts hinzufügen, um ein Gefühl dafür zu bekommen, wie es funktioniert. Füge doch noch zwei, drei hinzu bevor du zum nächsten Teil übergehst.

### Objekte filtern

Eine wichtige Eigenschaft von QuerySets ist, dass die Einträge gefiltert werden können. Zum Beispiel wollen wir alle Posts finden, die der User Ola geschrieben hat. Dafür nehmen wir `filter` statt `all` in `Post.objects.all()`. In Klammern schreiben wir die Bedingung(en), die ein Blogpost erfüllen muss, damit ein er in unser Queryset kommt. So soll jetzt z.B. `author` gleich `me` sein, damit nur die Blogposts des Autors "me" herausgefiltert werden. In Django schreiben wir deshalb: `author=me`. Jetzt sieht unser Code folgendermaßen aus:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Oder vielleicht wollen wir alle Posts haben, die das Wort "title" im `title`-Feld haben?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Anmerkung:** Zwischen `title` und `contains` befinden sich zwei Unterstriche (`__`). Das ORM von Django nutzt diese Regel, um Feldnamen ("title") und Operationen oder Filter ("contains") voneinander zu trennen. Wenn du nur einen Unterstrich benutzt, bekommst du einen Fehler wie "FieldError: Cannot resolve keyword title_contains".

Du kannst auch eine Liste aller bereits publizierten Posts erhalten, indem wir nach allen Posts suchen, deren `published_date` in der Vergangenheit liegt:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Unglücklicherweise ist der Post, den wir über die Python-Konsole hinzugefügt haben, noch nicht veröffentlicht. Aber das können wir ändern! Als Erstes holen wir eine Instanz des Posts, den wir veröffentlichen wollen:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

Dann publizieren wir ihn mit unserer `publish`-Methode:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Jetzt versuch nochmal, eine Liste von veröffentlichten Posts zu bekommen (drücke dreimal "Pfeil nach oben" und `enter`):

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