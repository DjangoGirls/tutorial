# Dynamische Daten in Templates

Wir haben nun schon einige Dinge an verschiedenen Orten fertiggestellt: das `Post`-Model ist in der `models.py` definiert, wir haben die `post_list` in der `views.py` und das Template hinzugefügt. Aber wie schaffen wir es nun, dass unsere Posts wirklich im HTML-Template erscheinen? Denn wir wollen ja erreichen, dass bestimmte Inhalte (die in der Datenbank gespeicherten Models) auf schöne Weise in unserem Template anzeigt werden, richtig?

Genau dafür sind die *Views* zuständig: die Verbindung zwischen den Models und den Templates. In unserer `post_list`-View müssen wir die Models adressieren, die wir anzeigen wollen und diese dem Template übergeben. Im Grunde entscheiden wir in der *View*, was (also welches Model) im Template angezeigt wird.

Okay, und wie machen wir das jetzt?

Wir öffnen unsere Datei `blog/views.py`. Bisher sieht unsere `post_list`-View folgendermaßen aus:

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Erinnerst du dich, als wir davon gesprochen haben, dass wir den Code in verschiedene Dateien einfügen müssen? Jetzt ist es an der Zeit, das Model, dass wir in `models.py` beschrieben haben, einzufügen. Wir fügen den Befehl `from .models import Post` folgendermaßen ein:

```python
from django.shortcuts import render
from .models import Post
```

Der Punkt nach dem `from` bedeutet *current directory*, also das aktuelle Verzeichnis oder *current application*, aktuelle Anwendung. Da `views.py` und `models.py` im gleichen Verzeichnis liegen, können wir einfach den Punkt `.` und den Namen der Datei (ohne `.py`) benutzen. Dann ergänzen wir für den Import den Namen des Models (`Post`).

Und als nächstes? Um tatsächlich Blogposts aus dem `Post` Model anzusprechen, brauchen wir etwas, das `QuerySet` heißt.

## QuerySet

Dir sollte jetzt schon ungefähr klar sein, wie QuerySets funktionieren. Wir haben darüber im Kapitel [Django ORM (QuerySets)](../django_orm/README.md) gesprochen.

Wir wollen nun also eine Liste von Blogposts, die publiziert und nach `published_date` sortiert sind, ausgeben, oder? Das haben wir bereits im Kapitel QuerySets gemacht!

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
``` 

Diesen Code fügen wir jetzt in `blog/views.py` ein, indem wir es zur Funktion `def post_list(request)` hinzufügen:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

Beachte, dass wir eine *Variable* für unser QuerySet erstellen: `posts`. Es ist sozusagen der Name unseres QuerySets. Ab jetzt bezeichnen wir das QuerySet mit diesem Namen.

Ferner benutzt der Code die `timezone.now()`-Funktion, also müssen wir einen Import für `timezone` hinzufügen.

Als Letztes fehlt noch, dass wir das `posts`-QuerySet dem Template übergeben (wie wir es dann anzeigen, wird im nächsten Kapitel erklärt).

In der `render`-Funktion haben wir schon einen Parameter `request` (also alles, was wir vom User über das Internet bekommen) und einen Template-Namen`'blog/post_list.html'` angegeben. Der letzte Parameter, der so aussieht: `{}` ist ein Ort, wo wir Informationen, welche das Template nutzt, einfügen können. Wir müssen diesen einen Namen geben (wir verwenden einfach wieder `'posts'` :) ). Es sollte nun so aussehen: `{'posts': posts}`. Bitte achte darauf, dass der Teil vor `:` ein String ist; das heißt, du musst ihn mit Anführungszeichen umschliessen `''`.

Am Ende sollte deine `blog/views.py` Datei folgendermaßen aussehen:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

Das war's! Nun gehen wir zurück ins Template und zeigen das QuerySet an!

Wenn du mehr über QuerySets in Djago erfahren willst, dann sieh unter diesem Link nach: https://docs.djangoproject.com/en/1.10/ref/models/querysets/
