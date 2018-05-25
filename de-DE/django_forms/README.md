# Django Formulare

Als Letztes möchten wir auf unserer Website noch die Möglichkeit haben, Blogposts hinzuzufügen und zu editieren. Die Django `admin`-Oberfläche ist cool, aber eher schwierig anzupassen und hübsch zu machen. Mit Formularen, `forms`, haben wir die absolute Kontrolle über unser Interface - wir können fast alles machen, was man sich vorstellen kann!

Das Gute an Django Forms ist, dass man sie entweder vollständig selbst definieren oder eine `ModelForm` erstellen kann, welche den Inhalt des Formulars in das Model speichert.

Genau das wollen wir jetzt machen: Wir erstellen ein Formular für unser `Post` Model.

So wie die anderen wichtigen Django-Komponenten haben auch die Forms ihre eigene Datei: `forms.py`.

Wir erstellen nun eine Datei mit diesem Namen im `blog` Verzeichnis.

    blog
       └── forms.py
    

So, jetzt lass uns diese öffnen und folgenden Code hinzufügen:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
         model = Post
         fields = ('title', 'text',)
```

Zuerst müssen wir die Django Forms importieren (`from django import forms`) und natürlich auch unser `Post` Model (`from .models import Post`).

Wie du wahrscheinlich schon vermutet hast, `PostForm` ist der Name unseres Formulars. Wir müssen Django mitteilen, dass unser Formular ein `ModelForm` ist (so kann Django ein bisschen für uns zaubern) - `forms.ModelForm` ist dafür verantwortlich.

Als Nächstes sehen wir uns `class Meta` an, damit sagen wir Django, welches Model benutzt werden soll, um das Formular zu erstellen (`model = Post`).

Nun können wir bestimmen, welche(s) Feld(er) unser Formular besitzen soll. Wir wollen hier nur den `title` und `text` sichtbar machen - der `author` sollte die Person sein, die gerade eingeloggt ist (Du!) und `created_date` sollte automatisch generiert werden, wenn der Post erstellt wird (also im Code). Stimmt's?

Und das war's schon! Jetzt müssen wir das Formular nur noch in einem *view* benutzen und im Template darstellen.

Also erstellen wir hier auch wieder einen Link auf die Seite, eine URL, einen View und ein Template.

## Link auf eine Seite mit dem Formular

Jetzt ist es an der Zeit, `blog/templates/blog/base.html` zu öffnen. Wir fügen einen Link in `div` hinzu mit dem Namen `page-header`:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Beachte, dass wir unsere neue View `post_new` nennen wollen. Die Klasse `"glyphicon glyphicon-plus"` wird durch das verwendete Bootstrap Theme zur Verfügung gestellt und wird ein Pluszeichen anzeigen.

Nach dem Hinzufügen der Zeile sieht deine HTML-Datei so aus:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load staticfiles %}
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

Nach dem Speichern und Neuladen von http://127.0.0.1:8000 siehst du den bekannten `NoReverseMatch` Fehler, oder?

## URL

Wir öffnen `blog/urls.py` und fügen eine Zeile hinzu:

{% filename %}blog/urls.py{% endfilename %}

```python
url(r'^post/new/$', views.post_new, name='post_new'),
```

Der finale Code sieht dann so aus:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
    url(r'^post/new/$', views.post_new, name='post_new'),
]
```

Nach dem Neuladen der Site sehen wir einen `AttributeError`, weil wir noch keinen `post_new` View eingefügt haben. Fügen wir ihn gleich hinzu!

## Der post_new View

Jetzt wird es Zeit, die `blog/views.py` Datei zu öffnen und die folgenden Zeilen zu den anderen `from` Zeilen hinzuzufügen:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

Und dann unseren *View*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Um ein neues `PostForm` zu erstellen, rufen wir die `PostForm()` Methode auf und übergeben sie an das Template. Wir kommen gleich nochmal zu dem *View* zurück, aber jetzt erstellen wir schnell ein Template für das Form.

## Template

Wir müssen eine Datei `post_edit.html` im Verzeichnis `blog/templates/blog` erstellen. Damit ein Formular funktioniert, benötigen wir einige Dinge:

* Wir müssen das Formular anzeigen. Wir können das zum Beispiel mit einem einfachen `{{ form.as_p }}` tun.
* Die Zeile oben muss von einem HTML-Formular-Tag eingeschlossen werden `<form method="POST">...</form>`.
* Wir benötigen einen `Save`-Button. Wir erstellen diesen mit einem HTML-Button: `<button type="submit">Save</button>`.
* And finally, just after the opening `<form ...>` tag we need to add {% raw %}`{% csrf_token %}`{% endraw %}. Das ist sehr wichtig, da es deine Formulare sicher macht! If you forget about this bit, Django will complain when you try to save the form:

![CSFR Forbidden page](images/csrf2.png)

OK, so let's see how the HTML in `post_edit.html` should look:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h1>New post</h1>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

So, jetzt aktualisieren wir die Seite! Yay! Das Formular wird angezeigt!

![Neues Formular](images/new_form2.png)

But, wait a minute! When you type something in the `title` and `text` fields and try to save it, what will happen?

Nothing! We are once again on the same page and our text is gone… and no new post is added. So what went wrong?

Die Antwort ist: nichts. Wir müssen einfach noch etwas mehr Arbeit in unseren *view* stecken.

## Speichern des Formulars

Open `blog/views.py` once again. Currently all we have in the `post_new` view is the following:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

When we submit the form, we are brought back to the same view, but this time we have some more data in `request`, more specifically in `request.POST` (the naming has nothing to do with a blog "post"; it's to do with the fact that we're "posting" data). Remember how in the HTML file, our `<form>` definition had the variable `method="POST"`? Alle Felder aus dem Formular sind jetzt in `request.POST`. Du solltest `POST` nicht umbenennen (der einzige andere gültige Wert für `method` ist `GET`, wir wollen hier jetzt aber nicht auf den Unterschied eingehen).

So in our *view* we have two separate situations to handle: first, when we access the page for the first time and we want a blank form, and second, when we go back to the *view* with all form data we just typed. Wir müssen also eine Bedingung hinzufügen (dafür verwenden wir `if`):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

It's time to fill in the dots `[...]`. If `method` is `POST` then we want to construct the `PostForm` with data from the form, right? We will do that as follows:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

The next thing is to check if the form is correct (all required fields are set and no incorrect values have been submitted). We do that with `form.is_valid()`.

Wir überprüfen also, ob das Formular gültig ist und wenn ja, können wir es speichern!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

Im Grunde passieren hier zwei Dinge: Wir speichern das Formular mit `form.save` und wir fügen einen Autor hinzu (da es bislang kein `author` Feld in der `PostForm` gab und dieses Feld notwendig ist). `commit=False` means that we don't want to save the `Post` model yet – we want to add the author first. Most of the time you will use `form.save()` without `commit=False`, but in this case, we need to supply it. `post.save()` will preserve changes (adding the author) and a new blog post is created!

Finally, it would be awesome if we could immediately go to the `post_detail` page for our newly created blog post, right? To do that we need one more import:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Add it at the very beginning of your file. And now we can say, "go to the `post_detail` page for the newly created post":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` is the name of the view we want to go to. Erinnerst du dich, dass dieser *view* einen `pk` benötigt? To pass it to the views, we use `pk=post.pk`, where `post` is the newly created blog post!

OK, we've talked a lot, but we probably want to see what the whole *view* looks like now, right?

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

Schauen wir mal, ob es funktioniert. Go to the page http://127.0.0.1:8000/post/new/, add a `title` and `text`, save it… and voilà! The new blog post is added and we are redirected to the `post_detail` page!

You might have noticed that we are setting the publish date before saving the post. Later on, we will introduce a *publish button* in **Django Girls Tutorial: Extensions**.

Das ist genial!

> As we have recently used the Django admin interface, the system currently thinks we are still logged in. There are a few situations that could lead to us being logged out (closing the browser, restarting the DB, etc.). If, when creating a post, you find that you are getting errors referring to the lack of a logged-in user, head to the admin page http://127.0.0.1:8000/admin and log in again. Dies wird das Problem vorübergehend lösen. Es gibt eine permanente Lösung dafür, die im Kapitel **Homework: add security to your website!** nach dem Haupttutorial auf dich wartet.

![Logged in error](images/post_create_error.png)

## Formularvalidierung

Jetzt zeigen wir dir, wie cool Django Formulare sind. Ein Blogpost muss `title`- und `text`-Felder besitzen. In our `Post` model we did not say that these fields (as opposed to `published_date`) are not required, so Django, by default, expects them to be set.

Try to save the form without `title` and `text`. Guess what will happen!

![Formularvalidierung](images/form_validation2.png)

Django is taking care to validate that all the fields in our form are correct. Isn't it awesome?

## Formular bearbeiten

Jetzt wissen wir, wie ein neues Formular hinzugefügt wird. Aber was ist, wenn wir ein bereits bestehendes bearbeiten wollen? This is very similar to what we just did. Let's create some important things quickly. (If you don't understand something, you should ask your coach or look at the previous chapters, since we covered all these steps already.)

Open `blog/templates/blog/post_detail.html` and add the line

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

so that the template will look like this:

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
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

In `blog/urls.py` fügen wir folgende Zeile ein:

{% filename %}blog/urls.py{% endfilename %}

```python
    url(r'^post/(?P<pk>\d+)/edit/$', views.post_edit, name='post_edit'),
```

Wir werden die Vorlage `blog/templates/blog/post_edit.html` wiederverwenden, daher ist das einzig Fehlende eine neue *view*.

Let's open `blog/views.py` and add this at the very end of the file:

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

Sieht genauso aus wie unsere `post_new` view, oder? Aber nicht ganz. For one, we pass an extra `pk` parameter from urls. Next, we get the `Post` model we want to edit with `get_object_or_404(Post, pk=pk)` and then, when we create a form, we pass this post as an `instance`, both when we save the form…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

…and when we've just opened a form with this post to edit:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

OK, let's test if it works! Let's go to the `post_detail` page. There should be an edit button in the top-right corner:

![Schaltfläche "Bearbeiten"](images/edit_button2.png)

Wenn du darauf klickst, siehst du das Formular mit unserem Blogpost:

![Formular bearbeiten](images/edit_form2.png)

Feel free to change the title or the text and save the changes!

Herzlichen Glückwunsch! Deine Anwendung nimmt mehr Gestalt an!

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/1.11/topics/forms/

## Sicherheit

Neue Posts mit nur einem Linkklick zu erstellen, ist großartig! But right now, anyone who visits your site will be able to make a new blog post, and that's probably not something you want. Lasst es uns so machen, das der Button für dich angezeigt wird aber für niemanden sonst. 

Finde in der Datei `blog/templates/blog/base.html` unseren `page-header` `div` und das Anchor-Tag, welches du zuvor eingefügt hast. Es sollte so aussehen:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

We're going to add another `{% if %}` tag to this, which will make the link show up only for users who are logged into the admin. Right now, that's just you! Ändere den `<a>`-Tag zu Folgendem:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

This `{% if %}` will cause the link to be sent to the browser only if the user requesting the page is logged in. Das verhindert das Erzeugen neuer Posts nicht komplett, ist aber ein sehr guter erster Schritt. In der Erweiterungslektion kümmern wir uns ausgiebiger um Sicherheit.

Remember the edit icon we just added to our detail page? We also want to add the same change there, so other people won't be able to edit existing posts.

Open `blog/templates/blog/post_detail.html` and find this line:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Change it to this:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Since you're likely logged in, if you refresh the page, you won't see anything different. Load the page in a different browser or an incognito window (called "InPrivate" in Windows Edge), though, and you'll see that the link doesn't show up, and the icon doesn't display either!

## Eins noch: Zeit für das Deployment!

Mal sehen, ob das alles auch auf PythonAnywhere funktioniert. Zeit für ein weiteres Deployment!

* Checke als Erstes deinen neuen Code ein und lade ihn auf GitHub hoch:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Dann führe Folgendes in der [PythonAnywhere Bash-Konsole](https://www.pythonanywhere.com/consoles/) aus:

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

* Springe nun noch schnell auf den [Web-Tab](https://www.pythonanywhere.com/web_app_setup/) und klicke auf **Reload**.

And that should be it! Congrats :)