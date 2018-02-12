# Finaliser votre application

Nous avons déjà franchi toutes les étapes nécessaires à la création de notre site web : nous savons maintenant comment écrire un modèle, une URL, une vue et un template. Nous avons même réussi à rendre notre site web plus joli !

C'est le moment de pratiquer tout ce que vous avez appris aujourd'hui !

Tout d'abord, il faudrait que notre blog possède une page qui permet d'afficher un post, n'est-ce pas ?

Nous avons déjà un modèle `Post`, nous n'avons donc pas besoin de retourner éditer `models.py`.

## Créer un lien dans un template

Nous allons commencer par ajouter un lien à l’intérieur du fichier `blog/templates/blog/post_list.html`. À ce stade, il devrait ressembler à ceci :{% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

{% raw %}Nous aimerions pouvoir cliquer sur le titre du post et arriver sur une page avec le contenu de celui-ci. Pour cela, changeons `<h1><a href="">{{ post.title }}</a></h1>` pour qu'il pointe vers la page de contenu du post :{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}C'est le moment parfait pour expliquer ce mystérieux `{% url 'post_detail' pk=post.pk %}`. Vous vous souvenez peut-être que la notation `{% %}` nous permet d'utiliser les balises de template Django. Cette fois, nous allons utiliser des balises qui vont s'occuper de créer des URLs à notre place !{% endraw %}

The `post_detail` part means that Django will be expecting a URL in `blog/urls.py` with name=post_detail

Et qu’en est-il `pk=post.pk` ? `pk` est l’abréviation de clé primaire ("primary key" en anglais), qui est une référence unique pour chaque élément enregistré dans une base de données. Comme nous n'avons pas spécifiée de clé primaire dans notre modèle `Post`, Django en crée une pour nous (par défaut, un nombre qui augmente d’un pour chaque enregistrement, c'est-à-dire 1, 2, 3 etc..) et l’ajoute comme un champ nommé `pk` à chacun de nos posts. Nous accédons à la clé primaire en écrivant `post.pk`, de la même manière, que nous pouvons accéder autres champs (`titre`, `auteur`, etc...) dans notre objet de `Post` !

Maintenant si on jette un coup d’œil à : http://127.0.0.1:8000/, nous rencontrons une erreur. Ceci est prévisible puisque nous n'avons pas d'URL ni de *view* pour `post_detail`. L'erreur ressemble à ceci :

![Erreur NoReverseMatch](images/no_reverse_match2.png)

## Créer une URL vers le contenu d'un post

Allons créer notre URL dans le fichier `urls.py` pour notre *vue* `post_detail`!

Nous aimerions que le contenu de notre premier post s'affiche à cette **URL** : http://127.0.0.1:8000/post/1/

Allons créer une URL dans le fichier `blog/urls.py` qui pointera Django vers une *vue* appelée `post_detail`. Cela nous permettra d'afficher l'intégralité d'un post de blog. Add the line `url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),` to the `blog/urls.py` file. Votre fichier devrait maintenant ressembler à ceci :

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
]
```

This part `^post/(?P<pk>\d+)/$` looks scary, but no worries – we will explain it for you:

- it starts with `^` again – "the beginning".
- `post/` just means that after the beginning, the URL should contain the word **post** and a **/**. So far so good.
- `(?P<pk>\d+)` – this part is trickier. Cela signifie que Django va prendre tout ce que vous placez là et le transférer à une vue sous la forme d'une variable appelée `pk`. (Note that this matches the name we gave the primary key variable back in `blog/templates/blog/post_list.html`!) `\d` also tells us that it can only be a digit, not a letter (so everything between 0 and 9). `+` signifie qu'il faut, au minimum, un chiffre à cet endroit. So something like `http://127.0.0.1:8000/post//` is not valid, but `http://127.0.0.1:8000/post/1234567890/` is perfectly OK!
- `/` – then we need a **/** again.
- `$` – "the end"!

Concrètement, cela signifie que si vous entrez `http://127.0.0.1:8000/post/5/` dans votre barre d'adresse, Django va comprendre que vous cherchez à atteindre une *vue* appelée `post_detail` et qu'il doit communiquer l'information que `pk` est égal `5` dans cette *vue*.

OK, we've added a new URL pattern to `blog/urls.py`! Let's refresh the page: http://127.0.0.1:8000/ Boom! The server has stopped running again. Have a look at the console – as expected, there's yet another error!

![AttributeError](images/attribute_error2.png)

Est-ce que vous vous souvenez de ce que nous devons faire ensuite ? Il falloir ajouter une vue !

## Ajouter une vue pour le contenu du post

This time our *view* is given an extra parameter, `pk`. Notre *vue* va avoir besoin de le récupérer. Pour cela, nous allons définir une fonction : `def post_detail(request, pk):`. Attention : notez bien que nous utilisons le même nom que celui que nous avons spécifié dans le fichier url (`pk`). Oublier cette variable est incorrect et va générer une erreur !

Now, we want to get one and only one blog post. To do this, we can use querysets, like this:

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

But this code has a problem. If there is no `Post` with the given `primary key` (`pk`) we will have a super ugly error!

![Erreur DoesNotExist](images/does_not_exist2.png)

Dans l'idéal, nous aimerions pouvoir éviter ça! Comme d'habitude, Django nous offre l'outil parfait pour ça : `get_object_or_404`. In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![Page non trouvée](images/404_2.png)

La bonne nouvelle, c'est que vous pouvez créer vous-mêmes votre page `Page non trouvée` et en faire ce que vous voulez ! Reconnaissez que ce n'est pas le plus important pour le moment donc nous allons zapper cette partie ;).

OK, time to add a *view* to our `views.py` file!

In `blog/urls.py` we created a URL rule named `post_detail` that refers to a view called `views.post_detail`. This means that Django will be expecting a view function called `post_detail` inside `blog/views.py`.

We should open `blog/views.py` and add the following code near the other `from` lines:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

And at the end of the file we will add our *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Hop, réactualisons la page http://127.0.0.1:8000/

![Vue post_list](images/post_list2.png)

C'est bon, ça a marché ! Mais que ce passe-t-il lorsque nous cliquons sur un lien dans un titre de blog post ?

![Erreur TemplateDoesNotExist](images/template_does_not_exist2.png)

Oh non ! Encore une erreur ! Mais cette fois, vous savez quoi faire : nous avons besoin d'un template !

## Create a template for the post details

Nous allons créer un fichier `post_detail.html` dans le dossier `blog/templates/blog`.

Le résultat devrait ressembler à ça :

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

Une nouvelle fois, nous faisons hériter de `base.html`. Dans le `content` block, nous voulons que s'affiche la date de publication d'un post (si elle existe), son titre et son texte. Mais vous souhaitez peut-être quelques éclaircissements avant, non?

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ..` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

Ok, vous pouvez maintenant rafraîchir votre page et voir si la page `Page not found` a enfin disparu.

![Page détaillée d'un post](images/post_detail2.png)

Yay ! Ça marche!

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Puis, dans la console bash de [PythonAnywhere](https://www.pythonanywhere.com/consoles/):

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