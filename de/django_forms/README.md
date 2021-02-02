# Django-Formulare

Als Letztes möchten wir auf unserer Website noch die Möglichkeit haben, Blogposts hinzuzufügen und zu editieren. Die Django `admin`-Oberfläche ist cool, aber eher schwierig anzupassen und hübsch zu machen. Mit Formularen, `forms`, haben wir die absolute Kontrolle über unser Interface - wir können fast alles machen, was man sich vorstellen kann!

Das Gute an Django-Forms ist, dass man sie entweder vollständig selbst definieren oder eine `ModelForm` erstellen kann, welche den Inhalt des Formulars in das Model speichert.

Genau das wollen wir jetzt machen: Wir erstellen ein Formular für unser `Post`-Model.

So wie die anderen wichtigen Django-Komponenten haben auch die Forms ihre eigene Datei: `forms.py`.

Wir erstellen nun eine Datei mit diesem Namen im `blog`-Verzeichnis.

    blog
       └── forms.py
    

So, jetzt lass uns diese im Code-Editor öffnen und folgenden Code hinzufügen:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
         model = Post
         fields = ('title', 'text',)
```

Zuerst müssen wir die Django-Forms importieren (`from django import forms`) und auch unser `Post`-Model (`from .models import Post`).

Wie du wahrscheinlich schon vermutet hast, `PostForm` ist der Name unseres Formulars. Wir müssen Django mitteilen, dass unser Formular ein `ModelForm` ist (so kann Django ein bisschen für uns zaubern) - `forms.ModelForm` ist dafür verantwortlich.

Als Nächstes sehen wir uns `class Meta` an, damit sagen wir Django, welches Model benutzt werden soll, um das Formular zu erstellen (`model = Post`).

Nun können wir bestimmen, welche(s) Feld(er) unser Formular besitzen soll. Wir wollen hier nur den `title` und `text` sichtbar machen - der `author` sollte die Person sein, die gerade eingeloggt ist (Du!) und `created_date` sollte automatisch generiert werden, wenn der Post erstellt wird (also im Code). Stimmt's?

Und das war's schon! Jetzt müssen wir das Formular nur noch in einem *view* benutzen und im Template darstellen.

Also erstellen wir hier auch wieder einen Link auf die Seite, eine URL, eine View und ein Template.

## Link auf eine Seite mit dem Formular

Jetzt ist es an der Zeit, `blog/templates/blog/base.html` im Code-Editor zu öffnen. Im `div` mit dem Namen `page-header` fügen wir einen Link hinzu:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Beachte, dass wir unsere neue View `post_new` nennen wollen. Die Klasse `"glyphicon glyphicon-plus"` wird durch das verwendete Bootstrap-Theme zur Verfügung gestellt und wird ein Pluszeichen anzeigen.

Nach dem Hinzufügen der Zeile sieht deine HTML-Datei so aus:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div class="page-header">
            <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>
        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                    {% block content %}
                    {% endblock %}
                </div>
            </div>
        </div>
    </body>
</html>
```

Nach dem Speichern und Neuladen von http://127.0.0.1:8000 solltest du den bereits bekannten `NoReverseMatch`-Fehler sehen. Ist dem so? Gut!

## URL

Wir öffnen `blog/urls.py` im Code-Editor und fügen eine Zeile hinzu:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

Der finale Code sieht dann so aus:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path 
from . import views 
urlpatterns = [     
    path('', views.post_list, name='post_list'),     
    path('post/<int:pk>/', views.post_detail, name='post_detail'),     
    path('post/new/', views.post_new, name='post_new'), 
]
```

Nach dem Neuladen der Site sehen wir einen `AttributeError`, weil wir noch keine `post_new`-View eingefügt haben. Fügen wir sie gleich hinzu!

## Die post_new-View

Jetzt wird es Zeit, die Datei `blog/views.py` im Code-Editor zu öffnen und die folgenden Zeilen zu den anderen `from` Zeilen hinzuzufügen:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

Und dann unsere *View*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Um ein neues `PostForm` zu erstellen, rufen wir `PostForm()` auf und übergeben es an das Template. Wir kommen gleich nochmal zu dem *View* zurück, aber jetzt erstellen wir schnell ein Template für das Form.

## Template

Wir müssen eine Datei `post_edit.html` im Verzeichnis `blog/templates/blog` erstellen und im Code-Editor öffnen. Damit ein Formular funktioniert, benötigen wir einige Dinge:

* Wir müssen das Formular anzeigen. Wir können das zum Beispiel mit einem einfachen `{{ form.as_p }}` tun.
* Die Zeile oben muss von einem HTML-Formular-Tag eingeschlossen werden `<form method="POST">...</form>`.
* Wir benötigen einen `Save`-Button. Wir erstellen diesen mit einem HTML-Button: `<button type="submit">Save</button>`.
* Und schließlich fügen wir nach dem öffnenden `<form ...>` Tag `{% raw %}{% csrf_token %}{% endraw %}` hinzu. Das ist sehr wichtig, da es deine Formulare sicher macht! Wenn du diesen Teil vergisst, wird sich Django beim Speichern des Formulars beschweren.

![CSFR Forbidden page](images/csrf2.png)

Ok, also schauen wir mal, wie der HTML-Code in `post_edit.html` aussehen sollte:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h2>New post</h2>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

So, jetzt aktualisieren wir die Seite! Yay! Das Formular wird angezeigt!

![Neues Formular](images/new_form2.png)

Aber Moment! Wenn du in das `title`- oder `text`-Feld etwas eintippst und versuchst es zu speichern - was wird wohl passieren?

Nichts! Wir landen wieder auf der selben Seite und unser Text ist verschwunden... und kein neuer Post wurde hinzugefügt. Was lief denn hier schief?

Die Antwort ist: nichts. Wir müssen einfach noch etwas mehr Arbeit in unsere *View* stecken.

## Speichern des Formulars

Öffne `blog/views.py` erneut im Code-Editor. Derzeit ist alles, was wir in der View `post_new` haben, das hier:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Wenn wir das Formular übermitteln, werden wir zur selben Ansicht weitergeleitet, aber dieses Mal haben wir mehr Daten in `request`, genauer in `request.POST` (der Name hat nichts zu tun mit einem "Blogpost", sondern damit, dass wir Daten "posten"). Erinnerst du dich daran, dass in der HTML-Datei unsere `<form>` Definition die Variable `method="POST"` hatte? Alle Felder aus dem Formular sind jetzt in `request.POST`. Du solltest `POST` nicht umbenennen (der einzige andere gültige Wert für `method` ist `GET`, wir wollen hier jetzt aber nicht auf den Unterschied eingehen).

Somit müssen wir uns in unserer *View* mit zwei verschiedenen Situationen befassen: erstens, wenn wir das erste Mal auf die Seite zugreifen und ein leeres Formular wollen und zweitens, wenn wir zur *View* mit allen soeben ausgefüllten Formular-Daten zurück wollen. Wir müssen also eine Bedingung hinzufügen (dafür verwenden wir `if`):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Es wird Zeit, die Lücken zu füllen `[...]`. Falls die `Methode` `POST` ist, wollen wir das `PostForm` mit Daten vom Formular erstellen. Oder? Das machen wir folgendermaßen:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

Als Nächstes müssen wir testen, ob das Formular korrekt ist (alle benötigten Felder sind ausgefüllt und keine ungültigen Werte werden gespeichert). Wir tun das mit `form.is_valid()`.

Wir überprüfen also, ob das Formular gültig ist und wenn ja, können wir es speichern!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

Im Grunde passieren hier zwei Dinge: Wir speichern das Formular mit `form.save` und wir fügen einen Autor hinzu (da es bislang kein `author` Feld in der `PostForm` gab und dieses Feld notwendig ist). `commit=False` bedeutet, dass wir das `Post` Model noch nicht speichern wollen - wir wollen erst noch den Autor hinzufügen. Meistens wirst du `form.save()` ohne `commit=False` benutzen, aber in diesem Fall müssen wir es so tun. `post.save()` wird die Änderungen sichern (den Autor hinzufügen) und ein neuer Blogpost wurde erstellt!

Wäre es nicht grossartig, wenn wir direkt zu der `post_detail` Seite des neu erzeugten Blogposts gehen könnten? Um dies zu tun, benötigen wir noch einen zusätzlichen Import:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Füge dies direkt am Anfang der Datei hinzu. Jetzt können wir endlich sagen: "Gehe zu der `post_detail` Seite unseres neu erstellten Posts":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` ist der Name unserer View, zu der wir springen wollen. Erinnerst du dich, dass diese *View* einen `pk` benötigt? Um diesen an die View weiterzugeben, benutzen wir `pk=post.pk`, wobei `post` unser neu erstellter Blogpost ist!

Ok, wir haben jetzt eine ganze Menge geredet, aber du willst bestimmt sehen, wie die gesamte *View* aussieht, richtig?

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Schauen wir mal, ob es funktioniert. Gehe zur Seite http://127.0.0.1:8000/post/new/, füge einen `title` und `text` hinzu und speichere es...voilà! Der neue Blogpost wird hinzugefügt und wir werden auf die `post_detail` Seite umgeleitet!

Du hast vielleicht bemerkt, dass wir das Veröffentlichungsdatum festlegen, bevor wir den Post veröffentlichen. Später werden wir einen *publish button* in **Django Girls Tutorial: Extensions** einführen.

Das ist genial!

> Da wir vor Kurzem das Django-Admin-Interface benutzt haben, denkt das System, dass wir noch angemeldet sind. Es gibt einige Situationen, welche dazu führen können, dass wir ausgeloggt werden (Schließen des Browsers, Neustarten der Datenbank etc). Wenn du feststellst, dass du bei dem Erstellen von Posts Fehlermeldungen bekommst, die auf nicht angemeldete Nutzer zurückzuführen sind, dann gehe zur Admin Seite http://127.0.0.1:8000/admin und logge dich erneut ein. Dies wird das Problem vorübergehend lösen. Es gibt eine permanente Lösung dafür, die im Kapitel **Homework: add security to your website!** nach dem Haupttutorial auf dich wartet.

![Logged in error](images/post_create_error.png)

## Formularvalidierung

Jetzt zeigen wir dir, wie cool Django-Formulare sind. Ein Blogpost muss `title`- und `text`-Felder besitzen. In unserem `Post`-Model haben wir (im Gegensatz zu dem `published_date`) nicht festgelegt, dass diese Felder nicht benötigt werden, also nimmt Django standardmäßig an, dass sie definiert werden.

Versuch, das Formular ohne `title` und `text` zu speichern. Rate, was passieren wird!

![Formularvalidierung](images/form_validation2.png)

Django kümmert sich darum sicherzustellen, dass alle Felder in unserem Formular richtig sind. Ist das nicht großartig?

## Formular bearbeiten

Jetzt wissen wir, wie ein neuer Blogpost hinzugefügt wird. Aber was ist, wenn wir einen bereits bestehenden bearbeiten wollen? Das funktioniert so ähnlich wie das, was wir gerade getan haben. Lass uns schnell ein paar wichtige Dinge kreieren. (Falls du etwas nicht verstehst, solltest du deinen Coach fragen oder in den vorherigen Kapiteln nachschlagen, da wir all die Schritte bereits behandelt haben.)

Öffne `blog/templates/blog/post_detail.html` im Code-Editor und füge folgende Zeile hinzu:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

damit die Vorlage so aussieht:

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
        <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Öffne `blog/urls.py` im Code-Editor und fügen diese Zeile hinzu:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

Wir werden die Vorlage `blog/templates/blog/post_edit.html` wiederverwenden, daher ist das einzig Fehlende eine neue *View*.

Öffne `blog/views.py` im Code-Editor und füge ganz am Ende der Datei Folgendes hinzu:

{% filename %}blog/views.py{% endfilename %}

```python
def post_edit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```

Sieht genauso aus wie unsere `post_new`-View, oder? Aber nicht ganz. Zum einen übergeben wir zusätzliche `pk` Parameter aus `urls`. Und: Wir bekommen das `Post`-Model, welches wir bearbeiten wollen, mit `get_object_or_404(Post, pk=pk)` und wenn wir dann ein Formular erstellen, übergeben wir post als `instance`, wenn wir das Formular speichern…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

als auch, wenn wir ein Formular mit post zum Editieren öffnen:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

Ok, lass uns mal schauen, ob das funktioniert! Geh auf die `post_detail`-Seite. Dort sollte sich ein Editier-Button in der oberen rechten Ecke befinden:

![Schaltfläche "Bearbeiten"](images/edit_button2.png)

Wenn du darauf klickst, siehst du das Formular mit unserem Blogpost:

![Formular bearbeiten](images/edit_form2.png)

Probier doch einmal, den Titel oder den Text zu ändern und die Änderungen zu speichern!

Herzlichen Glückwunsch! Deine Anwendung nimmt immer mehr Gestalt an!

Falls du mehr Informationen über Django-Formulare benötigst, solltest du die offizielle Dokumentation lesen: https://docs.djangoproject.com/en/2.2/topics/forms/

## Sicherheit

Neue Posts mit einem Linkklick zu erstellen, ist großartig! Aber im Moment ist jeder, der deine Seite besucht in der Lage, einen neuen Blogpost zu veröffentlichen und das ist etwas, was du garantiert nicht willst. Lass es uns so machen, dass der Button für dich angezeigt wird, aber für niemanden sonst.

Öffne die Datei `blog/templates/blog/base.html` im Code-Editor, finde darin unseren `page-header` `div` und das Anchor-Tag, welches du zuvor eingefügt hast. Es sollte so aussehen:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Wir fügen ein weiteres `{% if %}`-Tag ein, was dafür sorgt, dass der Link nur für angemeldete Nutzer angezeigt wird. Im Moment bist das also nur du! Ändere den `<a>`-Tag zu Folgendem:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

Dieses `{% if %}` sorgt dafür, dass der Link nur zu dem Browser geschickt wird, wenn der anfragende Nutzer auch angemeldet ist. Das verhindert das Erzeugen neuer Posts nicht komplett, ist aber ein sehr guter erster Schritt. In der Erweiterungslektion kümmern wir uns ausgiebiger um Sicherheit.

Erinnerst du dich an den Editier-Button, den wir gerade zu unserer Seite hinzugefügt haben? Wir wollen dort dieselbe Anpassung machen, damit andere Leute keine existierenden Posts verändern können.

Öffne `blog/templates/blog/post_detail.html` im Code-Editor und finde folgende Zeile:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Ändere es wie folgt:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Da du wahrscheinlich angemeldet bist, wirst du beim Refresh der Seite keinen Veränderung feststellen. Lade jedoch die Seite in einem anderen Browser oder einem Inkognito-Fenster ("In Private" im Windows Edge) und du wirst sehen, dass dieser Link nicht auftaucht und das Icon ebenfalls nicht angezeigt wird!

## Eins noch: Zeit für das Deployment!

Mal sehen, ob das alles auch auf PythonAnywhere funktioniert. Zeit für ein weiteres Deployment!

* Commite als Erstes deinen neuen Code und schiebe ihn auf GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Dann führe Folgendes in der [PythonAnywhere Bash-Konsole](https://www.pythonanywhere.com/consoles/) aus:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<deine-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Denk daran, `<deine-pythonanywhere-domain>` durch deine tatsächliche PythonAnywhere-Subdomain zu ersetzen - ohne die spitzen Klammern.)

* Gehe schließlich noch rüber [auf die Seite "Web"](https://www.pythonanywhere.com/web_app_setup/) (benutze den Menü-Knopf in der rechten oberen Ecke der Konsole) und klicke **Reload**. Lade deinen Blog https://subdomain.pythonanywhere.com neu, um die Änderungen zu sehen.

Und das war's! Glückwunsch :)