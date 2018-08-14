# Django-Views - leg los!

Es wird jetzt Zeit, den Bug, den wir im letzten Kapitel erzeugt haben, zu beheben! :)

In der *View* schreiben wir die Logik unserer Anwendung. So werden Informationen aus dem `Model` abgefragt werden, welches du zuvor erzeugt hast und diese werden an ein `Template` weitergeben. Ein Template erzeugen wir im nächsten Kapitel. Views sind Python-Methoden, die ein bisschen komplizierter sind als die, die wir im Kapitel **Einführung in Python** kennengelernt haben.

Views kommen in die `views.py` Datei. Wir fügen nun also unsere *Views* zur Datei `blog/views.py` hinzu.

## blog/views.py

OK, wir öffnen jetzt diese Datei und schauen, was darin steht:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Ok, hier steht noch nicht so viel.

Denk daran, Zeilen mit einem `#` am Anfang sind Kommentare – das bedeutet, dass diese Zeilen von Python nicht ausgeführt werden.

Lass uns eine *View* erstellen, wie der Kommentar das vorschlägt. Füge die folgende Mini-View darunter ein:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):     
    return render(request, 'blog/post_list.html', {})
```

Du siehst hier, dass wir eine Methode (`def`) mit dem Namen `post_list` definieren. Sie hat den Parameter `request`. In der Methode weisen wir mit `return` die Rückgabe einer anderen Funktion namens `render` an. Diese wird unser Template `blog/post_list.html` erstellen (man sagt auch "rendern").

Speichere die Datei, öffne http://127.0.0.1:8000/ im Browser und schau nach, was wir jetzt haben.

Einen anderen Fehler! Lies dir durch, was da steht:

![Error](images/error.png)

Das zeigt, dass der Server zumindest wieder läuft, aber es sieht immer noch nicht richtig aus, oder? Mach dir keine Sorgen, es ist nur eine Fehlerseite, nichts zu befürchten! Genau wie die Fehlermeldungen in der Konsole sind auch die hier super nützlich. Du erhältst den Hinweis *TemplateDoesNotExist*. Lass uns diesen Bug beheben, indem wir im nächsten Kapitel ein Template erstellen!

> Erfahre mehr über Django Views in der offiziellen Dokumentation: https://docs.djangoproject.com/en/2.0/topics/http/views/.