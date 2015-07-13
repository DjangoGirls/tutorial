# Django Querysets

Nous avons différents morceaux en place: le modèle `Post` qui est définit dans le fichier `models.py`, la vue `post_list` dans `views.py` et nous venons de créer notre template. Mais comment allons-nous faire pour faire apparaître nos posts dans notre template HTML? Car au final, n'est-ce pas le but que nous souhaiterions atteindre? Nous aimerions prendre du contenu, en l’occurrence notre modèle sauvegardé dans notre base de données, et réussir à joliment l'afficher dans notre template.

C'est à ça que servent les *vues*: connecter les modèles et les templates. Dans notre *vue* `post_list`, nous allons avoir besoin de prendre les modèles dont nous avons besoin et de les passer au template. Concrètement, c'est dans la *vue* que nous allons décider ce qui va s'afficher (modèle) dans un template.

Ok, et sinon, on fait comment?

Nous allons avoir besoin d'ouvrir le fichier `blog/views.py`. Pour l'instant, la *vue* `post_list` ressemble à ceci:

    from django.shortcuts import render
    
    def post_list(request):
        return render(request, 'blog/post_list.html', {})
    

Est-ce que vous vous souvenez de comment rajouter des morceaux de code écris dans d'autres fichiers? Nous en avons parlé dans un chapitre précédent. Nous allons devoir importer notre modèle qui est défini dans le fichier `models.py`. Pour cela, nous allons ajouter la ligne `from .models import Post` de la façon suivante:

    from django.shortcuts import render
    from .models import Post
    

Le point après `from` signifie le *dossier courant* ou *l'application courante*. Comme `views.py` et `models.py` sont dans le même dossier, nous pouvons tout simplement utiliser `.` et le nom du fichier, sans le `.py`. Ensuite, nous importons le modèle (`Post`).

Ok, et après? Afin de pouvoir aller chercher les véritables posts de blog de notre modèle `Post`, nous avons besoin de quelque chose qui s'appelle un `QuerySet`.

## QuerySet

Normalement, ce mot doit vous évoquer quelque chose. Nous en avons un peu parlé dans la section [Django ORM (QuerySets)][1].

 [1]: /django_orm/README.html

Maintenant, nous allons nous intéresser à une liste de blog posts qui sont publiés et classés par date de publication (`published_date`). Ça tombe bien, on a déjà fait ça dans la section sur les QuerySets!

    Post.objects.filter(published_date__isnull=False).order_by('published_date')
    

Il ne nous reste plus qu'à mettre cette ligne de code à l'intérieur de notre fichier `blog/views.py`, dans la fonction `def post_list(request)`:

    from django.shortcuts import render
    from .models import Post
    
    def post_list(request):
        posts = Post.objects.filter(published_date__isnull=False).order_by('published_date')
        return render(request, 'blog/post_list.html', {})
    

Veuillez noter que nous créons une *variable* pour notre QuerySet: `posts`. Considérez que c'est le nom de notre QuerySet. À partir de maintenant, nous allons pouvoir faire référence à notre QuerySet en utilisant ce nom.

Il nous manque encore un petit quelque chose: passer notre QuerySet `posts` à notre template. Nous intéresserons plus particulièrement à celui-ci dans la section suivante.

Dans la fonction `render`, nous avons déjà un paramètre `request`, qui désigne tout ce que nous recevons d'un utilisateur par l'intermédiaire d'Internet, et un fichier template appelé `'blog/post_list.html'`. Le dernier paramètre, qui ressemble à `{}`, va nous permettre de glisser des instructions que notre template va suivre. Nous avons par exemple de lui donner des noms: nous allons rester sur `'posts'` pour le moment :). Ça va ressembler à ça: `{'posts': posts}`. Attention! La partie située avant les `:` est entourée de guillemets simples `''`.

Au final, notre fichier `blog/views.py` doit ressembler à ceci maintenant:

    from django.shortcuts import render
    from .models import Post
    
    def post_list(request):
        posts = Post.objects.filter(published_date__isnull=False).order_by('published_date')
        return render(request, 'blog/post_list.html', {'posts': posts})
    

Et voilà, c'est bon! Nous allons retourner du côté de notre template pour que notre QuerySet puisse s'afficher correctement!

Si vous voulez en savoir plus sur les QuerySets, n'hésitez pas à consulter la documentation officielle du framework: https://docs.djangoproject.com/en/1.7/ref/models/querysets/
