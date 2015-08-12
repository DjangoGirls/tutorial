# Finaliser votre application

Nous avons déjà franchi toutes les étapes nécessaires à la création de notre site web: nous savons maintenant comment écrire un modèle, une URL, une vue et un template. Nous avons même réussi à rendre notre site web plus joli!

C'est le moment de pratiquer tout ce que vous avez appris aujourd'hui!

Tout d'abord, il faudrait que notre blog possède une page qui permet d'afficher un post, n'est-ce pas?

Nous avons déjà un modèle `Post`, nous n'avons donc pas besoin de retourner éditer `models.py`.

## Créer un lien dans un template

Nous allons tout d'abord ajouter un lien à l'intérieur du fichier `blog/templates/blog/post_list.html`. Pour le moment, ce fichier doit ressembler à ceci:

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaks }}</p>
        </div>
    {% endfor %}
{% endblock content %}
```
    

{% raw %}Nous aimerions pouvoir cliquer sur le titre du post et arriver sur une page nous détaillant celui-ci. Pour cela, changeons `<h1><a href="">{{ post.title }}</a></h1>` et transformons-le en lien:{% endraw %}

```html
<h1><a href="{% url 'blog.views.post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```


{% raw %}C'est le parfait moment pour expliquer le mystérieux `{% url 'blog.views.post_detail' pk=post.pk %}`. Vous vous souvenez peut-être que la notation `{% %}` nous permet d'utiliser les balises de template Django. Cette fois, nous allons utiliser des balises qui vont s'occuper de créer des URLs à notre place.{% endraw %}

`blog.views.post_detail` est le chemin d'accès vers la *vue* `post_detail` que nous aimerions créer. Attention: `blog` désigne notre application (le dossier `blog`) et `views` le fichier `views.py`. Enfin, `post_detail` est le nom de notre *vue*.

Maintenant, allons à l'adresse:

    http://127.0.0.1:8000/
    

Nous allons rencontrer une erreur, ce qui est normal car nous n'avons ni URL ni *vue* pour `post_detail`. Ça doit ressembler à ceci:

![Erreur NoReverseMatch][1]

 [1]: images/no_reverse_match2.png

Allons créer notre URL dans le fichier `urls.py` pour notre *vue* `post_detail`!

### URL: http://127.0.0.1:8000/post/1/

Nous voulons crer une URL pour pointer Django vers une *vue* appelée `post_detail`, ce qui nous permettra d'afficher l'intégralité d'un blog post. Ajoutez la ligne `url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail),` au fichier `blog/urls.py`. Ça devrait ressembler à ceci:

    from django.conf.urls import patterns, include, url
    from . import views
    
    urlpatterns = patterns('',
        url(r'^$', views.post_list),
        url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail),
    )
    

Une nouvelle fois, ce bout de code a l'air effrayant! Ne vous inquiétez pas, nous allons le décortiquer ensemble: - Il commence par `^`, qui désigne le "début" - `post/` signifie seulement qu'après le début, l'URL doit contenir le mot **post** et **/**. Jusque-là, tout va bien. - `(?P<pk>[0-9]+)`: ok, là, on s'accroche:). Cela signifie que Django va prendre tout ce que vous placez là et le transférer à une vue sous la forme d'une variable appelée `pk`. `[0-9]` nous dit aussi que nous ne voulons que des nombres (tout ce qui est entre 0 et 9 inclus) et non des lettres. `+` signifie qu'il faut, au minimum, un chiffre à cet endroit. Du coup, quelque chose comme `http://127.0.0.1:8000/post//` n'est pas valide tandis que `http://127.0.0.1:8000/post/1234567890/` l'est complètement! - `/` - nous avons encore besoin d'un **/** - `$` - "la fin"!

Concrètement, cela signifie que si vous entrez `http://127.0.0.1:8000/post/5/` dans votre barre d'adresse, Django va comprendre que vous cherchez à atteindre une *vue* appelée `post_detail` et qu'il doit communiquer l'information que `pk` est égal `5` dans cette *vue*.

`pk` est un raccourci pour `primary key`. Ce nom est très souvent utilisé dans les projets Django. Cependant, vous pouvez appeler cette variable comme bon vous semble, toujours dans la limite des règles suivantes: pas d'accents, pas de caractères spéciaux, des minuscules et des `_` à la place des espaces! Par exemple, à la place de `(?P<pk>[0-9]+)`, nous pourrions utiliser la variable `post_id`, ce qui donnerait: `(?P<post_id>[0-9]+)`.

Ok! Rafraîchissons la page:

    http://127.0.0.1:8000/
    

Boom! Encore une erreur! Mais on s'y attendait ;)

![AttributeError][2]

 [2]: images/attribute_error2.png

Est-ce que vous vous souvenez de ce que nous devons faire ensuite? Mais bien sûr! Il faut ajouter une vue!

## La vue post_detail

Cette fois, nous allons donner un paramètre supplémentaire à notre *vue*: `pk`. Notre *vue* a besoin de le récupérer, n'est-ce pas? Pour cela, nous allons définir une fonction: `def post_detail(request, pk):`. Attention: notez bien que nous utilisons le même nom que celui que nous avons spécifié dans le fichier url (`pk`). Oublier cette variable est incorrect et va générer une erreur!

Maintenant, nous aimerions obtenir qu'un seul blog post. Pour cela, nous allons utiliser des QuerySets qui ressemblent à ceux-ci:

    Post.objects.get(pk=pk)
    

Cependant, il y a un petit problème dans cette ligne de code. Si aucun de nos `Posts` ne possèdent cette `primary key (clef primaire)` (`pk`), nous allons nous retrouver avec une super erreur bien cracra!

![Erreur DoesNotExist][3]

 [3]: images/does_not_exist2.png

Dans l'idéal, nous aimerions pouvoir éviter ça! Comme d'habitude, Django nous offre l'outil parfait pour ça: `get_object_or_404`. Dans le cas où il n'existerait pas de `Post` avec le `pk` indiqué, une page d'erreur beaucoup plus sympathique s'affichera: c'est ce qu'on appelle une `erreur 404: page non trouvée`.

![Page non trouvée][4]

 [4]: images/404_2.png

La bonne nouvelle, c'est que vous pouvez créer vous-mêmes votre page `Page non trouvée` et en faire ce que vous voulez! Reconnaissez que ce n'est pas le plus important pour le moment donc nous allons zapper cette partie ;).

Ok, ajoutons notre *vue* à notre fichier `views.py`!

Ouvrons le fichier `blog/views.py` et ajoutons le code suivant:

    from django.shortcuts import render, get_object_or_404
    

Cette ligne est à ajouter en dessous des lignes `from` situées en début de fichier. Ensuite, à la fin de notre fichier, nous allons ajouter notre *vue* proprement dite:

    def post_detail(request, pk):
        post = get_object_or_404(Post, pk=pk)
        return render(request, 'blog/post_detail.html', {'post': post})
    

Yep, c'est l'heure de recharger notre page:

    http://127.0.0.1:8000/
    

![Vue post_list][5]

 [5]: images/post_list2.png

Ok, ça a marché! Mais que ce passe-t-il lorsque nous cliquons sur un lien dans un titre de blog post?

![Erreur TemplateDoesNotExist][6]

 [6]: images/template_does_not_exist2.png

Oh non! Encore une erreur! Mais cette fois, vous savez quoi faire: nous avons besoin d'un template!

Nous allons créer un fichier `post_detail.html` dans le dossier `blog/templates/blog`.

Ça ressemblera à ça:

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="date">
        {% if post.published_date %}
            {{ post.published_date }}
        {% endif %}
    </div>
    <h1>{{ post.title }}</h1>
    <p>{{ post.text|linebreaks }}</p>
{% endblock %}
```
    

Une nouvelle fois, nous faisons hériter de `base.html`. Dans le `content` block, nous voulons que s'affiche la date de publication d'un post (si elle existe), son titre et son texte. Mais vous souhaitez peut-être quelques éclaircissements avant, non?

{% raw %}`{% if ... %} ... {% endif %}` est une balise de template que nous pouvons utiliser si nous voulons vérifier quelque chose: souvenez-vous de `if ... else ..` de la section **Introduction to Python**. Dans notre exemple, nous aimerions vérifier si un post possède une date de publication (`published_date`).{% endraw %}

Ok, vous pouvez maintenant rafraîchir votre page et voir si la page `Page not found` a enfin disparu.

![Page détaillée d'un post][7]

 [7]: images/post_detail2.png

Yay! Ça marche!

## Encore un petit effort: déployons!

Ce serait génial si nous pouvions aller sur notre site web hébergé sur Heroku et voir toutes ces nouvelles fonctionnalités! Remontons nos manches et déployons encore une fois. Si vous ne vous souvenez plus de ce que fait chaque commande, consultez la fin du chapitre 15:

```bash
$ git status
...
$ git add -A .
$ git status
...
$ git commit -m "Ajout de vues supplémentaires pour le site."
...
$ git push heroku master
```
    

Normalement, ça devrait suffire! Encore bravo:)
