# Django formulieren

Het laatste wat we nog willen doen op onze website is een mooie manier maken om blogposts toe te voegen en te bewerken. Django's `admin` is cool, maar het is nogal moeilijk om aan te passen en mooi te maken. Met `forms` hebben we absolute controle over onze interface - we kunnen bijna alles doen wat we willen!

Het mooie aan Django formulieren is dat we óf één helemaal zelf kunnen definiëren, óf een `ModelForm` kunnen maken waarmee de inhoud van het formulier in het model opgeslagen wordt.

Dit is precies wat we willen doen: we gaan een formulier maken voor ons `Post` model.

Zoals elk belangrijk onderdeel van Django, hebben formulieren hun eigen bestand: `forms.py`.

Eerst maken we een bestand aan met deze naam in de `blog` map.

    blog
       └── forms.py
    

Ok, open het bestand in je editor en schrijf de volgende code:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

We moeten eerst Django formulieren importeren (`from django import forms`), net zoals ons `Post` model (`from .models import Post`).

Zoals je waarschijnlijk al door hebt, is `PostForm` de naam van ons formulier. We moeten Django vertellen dat dit formulier een `ModelForm` is (zodat Django automatisch wat magie voor ons uitvoert). Daar zorgt `forms.ModelForm` voor.

Vervolgens hebben we `class Meta`, waar we Django vertellen welk model gebruikt moet worden om dit formulier te creëren (`model=Post`).

Tot slot kunnen we zeggen welke velden ons formulier moet hebben. In dit voorbeeld willen we alleen de `title` en `text` zichtbaar hebben - `author` moet de persoon zijn die op dat moment is ingelogd (jij!) en `created_date` zou automatisch aangemaakt moeten worden op het moment dat we een post maken (door middel van code), toch?

Dat was het! Het enige wat we nu moeten doen is het formulier via een *view* in een template zichtbaar maken.

Daarvoor maken we wederom een link naar de pagina, een URL, een view en een template.

## Link naar een pagina met het formulier

Open `blog/templates/blog/base.html` in de code editor. In de `div` met de naam `page-header` gaan we een link toevoegen:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Let op dat we onze nieuwe view `post_new` willen noemen. De class `"glyphicon glyphicon-plus"` komt uit het bootstrap theme wat we gebruiken, en zal een plusteken tonen.

Na het toevoegen van deze regel zou je HTML-bestand er nu als volgt uit moeten zien:

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

Na het opslaan en verversen van de pagina http://127.0.0.1:8000 zie je een bekende errormelding: `NoReverseMatch`. Klopt dat? Goed!

## URL

Open `blog/urls.py` in je editor en voeg deze regel toe:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new', views.post_new, name='post_new'),
```

Uiteindelijk ziet de code er als volgt uit:

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

Nadat we onze site ververst hebben, zien we een `AttributeError` melding omdat we de `post_new` view nog niet hebben geïmplementeerd. Die gaan we nu toevoegen.

## post_new view

Open nu het `blog/views.py` bestand in je editor en voeg de volgende regels code toe bij de overige regels van de `form` code:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

En dan onze *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Om een nieuw `Post` formulier te creëren moeten we `PostForm()` aanroepen en doorsturen naar de template. We gaan nog terug naar deze *view*, maar voor nu zullen we eerst een template maken voor ons formulier.

## Template

We moeten een bestand `post_edit.html` maken in de `blog/templates/blog`map en openen in de code editor. Om een formulier te kunnen maken hebben we verschillende dingen nodig:

* We moeten het formulier weergeven. Dit kunnen we doen met (bijvoorbeeld) {% raw %}`{{ form.as_p }}`{% endraw %}.
* De bovenstaande regel moet worden omringd door 2 HTML-formuliertags: `<form method="POST">...</form>`.
* We hebben een `Opslaan` -knop nodig. Dat doen we met een HTML-knop: `<button type="submit">Opslaan</button>`.
* En ten slotte, net na de opening `<form ...>`-tag moeten we {% raw %}`{% csrf_token %}`{% endraw %} toevoegen. Dat is heel belangrijk, want het maakt je formulieren veilig! Als je dit stuk vergeet, zal Django klagen wanneer je het formulier probeert te bewaren:

![CSFR Forbidden page](images/csrf2.png)

Ok, dus laten we eens kijken hoe de HTML in `post_edit.html` eruit moet zien:

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

Tijd om te vernieuwen! Hoera! Je formulier wordt weergegeven!

![Nieuw formulier](images/new_form2.png)

Maar wacht eens even! Als je iets in de velden `title` en `text` typt en probeer op te slaan, wat gebeurt er dan?

Niets! We zijn weer op dezelfde pagina en onze tekst is weggegaan… en er is geen nieuwe post toegevoegd. Dus wat ging er fout?

Het antwoord is: niets. We moeten nog wat meer doen in onze *view*.

## Het formulier opslaan

Open `blog/views.py` opnieuw in de code editor. Momenteel is alles dat we in de `post_new` weergave hebben het volgende:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Wanneer we het formulier indienen, komen we terug tot hetzelfde standpunt. maar deze keer hebben we nog wat meer gegevens in `request `, meer specifiek in `request.POST` (de benaming heeft niets te maken met een blog "post"; het heeft te maken met het feit dat we gegevens "posten" . Weet je nog hoe in het HTML-bestand, onze `<form>`definitie, de variabele `method="POST"` stond? Alle velden in het formulier bevinden zich nu in `request.POST`. U moet `POST` niet naar iets anders hernoemen (de enige andere geldige waarde voor `method` is `GET`, maar we hebben geen tijd om uit te leggen wat het verschil is).

Dus in onze *view* hebben we twee afzonderlijke situaties om te behandelen: wanneer we de pagina voor het eerst openen en we een leeg formulier willen en tweede wanneer we teruggaan naar de *view* met alle formuliergegevens die we net hebben ingevoerd. We moeten dus een voorwaarde toevoegen (Daarvoor gebruiken we `if`):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Het is tijd om de stippen `[...]` in te vullen. Als `methode` `POST` is, willen we de `PostForm` construeren met gegevens uit het formulier, toch? We zullen dat als volgt doen:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

Het volgende onderdeel is controleren of het formulier juist is (alle verplichte velden zijn ingesteld en er zijn geen onjuiste waarden ingediend). We doen dat met `form.is_valid()`.

We controleren of het formulier geldig is en zo ja, dan kunnen we het opslaan!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

Er gebeuren hier eigenlijk twee dingen: we slaan het formulier op met `form.save` én we voegen een auteur toe (omdat er geen `author` veld in de `PostForm` zat, maar dit veld is wel verplicht). `commit=False` betekent dat we het `Post` model nog niet willen opslaan - we willen eerst de auteur toevoegen. Meestal gebruik je `form.save()` zonder `commit=False`, maar in dit geval gebruiken we het wel. `post.save()` slaat de wijzigingen (het toevoegen van de auteur) op. Je hebt een nieuwe blog post!

Tot slot zou het gaaf zijn als we meteen naar de `post_detail` pagina voor onze nieuwe post zouden kunnen gaan, toch? Daarvoor hebben we nog een extra import nodig:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Voeg dit helemaal aan het begin van je bestand toe. Nu kunnen we de opdracht geven: "ga naar de `post_detail` pagina voor de nieuw aangemaakte post":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` is de naam van de view waar we heen willen. Herinner je je nog dat deze *view* een `pk` variabele vereist? Om dit door te geven aan de views gebruiken we `pk=post.pk`, waar `post` de blogpost die je net hebt gemaakt is.

Ok, genoeg gepraat. Je wil waarschijnlijk weten hoe de *view* er nu uit ziet, toch?

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

Laten we kijken of het werkt. Ga naar de pagina http://127.0.0.1:8000/post/new, voeg een `title` en `text` toe, sla het op en...voilà! De nieuwe blogpost is toegevoegd en we worden doorgestuurd naar de `post_detail` pagina!

Het is je misschien opgevallen dat we de publicatiedatum vaststellen voordat we het bericht opslaan. Later zullen we een *publicatie knop* introduceren in **Django Girls handleiding: Extensies**

Dat is geweldig!

> Omdat we recent de Django admin interface hebben gebruikt, denkt het systeem dat we nog steeds ingelogd zijn. Er zijn nog een paar situaties die ertoe kunnen leiden dat we uitgelogd worden (bijv: de browser afsluiten, de DB herstarten en dergelijke) If, when creating a post, you find that you are getting errors referring to the lack of a logged-in user, head to the admin page http://127.0.0.1:8000/admin and log in again. This will fix the issue temporarily. There is a permanent fix awaiting you in the **Homework: add security to your website!** chapter after the main tutorial.

![Logged in error](images/post_create_error.png)

## Form validation

Now, we will show you how cool Django forms are. A blog post needs to have `title` and `text` fields. In our `Post` model we did not say that these fields (as opposed to `published_date`) are not required, so Django, by default, expects them to be set.

Try to save the form without `title` and `text`. Guess what will happen!

![Form validation](images/form_validation2.png)

Django is taking care to validate that all the fields in our form are correct. Isn't it awesome?

## Edit form

Now we know how to add a new post. But what if we want to edit an existing one? This is very similar to what we just did. Let's create some important things quickly. (If you don't understand something, you should ask your coach or look at the previous chapters, since we covered all these steps already.)

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

This looks almost exactly the same as our `post_new` view, right? But not entirely. For one, we pass an extra `pk` parameter from `urls`. Next, we get the `Post` model we want to edit with `get_object_or_404(Post, pk=pk)` and then, when we create a form, we pass this post as an `instance`, both when we save the form…

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

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.2/topics/forms/

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