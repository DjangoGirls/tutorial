# Formulaires Django

La dernière chose que nous voulons faire sur notre site web, c'est de créer une manière sympathique d'ajouter ou éditer des blog posts. `L'interface d'administration` de Django est cool, mais elle est assez complexe à personnaliser et à rendre jolie. Les `formulaires` vont nous donner un pouvoir absolu sur notre interface: nous allons être capables de faire, à peu près, tout ce que nous pouvons imaginer!

Ce qui est pratique avec les formulaires Django, c'est que nous pouvons aussi bien en définir un à partir de rien ou créer un `ModelForm` qui va enregistrer le résultat du formulaire dans un modèle.

C'est exactement ce que nous voulons faire: nous allons créer un formulaire pour notre modèle `Post`.

Comme toutes les choses qui sont importantes dans Django, les formulaires ont leur propre fichier: `forms.py`.

Nous allons devoir créer un fichier avec ce nom dans notre dossier `blog`.

    blog
       └── forms.py
    

Ouvrons maintenant ce fichier et tapons le code suivant:

    from django import forms
    
    from .models import Post
    
    class PostForm(forms.ModelForm):
    
        class Meta:
            model = Post
            fields = ('title', 'text',)
    

Nous avons besoin tout d'abord d'importer les formulaires Django (`from django import forms`), puis, évidemment, nous avons besoin de notre modèle `Post` (`from .models import Post`).

Comme vous l'avez probablement deviné, `PostForm` est le nom de notre formulaire. Nous avons besoin de préciser à Django que ce formulaire est un `ModelForm`. Nous utilisons `forms.ModelForm` pour cela.

Ensuite, nous avons une `Meta Classe` qui nous permet de dire à Django quel modèle il doit utiliser pour créer ce formulaire (`model = Post`).

Enfin, nous précisions quels sont le⋅s champ⋅s qui doivent figurer dans notre formulaire. Dans notre cas, nous souhaitons que seul `title` et `text` apparaissent dans notre formulaire, car nous obtiendrons les autres données différemment. En effet, nous nous attendons à ce qu'`author` soit le nom de la personne connectée (en l’occurrence, vous! ) et `created_date` soit générée automatiquement lors de la création du post (cf code que nous avons écrit).

Et voilà, c'est tout! Tout ce qu'il nous reste à faire, c'est d'utiliser ce formulaire dans une *vue* et de l'afficher dans un template.

Nous allons donc une nouvelle fois suivre le processus suivant et créer: un lien vers la page, une URL, une vue et un template.

## Lien vers une page contenant le formulaire

C'est le moment d'ouvrir le fichier `blog/templates/blog/base.html`. Nous allons ajouter un lien dans un `div` appelé `page-header`:

```html
<a href="{% url 'blog.views.post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```
    

Remarquez que notre nouvelle vue s'appelle `post_new`.

Après avoir ajouté cette ligne, votre fichier html devrait maintenant ressembler à ceci:

```html
{% load staticfiles %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div class="page-header">
            <a href="{% url 'blog.views.post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
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

Normalement, après avoir rechargé la page `http://127.0.0.1:8000`, vous devriez encore tomber sur l'erreur `NoReverseMatch`.

## URL

Ouvrez le fichier `blog/urls.py` et ajoutez cette ligne:

    url(r'^post/new/$', views.post_new, name='post_new'),
    

Votre fichier doit maintenant ressembler à ceci:

    from django.conf.urls import patterns, include, url
    from . import views
    
    urlpatterns = patterns('',
        url(r'^$', views.post_list),
        url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail),
        url(r'^post/new/$', views.post_new, name='post_new'),
    )
    

Une fois la page rechargée, vous allez voir une `AttributeError`, ce qui est normal, car nous n'avons pas encore de vue `post_new` implémentée. Allons nous occuper de ça maintenant.

## La vue post_new

Ouvrons maintenant le fichier `blog/views.py` et ajoutez les lignes suivantes sous celles existantes:

    from .forms import PostForm
    

Puis ajoutez la *vue*:

    def post_new(request):
        form = PostForm()
        return render(request, 'blog/post_edit.html', {'form': form})
    

Afin de pouvoir créer un nouveau formulaire `Post`, nous avons besoin d'appeler la fonction `PostForm()` et de la passer au template. Nous reviendrons modifier cette *vue* plus tard, mais pour l'instant, créons rapidement un template pour ce formulaire.

## Template

Nous avons pour cela besoin de créer un fichier `post_edit.html` dans le dossier `blog/templates/blog`. Afin que notre formulaire fonctionne, nous avons besoin de plusieurs choses:

*   Nous avons besoin d'afficher le formulaire. Pour cela, nous n'avons qu'à utiliser `{{ form.as_p }}`.
*   La ligne précédente va avoir besoin d'être enveloppée dans des balises HTML: `<form method="POST">...</form>`
*   Nous avons besoin d'un bouton `Save (sauvegarder)`. Nous allons le créer à l'aide d'un bouton HTML: `<button type="submit">Save</button>`
*   Enfin, nous avons besoin d'ajouter `{% raw %}{% csrf_token %}{% endraw %}` juste après la balise `<form ...>`. C'est très important: c'est ce qui va permettre de sécuriser votre formulaire! De toute manière, si vous avez oublié ce petit morceau, Django va se plaindre lors de la sauvegarde du formulaire:

![CSFR Forbidden page][1]

 [1]: images/csrf2.png

Ok, voyons maintenant à quoi devrait ressembler le fichier `post_edit.html`:

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
    

Rafraîchissons la page! Et voilà: le formulaire s'affiche!

![Nouveau formulaire][2]

 [2]: images/new_form2.png

Heu, attendez une minute... Quand vous tapez quelque chose dans `title` et `text` et que vous essayez de le sauvegarder, que se passe-t-il?

Absolument rien! Nous retombons sur la même page sauf qu'en plus, notre texte a disparu et aucun post ne semble avoir été créé. Est-ce que nous venons de rencontrer un bug?

Heureusement non! Nous avons juste encore un peu de travail à accomplir. Retournons à notre *vue*.

## Sauvegarder le contenu du formulaire

Ouvrez à nouveau le fichier `blog/views.py`. Pour le moment, le contenu de notre vue `post_new` se limite à ceci:

    def post_new(request):
        form = PostForm()
        return render(request, 'blog/post_edit.html', {'form': form})
    

Ainsi, lorsque nous soumettons notre formulaire, nous revenons à la même vue, mais cette fois, nous avons un peu plus de données dans `request` ou, plus précisément, dans `request.POST`. Est-ce que vous vous souvenez avoir défini la variable `method="POST"` dans le fichier HTML qui contient notre `<formulaire>`? Tous les champs du formulaire se trouvent maintenant dans `request.POST`. Veillez à ne pas renommer `POST` en quoi que ce soit d'autre: la seule autre valeur autorisée pour `method` est `GET`. Malheureusement, nous n'avons pas le temps de rentrer dans les détails aujourd'hui.

Dans notre *vue*, nous avons donc deux situations différentes à gérer. Tout d'abord, nous avons la situation où nous accédons à la page pour la première fois et que nous voulons un formulaire vide. Ensuite, nous avons la seconde situation où nous retournons sur la *vue* et nous voulons que les champs du formulaire contiennent les informations que nous avions tapées. Pour gérer ces deux cas, nous allons utiliser une condition (`if (si)`).

    if request.method == "POST":
        [...]
    else:
        form = PostForm()
    

Attaquons nous à remplir ces `[...]`. Comme la `method` est `POST`, c'est que nous voulons construire notre `PostForm` avec les données de notre formulaire. Pour cela, nous devons ajouter:

    form = PostForm(request.POST)
    

Facile! La prochaine étape est de vérifier si le contenu de notre formulaire est correct. Nous aimerions vérifier, par exemple, que les champs obligatoires sont bien remplis et qu'aucune donnée incorrecte ne soient sauvegardée. Nous allons utiliser `form.is_valid()`.

Testons donc si notre formulaire est valide et, si c'est le cas, sauvegardons-le!

    if form.is_valid():
        post = form.save(commit=False)
        post.author = request.user
        post.save()
    

En gros, nous effectuons deux choses ici: nous sauvegardons le formulaire grâce à `form.save` et nous ajoutons un auteur. Rappelez vous, il n'y avait pas de champ `author` dans le `PostForm` mais nous avons obligatoirement besoin pour que le formulaire que nous avons créé soit valide. `commit=False` signifie que nous ne voulons pas encore enregistrer notre modèle `Post`. Nous voulons tout d'abord ajouter un auteur. La plupart du temps, vous utiliserez `form.save()` sans `commit=False`. Cependant, nous en avons besoin ici. `post.save()` va nous permettre de sauvegarder les changements, c'est-à-dire l'ajout d'un auteur. Et voilà, maintenant c'est sûr, un nouveau blog post sera créé!

Enfin, ce serait génial si nous pouvions tout de suite obtenir la page `post_detail` pour le blog post que nous venons de créer. Pour cela, nous avons besoin d'un dernier "import":

    from django.shortcuts import redirect
    

Ajoutez-le au tout début de votre page. Maintenant, nous allons ajouter la ligne qui signifie: "aller à la page `post_detail` pour le nouveau post qui vient d'être créé".

    return redirect('blog.views.post_detail', pk=post.pk)
    

`blog.views.post_detail` est le nom de la vue où nous voulons aller. Rappelez-vous: une *vue* a besoin d'une variable `pk`. Afin de le passer à la vue, nous utilisons `pk=post.pk`, où `post` désigne le blog post nouvellement créé!

Et si au lieu de parler, nous vous montrons à quoi ressemble maintenant notre *vue*?

    def post_new(request):
        if request.method == "POST":
            form = PostForm(request.POST)
            if form.is_valid():
                post = form.save(commit=False)
                post.author = request.user
                post.save()
                return redirect('blog.views.post_detail', pk=post.pk)
        else:
            form = PostForm()
        return render(request, 'blog/post_edit.html', {'form': form})
    

Voyons si ça marche. Allez à la page `http://127.0.0.1:8000/post/new/`. Ajoutez un `title` et du `text` et sauvegardez votre formulaire ... Et voilà! Le nouveau post est bien créé et vous êtes redirigé vers la page `post_detail`!

Vous avez peut-être remarqué que nous ne nous sommes pas du tout occupé de la date de publication de nos posts? Nous nous occuperons d'ajouter un *publish button (bouton de publication)* dans la partie **Tutoriel Django Girls: exercices supplémentaires**.

Est-ce que ce n'est pas déjà génial tout ce que nous avons accompli ensemble aujourd'hui?

## Validation de formulaire

Maintenant, nous allons vous montrer à quel point les formulaires Django sont cools! Un blog post a besoin de champs `title (titre)` et `text (texte)`. Comme nous n'avons pas signalé dans notre modèle `Post` que ces deux champs n'étaient pas obligatoire (à l'inverse du cas de `published_date`) Django s'attend à ce qu'ils soient remplis à chaque fois.

Essayez de sauvegarder un formulaire sans mettre de `titre` ou de `texte`. Devinez ce qui va se passer!

![Validation de formulaire][3]

 [3]: images/form_validation2.png

Django va s'occuper de la validation: il va regarder si tous les champs de notre formulaire sont en adéquation avec le modèle. C'est cool, non?

> Comme nous avons récemment utilisé l'interface d'administration de Django, le système pense que nous sommes encore connectés. Cependant, il y a plusieurs cas qui peuvent amener un utilisateur à être déconnecté: fermer le navigateur, redémarrer la base de données, etc. Si jamais vous avez une erreur lors de la création de post qui fait référence au fait que vous ne pouvez pas faire cette action car vous n'êtes pas connecté, allez faire un tour dans l'interface d'administration `http://127.0.0.1:8000/admin`. Cela vous obligera forcément à vous connecter. Cependant, vous devinez bien que cette solution n'est pas bonne sur le long terme. Afin de corriger ce problème, n'hésitez pas à faire la partie **Devoir: ajouter de la sécurité à son site internet!** qui est située juste après la partie principale du tutoriel.

![Erreur de loggin][4]

 [4]: images/post_create_error.png

## Éditer un formulaire

Maintenant, nous savons comme ajouter un nouveau formulaire. Comment faire si nous voulons éditer un formulaire déjà existant? C'est assez proche de ce que nous venons de faire. Créons ce dont nous avons besoin rapidement. Si jamais des choses vous semblent obscures, n'hésitez pas à demander à votre coach ou à revoir les chapitres précédents. Tout ce que nous allons faire maintenant a déjà été expliqué plus en détail précédemment.

Ouvrez le fichier `blog/templates/blog/post_detail.html` et ajoutez la ligne suivante:

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Votre template doit ressembler à ceci:

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="date">
    {% if post.published_date %}
        {{ post.published_date }}
    {% endif %}
    <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
    </div>
    <h1>{{ post.title }}</h1>
    <p>{{ post.text|linebreaks }}</p>
{% endblock %}
```
    

Maintenant, dans `blog/urls.py`, ajoutez cette ligne:

    url(r'^post/(?P<pk>[0-9]+)/edit/$', views.post_edit, name='post_edit'),
    

Nous allons réutiliser le template de `blog/templates/blog/post_edit.html`. Il ne va donc nous manquer qu'une *vue*.

Ouvrons `blog/views.py` et ajoutons à la toute fin du fichier:

    def post_edit(request, pk):
        post = get_object_or_404(Post, pk=pk)
        if request.method == "POST":
            form = PostForm(request.POST, instance=post)
            if form.is_valid():
                post = form.save(commit=False)
                post.author = request.user
                post.save()
                return redirect('blog.views.post_detail', pk=post.pk)
        else:
            form = PostForm(instance=post)
        return render(request, 'blog/post_edit.html', {'form': form})
    

Vous ne trouvez pas que ça ressemble presque à la vue de `post_new`? Regardons un peu plus en détails. Tout d'abord, nous passons un paramètre `pk` supplémentaire. Ensuite, nous récupérons le modèle `Post` que nous souhaitons éditer à l'aide de `get_object_or_404(Post, pk=pk)`. Puis, lorsque nous créons un formulaire, nous faisons deux fois de ce post une `instance`. Tout d'abord lorsque nous sauvegardons le formulaire:

    form = PostForm(request.POST, instance=post)
    

Puis ensuite lorsque nous ouvrons le formulaire associé à ce post afin de l'éditer:

    form = PostForm(instance=post)
    

Alors, voyons si ça marche! Allons sur la page `post_detail`. Un bouton d'édition devrait apparaître dans le coin supérieur droit de la page:

![Bouton d'édition][5]

 [5]: images/edit_button2.png

Lorsque vous cliquez dessus, vous devez voir le formulaire du blog post apparaître:

![Éditer un formulaire][6]

 [6]: images/edit_form2.png

Essayez de manipuler un peu ce que vous venez de créer: ajoutez du texte, changez le titre puis sauvegardez ces changements!

Bravo! Votre application se complexifie et contient de plus en plus de fonctionnalité!

Si vous souhaitez en apprendre plus sur les formulaires Django, n'hésitez pas à consulter la documentation associée: https://docs.djangoproject.com/en/1.7/topics/forms/

## Encore un petit effort: déployons!

Ce serait génial si nous pouvions aller sur notre site web hébergé sur Heroku et voir toutes ces nouvelles fonctionnalités! Remontons nos manches et déployons encore une fois. Si vous ne vous souvenez plus de ce que fait chaque commande, consultez la fin du chapitre 15:

```bash
$ git status
...
$ git add -A .
$ git status
...
$ git commit -m "Ajout des vues qui permettent d'ajouter et éditer des blog posts directement sur le site"
...
$ git push heroku master
```
    

Normalement, ça devrait suffire! Encore bravo :)
