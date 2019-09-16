# Django-URLs

Gleich werden wir unsere erste Website basteln: eine Homepage für deinen Blog! Zuerst sollten wir uns jedoch mit Django URLs beschäftigen.

## Was ist eine URL?

Eine URL ist eine Web-Adresse. Jedes Mal, wenn du eine Website besuchst, kannst du eine URL sehen - sie ist in der Adressleiste des Browsers sichtbar. (Ja! `127.0.0.1:8000` ist eine URL! Und `https://djangogirls.org` ist auch eine URL.)

![URL](images/url.png)

Jede Seite im Internet braucht ihre eigene URL. Dadurch weiß deine Applikation, was sie dem Nutzer, der eine URL öffnet, zeigen soll. In Django verwenden wir eine sogenannte `URLconf` (URL-Konfiguration). URLconf ist eine Ansammlung von Mustern, die Django mit der empfangenen URL abgleicht, um die richtige View zu finden, das heißt, um letztlich die richtige Seite für den Nutzer anzuzeigen.

## Wie funktionieren URLs in Django?

Öffne die `mysite/urls.py`-Datei in deinem Code-Editor nach Wahl und schaue dir an, wie sie aussieht:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.contrib import admin
from django.urls import path

urlpatterns = [
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

Diese Zeile bedeutet, dass Django für jede URL, die mit `admin/` beginnt, die entsprechende *View* finden wird. Hier wird mit admin-site.urls eine ganze Sammlung von admin-URLs referenziert. Dadurch müssen nicht alle in dieser kleinen Datei aufgeführt werden und sie bleibt lesbarer und übersichtlicher.

## Deine erste Django-URL!

Es wird Zeit, unsere erste URL zu erstellen! Wir wollen, dass 'http://127.0.0.1:8000/' die Homepage unseres Blogs wird und eine Liste unserer Posts zeigt.

Wir wollen auch, dass die `mysite/urls.py`-Datei sauber bleibt. Deshalb importieren wir die URLs unserer `Blog`-Applikation in die `mysite/urls.py`-Hauptdatei.

Also los: Füge eine Zeile hinzu, die `blog.urls` importiert. Ausserdem wirst du die Zeile `from django.urls…` ändern müssen, da wir hier die Funktion `include` verwenden, die du in dieser Zeile noch importieren musst.

Deine `mysite/urls.py`-Datei sollte jetzt so aussehen:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django wird nun alle Aufrufe von 'http://127.0.0.1:8000/' auf `blog.urls` umleiten und dort nach weiteren Anweisungen schauen.

## blog.urls

Erstelle eine neue leere Datei namens `urls.py` im Verzeichnis `blog` und öffne sie im Code-Editor. Alles klar! Füge folgende zwei Zeilen ein:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Hier importieren wir die Django-Funktion `path` und alle unsere `views` aus unserer `blog`-Applikation. (Wir haben noch keine, aber dazu kommen wir gleich!)

Jetzt können wir unser erstes URL-Muster hinzufügen:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

Wie du siehst, fügen wir nun eine `view` mit dem Namen `post_list` zur Root-URL hinzu. Leere Zeichenfolgen passen auf dieses Muster und der Django-URL-Resolver ignoriert den Domain-Namen (z.B. http://127.0.0.1:8000/), der im vollständigen Pfad voransteht. Dieses Muster sagt Django also, dass `views.post_list` das gewünschte Ziel ist, wenn jemand deine Website über 'http://127.0.0.1:8000/' aufruft.

Der letzte Teil `name='post_list'` ist der Name der URL, der genutzt wird, um die View zu identifizieren. Er kann identisch mit dem Namen der View sein, aber es kann auch ein komplett anderer sein. Wir werden später die Namen der URLs im Projekt benutzen. Daher ist es wichtig, jede URL in der App zu benennen. Wir sollten außerdem versuchen, eindeutige und einfach zu merkende URL-Namen zu wählen.

Wenn du jetzt versuchst, http://127.0.0.1:8000/ aufzurufen, dann erscheint eine Meldung der Art "Webseite nicht verfügbar". Das erscheint deshalb, weil der Server nicht mehr läuft. (Erinnerst du dich noch, `runserver` eingegeben zu haben?) Schau mal in deiner Server-Konsole nach und finde heraus, warum der Server nicht mehr läuft.

![Error](images/error1.png)

Die Konsole zeigt einen Fehler, aber keine Sorge – der ist eigentlich ziemlich nützlich: Er sagt dir, dass **kein Attribut 'post_list'** vorhanden ist. Das ist der Name der *View*, die Django zu finden und zu verwenden versucht, aber wir haben sie noch gar nicht erstellt. In diesem Zustand wird dein `/admin/` auch nicht funktionieren. Keine Sorge, das regeln wir gleich. Wenn du eine andere Fehlermeldung siehst, versuche es nochmal nach einem Neustart des Webservers. Stoppe dazu den Webserver, indem du Strg+C drückst (die Strg- bzw. Ctrl- und die C-Taste zusammen). Auf Windows musst du evtl. Strg+Untbr (bzw. Ctrl+Break) drücken. Dann musst du den Webserver mittels des Kommandos `python manage.py runserver` erneut starten.

> Wenn du mehr über Django-URLconfs lernen willst, dann öffne die offizielle Dokumentation: https://docs.djangoproject.com/en/2.2/topics/http/urls/