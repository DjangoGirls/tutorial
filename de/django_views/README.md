# Django Views - Zeit zum Gestalten!

Es wird jetzt Zeit, den Bug, den wir im letzten Kapitel erzeugt haben, zu beheben :)

In der *View* schreiben wir die Logik unserer Anwendung. So werden Informationen aus dem `Model` abgefragt werden, welches du zuvor erzeugt hast und diese werden an ein `Template` weitergeben. Ein Template erzeugen wir im nächsten Kapitel. Views sind Python-Methoden, die ein bisschen komplizierter sind als die, die wir im Kapitel **Introduction to Python** kennengelernt haben.

Views kommen in die `views.py` Datei. Wir fügen nun also unsere *Views* zur Datei `blog/views.py` hinzu.

## blog/views.py

OK, wir öffnen nun diese Datei und schauen was darin steht:

```python
from django.shortcuts import render

# Create your views here.
```

Es steht noch nicht viel da. Die einfachste *View* kann folgendermaßen aussehen:

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Du siehst hier, dass wir eine Methode (`def`) mit dem Namen `post_list` definiert haben. Sie hat den Parameter `request`. In der Methode weisen wir mit `return` eine Rückgabe einer anderen Funktion namens `render` an. Diese wird unser Template `blog/post_list.html` erstellen (man sagt auch "rendern").

Speichere die Datei, öffne http://127.0.0.1:8000/ im Browser und schau nach, was wir jetzt bekommen.

Einen anderen Fehler! Lies dir durch, was da steht:

![Fehler](images/error.png)

Logisch: *TemplateDoesNotExist*. Wir haben ja noch kein Template erstellt. Lass uns diesen Bug im nächsten Kapitel beheben!

> Erfahre mehr über Django Views in der offiziellen Dokumentation: https://docs.djangoproject.com/en/1.10/topics/http/views/
