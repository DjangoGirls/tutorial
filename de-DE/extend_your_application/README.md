{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Erweitere deine Anwendung

Wir haben bereits die verschiedenen Schritte für die Erstellung unserer Website abgeschlossen: Wir wissen, wie man Models, URLs, Views und Templates schreibt. Wir wissen auch, wie wir unsere Website verschönern.

Zeit zum Üben!

Das erste, was unser Blog gebrauchen könnte, ist eine Seite, auf der ein Blogpost dargestellt werden kann, oder?

Wir haben bereits ein `Post`-Model, deshalb brauchen wir nichts zur `models.py` hinzufügen.

## Erstelle eine Template-Verknüpfung

Wir beginnen mit dem Hinzufügen einer Verknüpfung in der `blog/templates/blog/post_list.html`-Datei. Derzeit sollte es so aussehen: {% filename %}-blog/templates/blog/post_list.html-{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

{% raw %}Wir wollen einen Link von einem Post-Titel der Post-Liste zu einer Post-Detailseite haben. Ändern wir `<h1><a href="">{{ post.title }}</a></h1>`, so dass es zu der Detailseite verlinkt:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Es ist an der Zeit, das mysteriöse `{% url 'post_detail' pk=post.pk %}` zu erklären. Wie du dir wahrscheinlich schon denkst, bedeutet `{% %}`, dass wir Django Template Tags verwenden. Dieses Mal verwenden wir eines, dass eine URL für uns erzeugen wird! {% endraw %}

Der `post_detail` Teil bedeutet, dass Django eine URL in `blog/urls.py` mit dem Namen name=post_detail erwartet.

Und was ist mit `pk=post.pk`? `pk` ist die Abkürzung für primary key (Primär-Schlüssel), ein eindeutiger Name für jeden Datensatz in einer Datenbank. Da wir keinen Primärschlüssel in unserem `Post`-Model angelegt haben, erstellt Django einen für uns (standardmäßig ist das eine Zahl, die mit jedem Eintrag nach oben gezählt wird, z.B. 1, 2, 3) und fügt den Schlüssel in einem Feld namens `pk` zu jedem unserer Blogposts hinzu. Wir können den Primärschlüssel durch `post.pk` erhalten, genauso wie wir auf andere Felder (`title`, `author`, etc.) in unserem `Post`-Objekt zugreifen!

Wenn wir jetzt http://127.0.0.1:8000/ aufrufen, erhalten wir einen Fehler (wie erwartet, da wir ja noch keine URL oder *View* für `post_detail` erstellt haben). Das sieht so aus:

![NoReverseMatch error](images/no_reverse_match2.png)

## Erstelle eine URL

Lass uns eine URL in `urls.py` für unsere `post_detail`-*View* erstellen!

Wir wollen, dass unsere erste Blogpost-Detailseite unter dieser **URL** angezeigt wird: http://127.0.0.1:8000/post/1/

Lass uns eine URL in der Datei `blog/urls.py` anlegen, um Django auf die *View* `post_detail` zu verweisen, welche dann den ganzen Blogpost anzeigen wird. Füge die Zeile `path('post/<int:pk>)/', views.post_detail, name='post_detail'),` zu der Datei `blog/urls.py` hinzu. Die Datei sollte so aussehen:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.conf.urls import url 
from . import views urlpatterns = [     
  path('', views.post_list, name='post_list'),     
  path('post/<int:pk>/', views.post_detail, name='post_detail'), 
]
```

Der Teil `post/<int:pk>/` definiert ein URL-Muster – wir erklären es dir:

- `post/` heißt lediglich, dass die URL mit dem Wort **post** beginnen sollte, gefolgt von einem **/**. So weit, so gut.
- `<int:pk>` – Der Teil ist schwieriger. Er bedeutet, dass Django einen Integer-Wert erwartet und diesen in Form einer Variablen namens `pk` zu einer View weitergibt.
- `/` – dann wir brauchen wieder vor dem Abschluss der URL einen **/**.

Also wenn du `http://127.0.0.1:8000/post/5/` in deinen Browser eingibst, wird Django verstehen, dass du nach einer *View* suchst, die `post_detail` heißt, und wird der *View* eine Variable `pk` übergeben, die eine `5` enthält.

So, jetzt haben wir der `blog/urls.py` ein neues URL-Muster hinzugefügt! Lass uns die Seite http://127.0.0.1:8000/ aktualisieren - Peng! Der Server läuft wieder nicht mehr. Schau in die Konsole - wie erwartet, gibt es noch einen anderen Fehler!

![AttributeError](images/attribute_error2.png)

Erinnerst du dich, was der nächste Schritt ist? Natürlich: eine View hinzufügen!

## Füge eine View hinzu

Dieses Mal bekommt unsere *View* den extra Parameter `pk`. Unsere *View* muss diesen abfangen, richtig? Also definieren wir unsere Funktion mit `def post_detail(request, pk)`. Beachte, dass wir genau den gleichen Variablennamen benutzen müssen, wie in den URLs festgelegt (`pk`). Diese Variable wegzulassen ist falsch und führt zu einem Fehler!

Jetzt benötigen wir also genau einen bestimmten Blogpost. Diesen finden wir, indem wir ein Queryset folgendermaßen schreiben:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Aber bei diesem Code gibt es ein Problem. Wenn es kein `Post`-Objekt mit diesem `primary key` (`pk`) gibt, bekommen wir einen hässlichen Fehler!

![DoesNotExist error](images/does_not_exist2.png)

Das wollen wir nicht! Natürlich stellt uns Django etwas zur Verfügung, um dieses Problem zu umgehen: `get_object_or_404`. Wenn es kein `Post`-Objekt mit einem gegebenen `pk` gibt, wird eine schöne Seite angezeigt, die sogenannte `Page Not Found 404` Seite ("Seite nicht gefunden"-Seite).

![Page not found](images/404_2.png)

Die gute Neuigkeit ist, dass du auch deine eigene `Page not found`-Seite erstellen und diese so hübsch gestalten kannst, wie du willst. Aber da das gerade nicht so wichtig ist, überspringen wir das erst einmal.

Okay, es wird Zeit, die *View* zu unserer `views.py`-Datei hinzuzufügen!

In `blog/urls.py` haben wir eine URL-Regel namens `post_detail` erstellt, die auf eine View namens `views.post_detail` referenziert. Das heißt, dass Django eine View-Funktion erwartet, die `post_detail` heißt und in `blog/views.py` angelegt wurde.

Wir sollten also `blog/views.py` öffnen und den folgenden Code zu den anderen `from` Zeilen hinzufügen:

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

Super. Lass uns nun http://127.0.0.1:8000/ aktualisieren.

![Post list view](images/post_list2.png)

Es hat funktioniert! Aber was passiert, wenn du auf den Link im Blog-Titel klickst?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

Oh nein! Ein anderer Fehler! Aber wir wissen ja schon, wie wir mit diesem umgehen, oder? Wir müssen ein Template hinzufügen!

## Erstelle ein Template

Wir erstellen eine Datei in `blog/templates/blog` mit dem Namen `post_detail.html`.

Das sieht dann so aus:

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
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Wir erweitern wieder `base.html`. Im `content`-Block wollen wir das Publikationsdatum eines Posts (published_date), falls es existiert, anzeigen und auch den Titel und den Text. Aber wir müssen noch ein paar wichtige Dinge klären, oder?

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ..` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, we can refresh our page and see if `TemplateDoesNotExist` is gone now.

![Post detail page](images/post_detail2.png)

Yay! It works!

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Then, in a [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

## Updating the static files on the server

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}command-line{% endfilename %}

    $ workon <your-pythonanywhere-username>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the [Web tab](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload**.

And that should be it! Congrats :)