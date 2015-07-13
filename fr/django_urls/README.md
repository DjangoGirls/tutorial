# Les urls Django

Nous sommes sur le point de construire notre première page web: la page d'accueil de notre blog! Avant de passer à la partie code, apprenons-en un peu plus sur les urls Django.

## Qu'est-ce qu'une URL?

Une URL n'est tout simplement qu'une adresse web. Vous pouvez voir une URL à chaque fois que vous visitez un site web: l'URL se trouve dans la barre d'adresse (hé oui! `127.0.0.1:8000` est aussi une URL! Tout comme http://djangogirls.com en est une aussi):

![Url][1]

 [1]: images/url.png

Chaque page internet a besoin de sa propre URL. Cela permet à votre application de savoir ce qu'elle doit afficher à un utilisateur lorsqu'il entre une URL. Dans Django, nous utilisons quelque chose qui s'appelle `URLconf` (Configuration des URLs): c'est un ensemble de patterns que Django va essayer de faire correspondre avec l'URL reçue afin d'afficher la vue correspondante.

## Comment est-ce que les URLs fonctionnent dans Django?

Ouvrons le fichier `mysite/urls.py` et regardons à quoi il ressemble:

    from django.conf.urls import patterns, include, url
    from django.contrib import admin
    
    urlpatterns = patterns('',
        # Examples:
        # url(r'^$', 'mysite.views.home', name='home'),
        # url(r'^blog/', include('blog.urls')),
    
        url(r'^admin/', include(admin.site.urls)),
    )
    

Comme vous pouvez le voir, Django nous a déjà préparé une partie du travail.

Les lignes qui commencent par `#` permettent de commenter notre code: ces lignes ne seront donc pas exécutées par Python. Pratique, non?

Comme vous pouvez le voir, l'adresse de l'interface d'administration est déjà en place:

    url(r'^admin/', include(admin.site.urls)),
    

Cela signifie que pour chaque URL qui commence par `admin/`, Django affichera la *vue* correspondante. Dans cet exemple, vous pouvez constater que toutes les URLs liées à l'interface d'administration sont contenues dans une seule ligne: en plus d'être pratique, cela rend notre fichier beaucoup plus propre et lisible.

## Regex

Vous vous demandez sûrement comment Django arrive à faire correspondre les URLs aux vues correspondantes? Bon, on respire un grand coup car ça va être un peu complexe. Django utilise des `regex`, des expressions régulières. Les regex ont beaucoup (vraiment beaucoup! ) de règles qui permettent de créer des patterns de recherche (ou des formules magiques obscures ;)). Ce n'est pas toujours évident à comprendre, donc ne vous en préoccupez pas trop aujourd'hui: vous aurez tout le temps de revenir dessus plus tard. Aujourd'hui, nous allons seulement utiliser les formules dont nous avons besoin.

Si vous êtes curieux⋅se, voici un petit exemple, histoire de ne pas vous laisser sur votre faim! Imaginez que vous avez un site qui possède une adresse comme celle-ci: `http://www.mysite.com/post/12345/`. `12345` serait le numéro du post à afficher. Ce serait vraiment pénible de devoir écrire une vue différente pour chaque post que nous voudrions rédiger. Du coup, Django rend les choses plus faciles et vous n'avez simplement qu'à écrire `http://www.mysite.com/post/<un nombre>/`. Ne vous préoccupez pas du reste, Django se charge de tout!

## Votre première URL Django!

C'est le moment de créer votre toute première URL! Nous aimerions faire de http://127.0.0.1:8000/ la page d'accueil de notre site web où s'afficherait une liste de posts.

Nous aimerions aussi garder notre fichier `mysite/urls.py` propre. Pour cela, nous allons importer les URLs de notre application `blog` dans notre fichier principal `mysite/urls.py`.

On y va: supprimez les lignes commentées, c'est-à-dire celles qui commencent par `#`, et ajoutez une ligne qui va nous permettre d'importer `blog.urls` dans notre URL principale (`''`).

Votre fichier `mysite/urls.py` doit maintenant ressembler à ceci:

    from django.conf.urls import patterns, include, url
    from django.contrib import admin
    
    urlpatterns = patterns('',
        url(r'^admin/', include(admin.site.urls)),
        url(r'', include('blog.urls')),
    )
    

Django va maintenant rediriger tout ce qui arrive sur `http://127.0.0.1:8000/` vers `blog.urls`. À partir de là, il agira en fonction des instructions que nous lui aurons données.

## blog.urls

Créez un fichier appelé `blog/urls.py`. Ajoutez ces deux lignes au début de votre nouveau fichier:

    from django.conf.urls import patterns, include, url
    from . import views
    

Ici, nous ne faisons qu'importer les méthodes Django dont nous avons besoin ainsi que toutes les `vues` liées à notre application `blog`. Mais nous n'avons pas encore créé de vues! Pas de problème: nous y viendrons dans une minute!

Ensuite, nous pouvons ajouter notre premier pattern d'URL:

    urlpatterns = patterns('',
        url(r'^$', views.post_list),
    )
    

Comme vous pouvez le voir, nous assignons une `vue` appelée `post_list` à l'URL `^$`. Mais qu'est-ce que `^$` signifie? C'est une formule regex magique :) Découpons-la en petits morceaux: - `^` signifie en regex "le début". C'est à partir de ce site que nous pouvons commencer à chercher les correspondances par rapport à notre pattern - `$` signifie "la fin". Ça signifie que nous arrêterons de cherchons notre pattern à cet endroit

Si nous mettons ces deux symboles ensemble, ça donne l'impression que nous sommes à la recherche d'une chaine de caractère (string) vide! C'est exactement ce que nous voulons! En effet, pour l'url resolver de Django, `http://127.0.0.1:8000/` ne fait pas partie de l'URL. Ce pattern va montrer à Django que la vue `views.post_list` doit être affichée lorsqu'un utilisateur de votre site web se rend à l'adresse `http://127.0.0.1:8000/`.

Est-ce que cela vous paraît clair? Ouvrons http://127.0.0.1:8000/ dans notre navigateur pour voir ce que ça donne.

![Erreur][2]

 [2]: images/error1.png

"It works" ne s'affiche plus, pourquoi donc? Ne vous inquiétez pas, c'est tout simplement une page d'erreur et elle ne va pas vous manger! Bien au contraire, il va nous falloir nous nourrir de ce qu'elle raconte:

Vous pouvez lire le message **no attribute 'post_list'**. Est-ce que *post_list* vous rappelle quelque chose? C'est le nom de notre vue! Cela signifie que nous avons posé les fondations, mais que nous n'avons pas encore créé notre *vue*. Pas de problème, on y vient :)

> Si vous voulez en savoir plus au sujet de la configuration des URLs dans Django, vous pouvez aller consulter la documentation officielle du framework: https://docs.djangoproject.com/en/1.7/topics/http/urls/
