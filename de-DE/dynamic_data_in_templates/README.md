# Dynamische Daten in Templates

Wir haben nun schon einige Dinge an verschiedenen Orten fertiggestellt: das `Post`-Model ist in der `models.py` definiert, wir haben die `post_list` in der `views.py` und das Template hinzugefügt. Aber wie schaffen wir es nun, dass unsere Posts wirklich im HTML-Template erscheinen? Denn wir wollen ja erreichen, dass bestimmte Inhalte (die in der Datenbank gespeicherten Models) auf schöne Weise in unserem Template anzeigt werden, richtig?

Genau dafür sind die *Views* zuständig: die Verbindung zwischen den Models und den Templates. In unserer `post_list`-View müssen wir die Models, die wir anzeigen wollen, hernehmen und diese dem Template übergeben. In einer *View* entscheiden wir, was (welches Model) wir in einem Template anzeigen werden.

Okay, und wie machen wir das jetzt?

Wir öffnen unsere Datei `blog/views.py` in unserem Code-Editor. Bisher sieht unsere `post_list`-*View* folgendermaßen aus:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Erinnerst du dich, als wir davon gesprochen haben, dass wir den Code in verschiedene Dateien einfügen müssen? Jetzt ist es an der Zeit, das Model, dass wir in `models.py` beschrieben haben, einzufügen. Wir fügen den Befehl `from .models import Post` folgendermaßen ein:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

Der Punkt vor `models` bedeutet *aktuelles Verzeichnis* oder *aktuelle Anwendung*. Die Dateien `views.py` und `models.py` liegen im selben Verzeichnis. Deswegen können wir `.` und den Namen der Datei (ohne `.py`) benutzen. Dann ergänzen wir für den Import den Namen des Models (`Post`).

Und nun? Um vom `Post`-Model die tatsächlichen Blogposts zu erhalten, brauchen wir etwas, das `QuerySet` heißt.

## QuerySet

Dir sollte schon ungefähr klar sein, wie QuerySets funktionieren. Wir haben darüber im Kapitel [Django-ORM und QuerySets](../django_orm/README.md) gesprochen.

Wir wollen nun also eine Liste von publizierten Blogposts ausgeben, sortiert nach dem `published_date`, oder? Das haben wir bereits im Kapitel QuerySets gemacht!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Öffnen wir also die Datei `blog/views.py` im Code-Editor und setzen wir dieses Stück Code in die Funktion `def post_list(request)` ein. Aber vergiss nicht, zuerst `from django.utils import timezone` hinzufügen:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

To display our QuerySet on our blog's post list, we have two things left to do:

1. Pass the `posts` QuerySet to the template context, by changing the `render` function call. We'll do this now.
2. Modify the template to display the `posts` QuerySet. We'll cover this in a later chapter.

Beachte, dass wir eine *Variable* für unser QuerySet erstellt haben: `posts`. Das ist sozusagen der Name unseres QuerySets. Ab jetzt bezeichnen wir das QuerySet mit diesem Namen.

In der `render`-Funktion haben wir einen Parameter `request` (also alles, was wir vom User über das Internet bekommen) und einen weiteren Parameter, der den Template-Namen (`'blog/post_list.html'`) angibt. Der letzte Parameter, `{}`, ist eine Stelle, in der wir weitere Dinge hinzufügen können, die das Template dann benutzen kann. Wir müssen diesen einen Namen geben (wir verwenden einfach wieder `'posts'`). :) Es sollte nun so aussehen: `{'posts': posts}`. Bitte achte darauf, dass der Teil vor `:` ein String ist; das heißt, du musst ihn mit Anführungszeichen `''` umschliessen.

Schließlich sollte deine `blog/views.py` Datei folgendermaßen aussehen:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

Das war's! Zeit, zurück zum Template zu gehen und das QuerySet anzuzeigen!

Wenn du mehr über QuerySets in Django erfahren willst, dann sieh unter diesem Link nach: https://docs.djangoproject.com/en/2.2/ref/models/querysets/