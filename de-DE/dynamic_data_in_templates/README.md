# Dynamische Daten in Templates

Wir haben nun schon einige Dinge an verschiedenen Orten fertiggestellt: das `Post`-Model ist in der `models.py` definiert, wir haben die `post_list` in der `views.py` und das Template hinzugefügt. Aber wie schaffen wir es nun, dass unsere Posts wirklich im HTML-Template erscheinen? Denn wir wollen ja erreichen, dass bestimmte Inhalte (die in der Datenbank gespeicherten Models) auf schöne Weise in unserem Template anzeigt werden, richtig?

Genau dafür sind die *Views* zuständig: die Verbindung zwischen den Models und den Templates. In unserer `post_list`-View müssen wir die Models, die wir anzeigen wollen, hernehmen und diese dem Template übergeben. In einer View entscheiden wir, welches Model wir in einem Template anzeigen werden.

Okay, und wie machen wir das jetzt?

Wir öffnen unsere Datei `blog/views.py`. Bisher sieht unsere `post_list`-View folgendermaßen aus:

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

Der Punkt vor `models` bedeutet *current directory*, also das aktuelle Verzeichnis, oder *current application*, die aktuelle Anwendung. Die `views.py` und `models.py` liegen im selben Verzeichnis. Dadurch können wir `.` und den Namen der Datei (ohne `.py`) benutzen. Dann ergänzen wir für den Import den Namen des Models (`Post`).

Und nun? Um die tatsächlichen Blogposts des `Post`-Models zu erhalten, brauchen wir etwas, das `QuerySet` heißt.

## QuerySet

Dir sollte schon ungefähr klar sein, wie QuerySets funktionieren. Wir haben darüber im Kapitel [Django ORM und QuerySets](../django_orm/README.md) gesprochen.

Wir wollen nun also eine Liste von Blogposts ausgeben, wobei die Posts publiziert und nach `published_date` sortiert sein sollen, oder? Das haben wir bereits im Kapitel QuerySets gemacht!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Nun setzen wir dieses Stück Code in der Datei `blog/views.py` in die Funktion `def post_list(request)` ein, aber vergiss nicht, zuerst `from django.utils import timezone` hinzufügen:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

The last missing part is passing the `posts` QuerySet to the template context. Don't worry – we will cover how to display it in a later chapter.

Beachte, dass wir eine *Variable* für unser QuerySet erstellen: `posts`. Es ist sozusagen der Name unseres QuerySets. Ab jetzt bezeichnen wir das QuerySet mit diesem Namen.

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. Wir müssen diesen einen Namen geben (wir verwenden einfach wieder `'posts'`). :) Es sollte nun so aussehen: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

Am Ende sollte deine `blog/views.py` Datei folgendermaßen aussehen:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

Das war's! Nun gehen wir zurück ins Template und zeigen das QuerySet an!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.0/ref/models/querysets/