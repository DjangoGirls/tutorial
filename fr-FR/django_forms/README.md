# Formulaires Django

La dernière chose que nous voulons faire sur notre site web, c'est créer une manière sympathique d'ajouter ou éditer des blog posts. L'interface d'administration (`/admin`) de Django est cool, mais elle est assez complexe à personnaliser et à rendre jolie. Les formulaires (`forms`) vont nous donner un pouvoir absolu sur notre interface : nous allons être capables de faire à peu près tout ce que nous pouvons imaginer !

Ce qui est pratique avec les formulaires Django, c'est que nous pouvons aussi bien en définir un à partir de rien ou créer un `ModelForm` qui va enregistrer le résultat du formulaire dans un modèle.

C'est la seconde solution que nous allons utiliser pour créer un formulaire pour notre modèle `Post`.

Comme toutes les choses importantes dans Django, les formulaires ont leur propre fichier : `forms.py`.

Nous allons devoir créer un fichier avec ce nom dans notre dossier `blog`.

    blog
       └── forms.py
    

Ouvrez maintenant ce fichier et tapez le code suivant :

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

Tout d'abord, nous avons besoin d'importer les formulaires Django (`from django import forms`), puis, évidemment, notre modèle `Post` (`from .models import Post`).

Comme vous l'avez probablement deviné, `PostForm` est le nom de notre formulaire. Nous avons besoin de préciser à Django que ce formulaire est un `ModelForm`. Pour cela, nous utilisons `forms.ModelForm`.

Ensuite, nous avons la `class Meta` qui nous permet de dire à Django quel modèle il doit utiliser pour créer ce formulaire (`model = Post`).

Enfin, nous précisions quels sont le⋅s champ⋅s qui doivent figurer dans notre formulaire. Dans notre cas, nous souhaitons que seuls `title` et `text` apparaissent dans notre formulaire. Nous obtiendrons les autres données différemment : par exemple, on s'attend à ce que l'auteur (`author`) soit la personne actuellement connectée (c'est à dire vous !) et que la date de création `created_date` soit générée automatiquement lors de la création du post (cf code que nous avons écrit).

Et voilà, c'est tout ! Tout ce qu'il nous reste à faire, c'est d'utiliser ce formulaire dans une *vue* et de l'afficher dans un template.

Nous allons donc une nouvelle fois suivre le processus suivant et créer : un lien vers la page, une URL, une vue et un template.

## Lien vers une page contenant le formulaire

C'est le moment d'ouvrir le fichier `blog/templates/blog/base.html`. Nous allons ajouter un lien dans une `div` nommé `page-header` :

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Notez que nous souhaitons appeler notre nouvelle vue `post_new`. Les classes `"glyphicon glyphicon-plus"` sont fournies par le thème bootstrap et nous permettent d'afficher un symbole "plus" ("+").

Après avoir ajouté cette ligne, votre fichier HTML devrait maintenant ressembler à ceci :

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

Sauvegardez votre fichier et rafraîchissez la page http://127.0.0.1:8000 : vous devez normalement tomber encore une fois sur l'erreur `NoReverseMatch` !

## URL

Ouvrez le fichier `blog/urls.py` et ajoutez cette ligne :

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new', views.post_new, name='post_new'),
```

Votre fichier doit maintenant ressembler à ceci :

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

Une fois la page rechargée, vous allez voir une `AttributeError`, ce qui est normal. Nous n'avons pas encore implémenté la vue `post_new`. Faisons-le maintenant.

## La vue post_new

Ouvrez maintenant le fichier `blog/views.py` et ajoutez les lignes suivantes avec celles du `from` qui existent déjà :

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

Puis ajoutez la *vue* :

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Afin de pouvoir créer un nouveau formulaire `Post`, nous avons besoin d'appeler la fonction `PostForm()` et de la passer au template. Nous reviendrons modifier cette *vue* plus tard, mais pour l'instant, créons rapidement un template pour ce formulaire.

## Template

Pour cela, nous avons besoin de créer un fichier `post_edit.html` dans le dossier `blog/templates/blog`. Afin que notre formulaire fonctionne, nous avons besoin de plusieurs choses :

* Nous avons besoin d'afficher le formulaire. Pour cela, nous n'avons qu'à utiliser {% raw %}`{{ form.as_p }}`{% endraw %}.
* La ligne précédente va avoir besoin d'être enveloppée des balises HTML `<form method="POST">...</form>`.
* Nous avons besoin d'un bouton `Valider`. Nous allons le créer à l'aide d'un bouton HTML : `<button type="submit">Valider</button>`.
* Enfin, nous devons ajouter {% raw %}`{% csrf_token %}`{% endraw %} juste après `<form ...>`. C'est très important car c'est ce qui va permettre de sécuriser votre formulaire ! Si vous oubliez ce détail, Django se plaindra lorsque vous essaierez de sauvegarder le formulaire:

![CSFR Forbidden page](images/csrf2.png)

Ok, voyons maintenant à quoi devrait ressembler le fichier `post_edit.html` :

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

Heu, attendez une minute... Quand vous tapez quelque chose dans `title` et `text` et que vous essayez de le sauvegarder, que se passe-t-il ?

Absolument rien ! Nous retombons sur la même page sauf qu'en plus, notre texte a disparu et aucun post ne semble avoir été créé. Que s'est-il passé ?

La réponse est encore : rien ! Nous avons juste encore un peu de travail à accomplir. Retournons à notre *vue*.

## Sauvegarder le contenu du formulaire

Ouvrez à nouveau `blog/views.py`. Actuellement, `post_new` n'est composé que des lignes de code suivantes :

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Lorsque nous envoyons notre formulaire, nous revenons à la même vue. Cependant, nous récupérons les données dans `request`, et plus particulièrement dans `request.POST` (le nom "POST" n'a aucun lien avec nos "posts" de blog : il est lié au type de requête effectué à l'envoi des données). Rappelez-vous : nous avions défini la variable `method="POST"` dans le fichier HTML qui contient notre `<form>`. Tous les champs du formulaire se trouvent maintenant dans `request.POST`. Veillez à ne pas renommer `POST`par autre chose (la seule autre valeur autorisée pour `method` est `GET`, mais nous n'avons pas le temps d'expliquer la différence ici).

Donc dans notre *vue* nous avons deux situations différentes à gérer : la première quand on accède à la page pour la première fois et nous voulons un formulaire vide, et la seconde quand on revient à la *vue* avec les données que l'on a saisies dans le formulaire. Pour gérer ces deux cas, nous allons utiliser une condition `if` (si) :

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Il faut maintenant remplir à l'endroit des pointillés `[...]`. Si `method` vaut `POST` alors on veut construire le `PostForm` avec les données du formulaire, non ? Nous allons le faire comme cela :

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

La prochaine étape est de vérifier que le formulaire a été rempli correctement (tous les champs obligatoires ont été remplis et aucune valeur incorrecte n'a été envoyée). Nous allons faire ça en utilisant `form.is_valid()`.

Testons donc si notre formulaire est valide et, si c'est le cas, sauvegardons-le !

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

En gros, nous effectuons deux choses ici : nous sauvegardons le formulaire grâce à `form.save` et nous ajoutons un auteur. Rappelez vous, il n'y avait pas de champ `author` dans le `PostForm` mais nous avons obligatoirement besoin d'un auteur pour que le formulaire que nous avons créé soit valide). `commit=False` signifie que nous ne voulons pas encore enregistrer notre modèle `Post`. Nous voulons tout d'abord ajouter un auteur. La plupart du temps, vous utiliserez `form.save()` sans `commit=False`. Mais ici nous en avons besoin. `post.save()` va nous permettre de sauvegarder les changements, c'est-à-dire l'ajout d'un auteur. Et voilà, un nouveau post de blog est créé !

Enfin, ce serait génial si nous pouvions tout de suite aller à la page `post_detail` du post de blog que nous venons de créer. Pour cela, nous avons besoin d'importer une dernière chose :

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Ajoutez-le au tout début de votre fichier. Maintenant, nous allons ajouter la ligne qui signifie : "aller à la page `post_detail` pour le nouveau post qui vient d'être créé":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` est le nom de la vue où nous voulons aller. Rappelez-vous : une *vue* a besoin d'une variable `pk`. Afin de le passer à la vue, nous utilisons `pk=post.pk`, où `post` désigne le blog post nouvellement créé !

Et si au lieu de parler, nous vous montrions à quoi ressemble maintenant notre *vue* ?

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

Voyons si ça marche. Allez à l'adresse http://127.0.0.1:8000/post/new/, ajoutez un `titre` et du `texte`, sauvegardez ... et voilà ! Le nouveau post est bien créé et vous êtes redirigé vers la page `post_detail` !

Vous avez peut-être remarqué que nous avons choisit une date de publication avant de sauvegarder le post. Nous en aurons besoin lorsque nous créerons le *publish button* (bouton publier) dans **l'un des extensions du tutoriel Django Girls** (en anglais).

Encore bravo !

> Comme nous avons récemment utilisé l'interface d'administration de Django, le système pense que nous sommes toujours connectés. Cependant, il y a plusieurs cas qui peuvent amener un utilisateur à être déconnecté : fermer le navigateur, redémarrer la base de données, etc. Si jamais vous obtenez des erreurs lors de la création d'un post qui disent que vous n'êtes pas connecté, retournez sur la page d'administration présente à l'adresse http://127.0.0.1:8000/admin et connectez vous à nouveau. Cependant, vous devinez bien que cette solution n'est pas suffisante à long terme. Afin de corriger ce problème, n'hésitez pas à faire la partie **Devoir : ajouter de la sécurité à son site internet !** qui est située juste après la partie principale du tutoriel.

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
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
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

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.0/topics/forms/

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