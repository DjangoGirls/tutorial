# Django URLs

Gleich werden wir unsere erste Website basteln: eine Homepage für deinen Blog! Zuerst sollten wir uns jedoch mit Django URLs beschäftigen.

## Was ist eine URL?

Eine URL ist einfach eine Web-Adresse. Jedes Mal, wenn du eine Website besuchst, kannst du eine URL sehen - sie ist in der Adressleiste des Browsers sichtbar. (Ja! `127.0.0.1:8000` ist eine URL! Und `https://djangogirls.org` ist auch eine URL.)

![URL](images/url.png)

Jede Seite im Internet braucht ihre eigene URL. Dadurch weiß deine Applikation, was sie dem Nutzer, der eine URL öffnet, zeigen soll. In Django verwenden wir eine sogenannte `URLconf` (URL- Konfiguration). URLconf ist eine Ansammlung von Mustern, die Django mit der empfangenen URL abgleicht, um die richtige View zu finden, das heißt, um letztlich die richtige Seite für den Nutzer anzuzeigen.

## Wie funktionieren URLs in Django?

Öffne die `mysite/urls.py`-Datei in deinem Code-Editor nach Wahl und schaue dir an, wie sie aussieht:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration
[...]
""" 
from django.urls import path, include
from django.contrib import admin urlpatterns = [     
    path('admin/', admin.site.urls),
]
```

Wie du siehst, hat Django hier schon etwas für uns eingefügt.

Zeilen zwischen dreifachen Gänsefüßchen (`'''` oder `"""`) heißen Docstrings (Kommentare) - man kann sie am Anfang der Datei, Klasse oder Methode platzieren, um zu beschreiben, was sie tut. Sie werden von Python nicht ausgeführt.

Die admin-URL, die du im vorangegangenen Kapitel bereits besucht hast, ist schon da:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

Diese Zeile bedeutet, dass für jede URL, die mit `admin/` beginnt, Django die entsprechende *View* finden wird. Hier wurden einige admin-URLs eingefügt, dadurch wird nicht alles in eine Datei gepackt - es bleibt lesbarer und sauberer. 

## Deine erste Django URL!

Es wird Zeit, unsere erste URL zu erstellen! Wir wollen, dass 'http://127.0.0.1:8000/' die Homepage unseres Blogs wird und eine Liste unserer Posts zeigt.

Wir wollen auch, dass die `mysite/urls.py`-Datei sauber bleibt. Deshalb importieren wir die URLs unserer `Blog`-Applikation in die `mysite/urls.py`-Hauptdatei.

Also los, füge eine Zeile hinzu, die `blog.urls` inkludiert. Beachte, dass wir hierfür die `include`-Funktion nutzen, daher musst du sie importieren.

Deine `mysite/urls.py`-Datei sollte jetzt so aussehen:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.urls import path, include
from django.contrib import admin 

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')), 
]
```

Django wird nun alle Aufrufe von 'http://127.0.0.1:8000/' auf `blog.urls` umleiten und dort nach weiteren Anweisungen schauen.

## blog.urls

Erstelle eine neue leere Datei namens `urls.py` im `blog`- Verzeichnis. Alles klar! Füge die ersten beiden Zeilen ein:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Hier importieren wir erstmal nur die Methoden von Django und alles aus den `views` unserer `blog`-Applikation (wir haben noch keine, aber dazu kommen wir gleich!).

Jetzt können wir unser erstes URL-Pattern hinzufügen:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'), 
]
```

Wie du siehst, fügen wir nun eine `view` mit dem Namen `post_list` zur Root-URL hinzu. Dieses URL-Muster (' ') wird mit einer leeren Zeichenfolge übereinstimmen und der Django-URL-Resolver ignoriert den Domain-Namen (z.B. http://127.0.0.1:8000/), der im vollständigen Pfad voransteht. Wenn also jemand deine Website mit der Adresse 'http://127.0.0.1:8000/' aufruft, passt dieses Muster (leere Zeichenkette) und Django weiß so, dass `views.post_list` das gewünschte Ziel ist.

Der letzte Teil `name='post_list'` ist der Name der URL, der genutzt wird, die View zu identifizieren. Er kann identisch mit dem Namen der View sein, aber es kann auch ein komplett anderer sein. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Error](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/urls/