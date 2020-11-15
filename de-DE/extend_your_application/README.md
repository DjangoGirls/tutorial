{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Erweitere deine Anwendung

Wir haben bereits die verschiedenen Schritte für die Erstellung unserer Website abgeschlossen: Wir wissen, wie man Models, URLs, Views und Templates schreibt. Wir wissen auch, wie wir unsere Website verschönern.

Zeit zu üben!

Das erste, was unser Blog braucht, ist eine Seite, auf der ein einzelner Blogpost dargestellt wird, oder?

Wir haben bereits ein `Post`-Model, deshalb brauchen wir nichts zur `models.py` hinzufügen.

## Erstelle eine Template-Verknüpfung

Wir beginnen damit, einen Link in der `blog/templates/blog/post_list.html`-Datei zu erstellen. Öffne sie im Code-Editor, und bisher sollte sie etwa so aussehen: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

{% raw %}Wir wollen einen Link vom Titel eines Posts in der Post-Liste zur Detailseite des jeweiligen Posts haben. Ändern wir `<h2><a href="">{{ post.title }}</a></h2>`, so dass es zu der Detailseite verlinkt:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h2><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h2>
```

{% raw %}Es ist an der Zeit, das mysteriöse `{% url 'post_detail' pk=post.pk %}` zu erklären. Wie du dir wahrscheinlich schon denkst, bedeutet `{% %}`, dass wir Django-Template-Tags verwenden. Dieses Mal verwenden wir eines, das eine URL für uns erzeugen wird! {% endraw %}

Der `post_detail`-Teil bedeutet, dass Django eine URL in `blog/urls.py` mit dem Namen name=post_detail erwartet.

Und was ist mit `pk=post.pk`? `pk` ist die Abkürzung für primary key (zu Deutsch: Primär-Schlüssel), ein eineindeutiges Identifikationsmerkmal zu jedem Eintrag in einer Datenbank. Jedes Django-Modell hat ein Feld, das als Primär-Schlüssel dient. Welchen Namen dieses Feld auch haben mag, es kann ebenfalls als "pk" referenziert werden. Da wir keinen Primär-Schlüssel in unserem `Post`-Modell angelegt haben, erstellt Django einen für uns (standardmäßig ist dies ein Feld namens "id", welches eine Zahl enthält, die mit jedem weiteren Eintrag nach oben gezählt wird, z.B. 1, 2, 3) und fügt ihn als Feld zu jedem unserer Posts hinzu. Wir greifen auf den Primär-Schlüssel zu, indem wir `post.pk` schreiben, genauso wie wir auf andere Felder (`title`, `author`, usw.) in unserem `Post`-Objekt zugreifen!

Wenn wir jetzt http://127.0.0.1:8000/ aufrufen, erhalten wir einen Fehler (wie erwartet, da wir ja noch keine URL oder *View* für `post_detail` erstellt haben). Er wird so aussehen:

![NoReverseMatch Error](images/no_reverse_match2.png)

## Erstelle eine URL für die Post-Detailseite

Lass uns eine URL in `urls.py` für unsere `post_detail`-*View* erstellen!

Wir wollen, dass unsere erste Blogpost-Detailseite unter dieser **URL** angezeigt wird: http://127.0.0.1:8000/post/1/

Lass uns eine URL in der Datei `blog/urls.py` anlegen, um Django auf die *View* `post_detail` zu verweisen, welche dann den ganzen Blogpost anzeigen wird. Öffne die Datei `blog/urls.py` im Code-Editor und füge die Zeile `path('post/<int:pk>/', views.post_detail, name='post_detail'),` hinzu, so dass die Datei wie folgt aussieht:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

Der Teil `post/<int:pk>/` definiert ein URL-Muster – wir erklären es dir:

- `post/` heißt, dass die URL mit dem Wort **post** beginnen sollte, gefolgt von einem **/**. So weit, so gut.
- `<int:pk>` – Dieser Teil ist schwieriger. Er bedeutet, dass Django eine Ganzzahl (einen Integer-Wert) erwartet und diese in Form einer Variablen namens `pk` einer View weitergibt.
- `/` – dann brauchen wir vor dem Abschluss der URL wieder einen **/**.

Wenn du also `http://127.0.0.1:8000/post/5/` in deinen Browser eingibst, wird Django verstehen, dass du nach einer *View* suchst, die `post_detail` heißt, und wird der *View* die Information weitergeben, dass `pk` dabei `5` sein soll.

So, jetzt haben wir der `blog/urls.py` ein neues URL-Muster hinzugefügt! Lass uns die Seite http://127.0.0.1:8000/ neu laden - Bumm! Der Server läuft wieder nicht mehr. Schau in die Konsole - wie erwartet gibt es noch einen anderen Fehler!

![AttributeError](images/attribute_error2.png)

Erinnerst du dich, was der nächste Schritt ist? Eine View hinzufügen!

## Füge eine View hinzu

Dieses Mal bekommt unsere *View* den extra Parameter `pk`. Unsere *View* muss diesen entgegennehmen, richtig? Also definieren wir unsere Funktion als `def post_detail(request, pk)`. Beachte, dass der Parameter genau den gleichen Variablennamen haben muss, wie wir in `urls` festgelegt haben (`pk`). Beachte zudem, dass das Weglassen dieser Variable unzulässig ist und zu einem Fehler führt!

Jetzt benötigen wir also genau einen bestimmten Blogpost. Diesen finden wir, indem wir ein QuerySet folgendermaßen schreiben:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Aber bei diesem Code gibt es ein Problem. Wenn es kein `Post`-Objekt mit diesem `primary key` (`pk`) gibt, bekommen wir einen super-hässlichen Fehler!

![DoesNotExist Error](images/does_not_exist2.png)

Das wollen wir nicht! Zum Glück stellt uns Django etwas zur Verfügung, das uns dieses Problem abnimmt: `get_object_or_404`. Wenn es kein `Post`-Objekt mit einem gegebenen `pk` gibt, wird eine schöne Seite angezeigt, die sogenannte `Page Not Found 404`-Seite ("Seite nicht gefunden"-Seite).

![Page not found](images/404_2.png)

Die gute Neuigkeit ist, dass du auch deine eigene `Page not found`-Seite erstellen und diese so hübsch gestalten kannst, wie du willst. Aber das ist jetzt gerade nicht so wichtig, deshalb überspringen wir das.

Okay, es wird Zeit, die *View* zu unserer `views.py`-Datei hinzuzufügen!

In `blog/urls.py` haben wir eine URL-Regel namens `post_detail` erstellt, die auf eine View namens `views.post_detail` verweist. Das heißt, dass Django eine View-Funktion erwartet, die `post_detail` heißt und in `blog/views.py` angelegt wurde.

Wir sollten also `blog/views.py` im Code-Editor öffnen und den folgenden Code zu den anderen `from` Zeilen hinzufügen:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

Und am Ende der Datei werden wir unsere *View*-Funktion ergänzen:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Super. Lass uns nun http://127.0.0.1:8000/ neu laden.

![Die post_list-View](images/post_list2.png)

Es hat funktioniert! Aber was passiert, wenn du auf den Link im Blog-Titel klickst?

![TemplateDoesNotExist Error](images/template_does_not_exist2.png)

Oh nein! Ein anderer Fehler! Aber wir wissen ja schon, wie wir mit diesem umgehen, oder? Wir müssen ein Template hinzufügen!

## Erstelle ein Template für die Post-Detailseite

Wir erstellen eine Datei in `blog/templates/blog` mit dem Namen `post_detail.html` und öffnen sie im Code-Editor.

Gib den folgenden Code ein:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Wir erweitern wieder `base.html`. Im `content`-Block wollen wir das Publikationsdatum eines Posts (published_date), falls es existiert, anzeigen und auch den Titel und den Text. Aber wir müssen noch ein paar wichtige Dinge klären, oder?

{% raw %}`{% if ... %} ... {% endif %}` ist ein Template-Tag, das wir benutzen können, wenn wir etwas überprüfen möchten. (Erinnerst du dich an `if ... else ...` vom Kapitel **Einführung in Python**?) In diesem Fall hier wollen wir prüfen, ob das `published_date`-Feld eines Post-Objektes nicht leer ist. {% endraw %}

OK, aktualisieren wir unsere Seite und sehen, ob `TemplateDoesNotExist` jetzt weg ist.

![Blogpost-Detailseite](images/post_detail2.png)

Yay! Es funktioniert!

# Veröffentlichen!

Es wäre schön zu sehen, ob deine Website noch auf PythonAnywhere funktioniert, richtig? Lass sie uns erneut veröffentlichen.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Dann führe Folgendes in der [PythonAnywhere-Bash-Konsole](https://www.pythonanywhere.com/consoles/) aus:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<deine-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Denk daran, `<deine-pythonanywhere-domain>` durch deine tatsächliche PythonAnywhere-Subdomain zu ersetzen - ohne die spitzen Klammern.)

## Die statischen Dateien auf dem Server aktualisieren

Server wie PythonAnywhere behandeln statische Dateien ("static files", z.B. CSS-Dateien) anders als Python-Dateien, weil statische Dateien noch optimiert und dadurch dann schneller geladen werden können. Deswegen müssen wir, nachdem wir Änderungen an den CSS Dateien vorgenommen haben, einen zusätzlichen Befehl auf dem Server ausführen, um diese Dateien zu aktualisieren. Der Befehl heißt `collectstatic`.

Aktiviere also deine virtuelle Umgebung, wenn sie nicht vom letzten Mal noch aktiv ist (PythonAnywhere benutzt dazu das Kommando `workon`, das ist ähnlich wie `source myenv/bin/activate`, das du auf deinem Computer verwendest):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ workon <deine-pythonanywhere-domain>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

Der `manage.py collectstatic` Befehl ist ein bisschen wie `manage.py migrate`. Wir machen ein paar Änderungen in unserem Code und dann sagen wir Django, dass es diese übernehmen (*apply*) soll, entweder zu der servereigenen Sammlung von statischen Dateien oder in die Datenbank.

Auf jeden Fall sind wir nun soweit, dass wir [auf die Seite "Web"](https://www.pythonanywhere.com/web_app_setup/) wechseln können (mittels dem Menü-Knopf in der Ecke oben rechts) und **Reload** klicken können. Schau dir dann die Seite https://subdomain.pythonanywhere.com an, um das Ergebnis zu sehen.

Und das sollte es sein! Herzlichen Glückwunsch :)