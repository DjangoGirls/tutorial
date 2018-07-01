# Formulaires Django

La dernière chose que nous voulons faire sur notre site web, c'est créer une manière sympathique d'ajouter ou éditer des blog posts. `L'interface d'administration` de Django est cool, mais elle est assez complexe à personnaliser et à rendre jolie. With `forms` we will have absolute power over our interface – we can do almost anything we can imagine!

Ce qui est pratique avec les formulaires Django, c'est que nous pouvons aussi bien en définir un à partir de rien ou créer un `ModelForm` qui va enregistrer le résultat du formulaire dans un modèle.

C'est la seconde solution que nous allons utiliser pour créer un formulaire pour notre modèle `Post`.

Comme toutes les choses importantes dans Django, les formulaires ont leur propre fichier : `forms.py`.

Nous allons devoir créer un fichier avec ce nom dans notre dossier `blog`.

    blog
       └── forms.py
    

Très bien, allons-y et tapez le code suivant:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

Nous avons besoin tout d'abord d'importer les formulaires Django (`from django import forms`), puis, évidemment, notre modèle `Post` (`from .models import Post`).

Comme vous l'avez probablement deviné, `PostForm` est le nom de notre formulaire. We need to tell Django that this form is a `ModelForm` (so Django will do some magic for us) – `forms.ModelForm` is responsible for that.

Ensuite, nous avons une `Meta Classe` qui nous permet de dire à Django quel modèle il doit utiliser pour créer ce formulaire (`model = Post`).

Enfin, nous précisions quels sont le⋅s champ⋅s qui doivent figurer dans notre formulaire. In this scenario we want only `title` and `text` to be exposed – `author` should be the person who is currently logged in (you!) and `created_date` should be automatically set when we create a post (i.e. in the code), right?

Et voilà, c'est tout ! Tout ce qu'il nous reste à faire, c'est d'utiliser ce formulaire dans une *vue* et de l'afficher dans un template.

Donc, encore une fois, nous allons créer des liens vers des pages, des URL, des vues et des modèles.

## Lien vers une page contenant le formulaire

C'est le moment d'ouvrir le fichier `blog/templates/blog/base.html`. Nous allons ajouter un lien dans un `div` appelé `page-header` :

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Note that we want to call our new view `post_new`. The class `"glyphicon glyphicon-plus"` is provided by the bootstrap theme we are using, and will display a plus sign for us.

Après avoir ajouté une ligne, votre fichier HTML devrait maintenant ressembler à ceci:

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

Sauvegardez votre fichier et rafraîchissez la page http://127.0.0.1:8000 : vous devez normalement tomber encore une fois sur l'erreur `NoReverseMatch` !

## URL

Ouvrez le fichier `blog/urls.py` et ajoutez cette ligne :

{% filename %}blog/urls.py{% endfilename %}

```python
url(r'^post/new/$', views.post_new, name='post_new'),
```

Votre fichier doit maintenant ressembler à ceci :

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

After refreshing the site, we see an `AttributeError`, since we don't have the `post_new` view implemented. Let's add it right now.

## La vue post_new

Ouvrez maintenant le fichier `blog/views.py` et ajoutez les lignes suivantes avec celles du `from` qui existent déjà :

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

And then our *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Afin de pouvoir créer un nouveau formulaire `Post`, nous avons besoin d'appeler la fonction `PostForm()` et de la passer au template. We will go back to this *view*, but for now, let's quickly create a template for the form.

## Template

Pour cela, nous avons besoin de créer un fichier `post_edit.html` dans le dossier `blog/templates/blog`. Afin que notre formulaire fonctionne, nous avons besoin de plusieurs choses :

* We have to display the form. We can do that with (for example) {% raw %}`{{ form.as_p }}`{% endraw %}.
* The line above needs to be wrapped with an HTML form tag: `<form method="POST">...</form>`.
* We need a `Save` button. We do that with an HTML button: `<button type="submit">Save</button>`.
* And finally, just after the opening `<form ...>` tag we need to add {% raw %}`{% csrf_token %}`{% endraw %}. C'est très important car c'est ce qui va permettre de sécuriser votre formulaire ! Si vous oubliez ce bit, Django se plaindra lorsque vous essaierez de sauvegarder le formulaire:

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

Rafraîchissons la page ! Et voilà : le formulaire s'affiche !

![Nouveau formulaire](images/new_form2.png)

But, wait a minute! When you type something in the `title` and `text` fields and try to save it, what will happen?

Nothing! We are once again on the same page and our text is gone… and no new post is added. So what went wrong?

La réponse est : rien ! Nous avons juste encore un peu de travail à accomplir. Retournons à notre *vue*.

## Sauvegarder le contenu du formulaire

Open `blog/views.py` once again. Currently all we have in the `post_new` view is the following:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

When we submit the form, we are brought back to the same view, but this time we have some more data in `request`, more specifically in `request.POST` (the naming has nothing to do with a blog "post"; it's to do with the fact that we're "posting" data). Remember how in the HTML file, our `<form>` definition had the variable `method="POST"`? Tous les champs du formulaire se trouvent maintenant dans `request.POST`. Veillez à ne pas renommer `POST` en quoi que ce soit d'autre : la seule autre valeur autorisée pour `method` est `GET`. Malheureusement, nous n'avons pas le temps de rentrer dans les détails aujourd'hui.

So in our *view* we have two separate situations to handle: first, when we access the page for the first time and we want a blank form, and second, when we go back to the *view* with all form data we just typed. Pour gérer ces deux cas, nous allons utiliser une condition `if` (si):

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

Testons donc si notre formulaire est valide et, si c'est le cas, sauvegardons-le !

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

En gros, nous effectuons deux choses ici : nous sauvegardons le formulaire grâce à `form.save` et nous ajoutons un auteur. Rappelez vous, il n'y avait pas de champ `author` dans le `PostForm` mais nous avons obligatoirement besoin d'un auteur pour que le formulaire que nous avons créé soit valide). `commit=False` means that we don't want to save the `Post` model yet – we want to add the author first. Most of the time you will use `form.save()` without `commit=False`, but in this case, we need to supply it. `post.save()` will preserve changes (adding the author) and a new blog post is created!

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

`post_detail` is the name of the view we want to go to. Rappelez-vous : une *vue* a besoin d'une variable `pk`. To pass it to the views, we use `pk=post.pk`, where `post` is the newly created blog post!

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

Voyons si ça marche. Go to the page http://127.0.0.1:8000/post/new/, add a `title` and `text`, save it… and voilà! The new blog post is added and we are redirected to the `post_detail` page!

You might have noticed that we are setting the publish date before saving the post. Later on, we will introduce a *publish button* in **Django Girls Tutorial: Extensions**.

Encore bravo !

> Puisque nous venons d'utiliser l'interface d'administration de Django, le système pense actuellement que nous sommes toujours connectés. There are a few situations that could lead to us being logged out (closing the browser, restarting the DB, etc.). If, when creating a post, you find that you are getting errors referring to the lack of a logged-in user, head to the admin page http://127.0.0.1:8000/admin and log in again. Cependant, vous devinez bien que cette solution n'est pas suffisante à long terme. Afin de corriger ce problème, n'hésitez pas à faire la partie **Devoir : ajouter de la sécurité à son site internet !** qui est située juste après la partie principale du tutoriel.

![Erreur de loggin](images/post_create_error.png)

## Validation de formulaire

Maintenant, nous allons vous montrer à quel point les formulaires Django sont cools ! Un post de blog a besoin de champs `title` (titre) et `text` (texte). In our `Post` model we did not say that these fields (as opposed to `published_date`) are not required, so Django, by default, expects them to be set.

Try to save the form without `title` and `text`. Guess what will happen!

![Validation de formulaire](images/form_validation2.png)

Django tente de valider que tous les champs de notre formulaire sont corrects. N'est-ce pas incroyable?

## Éditer un formulaire

Maintenant, nous savons comme ajouter un nouveau formulaire. Comment faire si nous voulons éditer un formulaire déjà existant ? C'est très similaire à ce que nous venons de faire. Faisons des choses importantes rapidement. (Si vous ne comprenez pas quelque chose, vous devriez demander à votre entraîneur ou regarder les chapitres précédents, car nous avons accompli toutes ces étapes.)

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

Maintenant, dans `blog/urls.py`, ajoutez cette ligne :

{% filename %}blog/urls.py{% endfilename %}

```python
    url(r'^post/(?P<pk>\d+)/edit/$', views.post_edit, name='post_edit'),
```

Nous allons réutiliser le template de `blog/templates/blog/post_edit.html`. Il ne va donc nous manquer qu'une *vue*.

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

Vous ne trouvez pas que ça ressemble presque à la vue de `post_new` ? Regardons un peu plus en détails. For one, we pass an extra `pk` parameter from urls. Next, we get the `Post` model we want to edit with `get_object_or_404(Post, pk=pk)` and then, when we create a form, we pass this post as an `instance`, both when we save the form…

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

![Bouton d'édition](images/edit_button2.png)

Lorsque vous cliquez dessus, vous devez voir le formulaire du post de blog apparaitre :

![Éditer un formulaire](images/edit_form2.png)

N'hésitez pas à changer le titre ou le texte et enregistrer les modifications!

Bravo ! Votre application se complexifie et contient de plus en plus de fonctionnalité !

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/1.11/topics/forms/

## Sécurité

C’est génial de pouvoir créer de nouveaux posts juste en cliquant sur un lien ! Mais maintenant, toute personne visitant votre site sera en mesure de créer un nouveau blog, et ce n'est peut-être pas ce que vous voulez. Faisons en sorte que les boutons apparaissent pour vous mais pas pour les autres.

Dans `blog/templates/blog/base.html`, trouvez notre `page-header` `div` et la balise ancre que vous y avez mis plus tôt. Ça doit ressembler à ça :

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

We're going to add another `{% if %}` tag to this, which will make the link show up only for users who are logged into the admin. Right now, that's just you! Changez la balise `<a>` comme ceci :

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

This `{% if %}` will cause the link to be sent to the browser only if the user requesting the page is logged in. Ce n’est pas une protection complète, mais c’est un bon début. Nous reviendrons sur les questions de sécurité dans les extensions du tutoriel.

Rappelez-vous l'icône de modification que nous venons d'ajouter à notre page de détails? Nous souhaitons également ajouter les mêmes modifications, afin que les autres utilisateurs ne puissent pas modifier les publications existantes.

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

Parce que vous pouvez être connecté, si vous êtes refresh page, vous ne verrez rien de différent. Load the page in a different browser or an incognito window (called "InPrivate" in Windows Edge), though, and you'll see that the link doesn't show up, and the icon doesn't display either!

## Encore un petit effort : déployons !

Nos modifications fonctionnent-elles sur PythonAnywhere ? Pour le savoir, déployons à nouveau !

* First, commit your new code, and push it up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Puis, dans la console bash de [PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

* Enfin, cliquez sur l'onglet [Web](https://www.pythonanywhere.com/web_app_setup/) et cliquez sur **Reload**.

And that should be it! Congrats :)