# Formulare în Django

La final vrem să adăugăm la proiectul nostru o metodă pentru a crea sau edita postări de blog. Consola de `admin` din Django este ajutătoare, dar este destul de greu să o perosnalizezi și să o faci frumoasă. Cu `forms` avem putere absolută în crearea interfeței noastre - putem face aproape tot ce ne putem imagina!

Un lucru util la formularele (forms) Django este că putem defini unul de la zero, sau putem crea un `ModelForm` care va salva ce se găsește în formular în model.

Asta ne și propunem să facem: vom crea un formular pentru modelul nostru `Post`.

La fel ca și celălalte componente importante din Django, formularele au propriul lor fișier: `forms.py`.

Trebuie să creăm un fișier cu acest nume în directorul `blog`.

    blog
       └── forms.py
    

Hai să-l deschidem în editorul de cod și tapăm comandă următoare:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

Dintâi, Trebuie să importăm formularele Django (`from django import forms`) și, evident, modelul nostru `Post` (`from .models import Post`).

După cum probabil suspectați, `PostForm` este numele formularului nostru. Trebuie să îi spunem lui Django că acest formular este un `ModelForm` (astfel încât Django îi aplică un pic de magie pentru noi) - `forms.ModelForm` se ocupă de asta.

Apoi, avem `class Meta`, unde îi spunem lui Django care model ar trebui să fie folosit pentru a creea acest formular (`model = Post`).

La final, putem să spunem care câmp(uri) ar trebui să ajungă în formular. În acest scenariu ne dorim să expundem doar `title` (titlul) și `text` (textul) - `author` (autorul) ar trebui să fie persoana care este acum autentificată (adică tu!) iar `created_date` (data de creare) ar trebui să fie setată automat când creăm postul (din cod), nu?

Și gata! Tot ce trebuie să facem acum e să folosim formularul într-un *view* și să-l afișăm într-un template.

Deci încă o dată vom crea: un link către pagină, un URL, un view și un template.

## Link către o pagină cu formularul

Este momentul să deschidem `blog/templates/blog/base.html`. Vom adăuga un link în `div` -ul ` page-header`:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Dorim să numim noul view `post_new`. Clasa `"glyphicon glyphicon-plus"` este de la bootstrap, pe care îl utilizăm, și va afișa un simbol de plus.

După adăugarea liniei, fișierul HTML trebuie să arate în modul următor:

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

După salvarea și actualizarea paginii http://127.0.0.1:8000 o să vedeți o eroare `NoReverseMatch`. Hai s-o rezolvăm!

## URL

Deschideți `blog/urls.py` în editorul de cod și adăugați o linie:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

Codul final va fi următor:

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

După actualizarea site-ului noi vedem eroare `AttributeError`, pentru că noi n-am creat view `post_new`. Hai s-o adăugăm.

## post_new view

Este timp de a deschide fișierul `blog/views.py` în editorul de cod și a adăuga linii următoare, cu liniile `from`:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

Și funcție *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Pentru a crea un formular nou `Post`, noi trebuie să executăm `PostForm()` și să-l transmitem rezultat în șablon. O să mai întoarcem la acest *view*, dar acum hai să creăm un șablon pentru un formular.

## Șablon

Trebuie să creăm un fișier `post_edit.html` în directoriu `blog/templates/blog` și să-l deschidem în editor de cod. Pentru a face ca formularul să lucreze, trebuie să asigurăm de următoare:

* Noi trebuie să afișăm pe formular. Putem să facem acesta (de exemplu) în mod următor {% raw %}`{{ form.as_p }}`{% endraw %}.
* Linie de sus trebuie să fie între tăgurile HTML form: `<form method="POST">...</form>`.
* Avem nevoie de butonul `Save` (Salvează). Facem acesta cu un buton HTML: `<button type="submit">Save</button>`.
* Și în final, după deschiderea tăgului `<form ...>` noi trebuie să adăugăm {% raw %}`{% csrf_token %}`{% endraw %}. Acesta este foarte important pentru că face formulare protejate! Dacă nu faceți acesta, Django va da o eroare când o să încercați să-l salvați pe formular:

![CSFR Forbidden page](images/csrf2.png)

Hai să vedem cum HTML în `post_edit.html` trebuie să arăte:

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

E timp pentru a actualiza pagina! Formular este afișat!

![New form](images/new_form2.png)

Dar așteptați un minut! Ce o să întâmplă când voi tapați ceva în `title` (titlu) și `text` (text) și o să le salvați?

Nimic! Suntem pe aceeași pagină și textul s-a dispărut... și nici un post n-a fost adăugat. Deci care este problema?

Răspunsul este: nu este o problemă. Trebuie să mai adăugăm codul în funcție *view*.

## Salvarea formularului

Deschideți `blog/views.py`. Acum totul ce noi avem în funcție `post_new` este următoare:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Când facem un submit a formularului, noi suntem redirecționați la aceeași funcție, dar în cazul acesta avem mai multe date în `request`, de exemplu, în `request.POST` (denumirea POST nu este din cauza postului de blog; dar din cauza că "postăm" data). Țineți minte, în fișierul HTML la definiție `<form>` am adăugat atribut `method="POST"`? Toate aceste câmpurile din formular sunt în `request.POST`. Nu trebuie să renumiți `POST` pe altceva (o altă variantă validă pentru atributul `method` este `GET`, dar n-avem timp să explicăm care este diferență).

Deci în funcția *view* noi avem două situații sepărate pentru a gestiona: dintâi, noi accesăm pagină pentru prima dată și dorim să afișăm formularul fără date, în al doilea rând, când ne întoarcem la *view* cu toate date care au fost întroduse. Trebuie să adăugăm o condiție (o să utilizăm `if` pentru acesta):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Este timp să completăm bloc cu `[...]`. Dacă `method` este `POST` atunci dorim să constructăm `PostForm` cu dată de la formular? O să facem în fel următor:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

Următorul lucru este de a verifica că forma este corectă (toate câmpurile obligatorii sunt setate și au valorile corecte). Facem acesta cu `form.is_valid()`.

Verificăm dacă formular este valid, dacă este, îl salvăm!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

În general, avem două lucruri: salvăm formular, utilizând `form.save` și adăugăm autor (pentru că câmpul `author` n-a fost în `PostForm` și el este obligatoriu). `commit=False` înseamnă că noi nu dorim să salvăm modelul `Post` până când – dintâi, noi dorim să adăugăm autorul. Majoritatea timpului o să utilizați `form.save()` fără `commit=False`, dar în cazul acesta, noi avem nevoie de acesta. `post.save()` o să păstreze schimbările (adăugând autor) și blogul nou este creat!

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

`post_detail` is the name of the view we want to go to. Remember that this *view* requires a `pk` variable? To pass it to the views, we use `pk=post.pk`, where `post` is the newly created blog post!

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

Let's see if it works. Go to the page http://127.0.0.1:8000/post/new/, add a `title` and `text`, save it… and voilà! The new blog post is added and we are redirected to the `post_detail` page!

You might have noticed that we are setting the publish date before saving the post. Later on, we will introduce a *publish button* in **Django Girls Tutorial: Extensions**.

That is awesome!

> As we have recently used the Django admin interface, the system currently thinks we are still logged in. There are a few situations that could lead to us being logged out (closing the browser, restarting the DB, etc.). If, when creating a post, you find that you are getting errors referring to the lack of a logged-in user, head to the admin page http://127.0.0.1:8000/admin and log in again. This will fix the issue temporarily. There is a permanent fix awaiting you in the **Homework: add security to your website!** chapter after the main tutorial.

![Logged in error](images/post_create_error.png)

## Form validation

Now, we will show you how cool Django forms are. A blog post needs to have `title` and `text` fields. In our `Post` model we did not say that these fields (as opposed to `published_date`) are not required, so Django, by default, expects them to be set.

Try to save the form without `title` and `text`. Guess what will happen!

![Form validation](images/form_validation2.png)

Django is taking care to validate that all the fields in our form are correct. Isn't it awesome?

## Edit form

Now we know how to add a new form. But what if we want to edit an existing one? This is very similar to what we just did. Let's create some important things quickly. (If you don't understand something, you should ask your coach or look at the previous chapters, since we covered all these steps already.)

Open `blog/templates/blog/post_detail.html` in the code editor and add the line

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
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Open `blog/urls.py` in the code editor, and add this line:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

We will reuse the template `blog/templates/blog/post_edit.html`, so the last missing thing is a *view*.

Let's open `blog/views.py` in the code editor and add this at the very end of the file:

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

This looks almost exactly the same as our `post_new` view, right? But not entirely. For one, we pass an extra `pk` parameter from urls. Next, we get the `Post` model we want to edit with `get_object_or_404(Post, pk=pk)` and then, when we create a form, we pass this post as an `instance`, both when we save the form…

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

![Edit button](images/edit_button2.png)

When you click it you will see the form with our blog post:

![Edit form](images/edit_form2.png)

Feel free to change the title or the text and save the changes!

Congratulations! Your application is getting more and more complete!

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.0/topics/forms/

## Security

Being able to create new posts by clicking a link is awesome! But right now, anyone who visits your site will be able to make a new blog post, and that's probably not something you want. Let's make it so the button shows up for you but not for anyone else.

Open `blog/templates/blog/base.html` in the code editor, find our `page-header` `div` and the anchor tag you put in there earlier. It should look like this:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

We're going to add another `{% if %}` tag to this, which will make the link show up only for users who are logged into the admin. Right now, that's just you! Change the `<a>` tag to look like this:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

This `{% if %}` will cause the link to be sent to the browser only if the user requesting the page is logged in. This doesn't protect the creation of new posts completely, but it's a good first step. We'll cover more security in the extension lessons.

Remember the edit icon we just added to our detail page? We also want to add the same change there, so other people won't be able to edit existing posts.

Open `blog/templates/blog/post_detail.html` in the code editor and find this line:

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

## One more thing: deploy time!

Let's see if all this works on PythonAnywhere. Time for another deploy!

* First, commit your new code, and push it up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Then, in a [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (use the menu button in the upper right of the console) and hit **Reload**. Refresh your https://subdomain.pythonanywhere.com blog to see the changes.

And that should be it! Congrats :)