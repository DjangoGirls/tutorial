{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Finaliser votre application

Nous avons déjà franchi toutes les étapes nécessaires à la création de notre site web : nous savons maintenant comment écrire un modèle, une URL, une vue et un template. Nous avons même réussi à rendre notre site web plus joli !

C'est le moment de pratiquer tout ce que vous avez appris !

Tout d'abord, il faudrait que notre blog possède une page qui permet d'afficher un post, n'est-ce pas ?

Nous avons déjà un modèle `Post`, nous n'avons donc pas besoin d'ajouter quoi que ce soit à `models.py`.

## Créer un lien dans un template

Nous allons tout d'abord ajouter un lien à l'intérieur du fichier `blog/templates/blog/post_list.html`. Ouvrez-le dans l’éditeur de code et voyez qu'il devrait ressembler à ceci : {% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

{% raw %}Nous aimerions pouvoir cliquer sur le titre du post et arriver sur une page avec le contenu de celui-ci. Pour cela, changeons `<h1><a href="">{{ post.title }}</a></h1>` pour qu'il pointe vers la page de contenu du post :{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}C'est le moment parfait pour expliquer ce mystérieux `{% url 'post_detail' pk=post.pk %}`. Vous vous souvenez peut-être que la notation `{% %}` nous permet d'utiliser les balises de template Django. Cette fois-ci, nous allons utiliser des balises qui vont s'occuper de créer des URLs à notre place !{% endraw %}

La partie `post_detail` signifie que Django s'attend de trouver une URL en `blog/urls.py` avec nom = post_detail

Et qu’en est-il de `pk=post.pk` ? `pk` est l’abréviation de clé primaire ("primary key" en anglais), qui est une référence unique pour chaque élément enregistré dans une base de données. Comme nous n'avons pas spécifiée de clé primaire dans notre modèle `Post`, Django en crée une pour nous (par défaut, un nombre qui augmente d’un pour chaque enregistrement, c'est-à-dire 1, 2, 3 etc..) et l’ajoute comme un champ nommé `pk` à chacun de nos posts. Nous accédons à la clé primaire en écrivant `post.pk`, de la même manière que nous pouvons accéder à d'autres champs (`titre`, `auteur`, etc...) dans notre objet `Post` !

Maintenant si nous jetons un coup d’œil à http://127.0.0.1:8000/, nous rencontrons une erreur. Ceci est prévisible, puisque nous n'avons ni d'URL ni de *view* pour `post_detail`. L'erreur ressemble à ceci :

![NoReverseMatch error](images/no_reverse_match2.png)

## Créer une URL vers le contenu d'un post

Allons créer notre URL dans le fichier `urls.py` pour notre *vue* `post_detail`!

Nous aimerions que le contenu de notre premier post s'affiche à cette **URL** : http://127.0.0.1:8000/post/1/

Allons créer une URL dans le fichier `blog/urls.py` qui dirigera Django vers une *vue* appelée `post_detail`. Cela nous permettra d'afficher l'intégralité d'un post de blog. Ouvrez le fichier `blog/urls.py` dans l’éditeur de code et ajoutez la ligne `path('post/<int:pk>/', views.post_detail, name='post_detail'),` afin que le fichier ressemble à ceci :

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

This part `post/<int:pk>/` specifies a URL pattern – we will explain it for you:

- `post/` means that the URL should begin with the word **post** followed by a **/**. So far so good.
- `<int:pk>` – this part is trickier. It means that Django expects an integer value and will transfer it to a view as a variable called `pk`.
- `/` – then we need a **/** again before finishing the URL.

That means if you enter `http://127.0.0.1:8000/post/5/` into your browser, Django will understand that you are looking for a *view* called `post_detail` and transfer the information that `pk` equals `5` to that *view*.

OK, we've added a new URL pattern to `blog/urls.py`! Let's refresh the page: http://127.0.0.1:8000/ Boom! The server has stopped running again. Have a look at the console – as expected, there's yet another error!

![AttributeError](images/attribute_error2.png)

Do you remember what the next step is? It's adding a view!

## Ajouter une vue pour le contenu du post

This time our *view* is given an extra parameter, `pk`. Our *view* needs to catch it, right? So we will define our function as `def post_detail(request, pk):`. Note that we need to use exactly the same name as the one we specified in urls (`pk`). Omitting this variable is incorrect and will result in an error!

Now, we want to get one and only one blog post. To do this, we can use querysets, like this:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

But this code has a problem. If there is no `Post` with the given `primary key` (`pk`) we will have a super ugly error!

![DoesNotExist error](images/does_not_exist2.png)

We don't want that! But luckily Django comes with something that will handle that for us: `get_object_or_404`. In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![Page not found](images/404_2.png)

The good news is that you can actually create your own `Page not found` page and make it as pretty as you want. But it's not super important right now, so we will skip it.

OK, time to add a *view* to our `views.py` file!

In `blog/urls.py` we created a URL rule named `post_detail` that refers to a view called `views.post_detail`. This means that Django will be expecting a view function called `post_detail` inside `blog/views.py`.

We should open `blog/views.py` in the code editor and add the following code near the other `from` lines:

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

Yes. It is time to refresh the page: http://127.0.0.1:8000/

![Post list view](images/post_list2.png)

It worked! But what happens when you click a link in blog post title?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

Oh no! Another error! But we already know how to deal with it, right? We need to add a template!

## Create a template for the post details

We will create a file in `blog/templates/blog` called `post_detail.html`, and open it in the code editor.

It will look like this:

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

Once again we are extending `base.html`. In the `content` block we want to display a post's published_date (if it exists), title and text. But we should discuss some important things, right?

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

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

## Updating the static files on the server

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ workon <your-pythonanywhere-username>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (from the menu button in the upper right of the console) and hit **Reload**, and then look at the https://yourname.pythonanywhere.com page to see the result.

And that should be it! Congrats :)