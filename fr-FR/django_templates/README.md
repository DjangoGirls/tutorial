# Templates Django

Il est temps d'afficher des données ! Pour nous aider, Django fournit des balises de gabarit (**template tags**) qui sont intégrées au framework. Pour le reste du tutoriel, nous utiliserons plutôt le mot template, bien plus répandu que sa traduction "gabarit".

## Qu'est-ce que c'est que des balises de template ?

En HTML, vous ne pouvez pas mettre directement du code Python car les navigateurs seraient incapables de le comprendre. Les navigateurs ne connaissent que le HTML. Nous vous avons signalé précédemment que HTML est du genre statique, alors que Python est bien plus dynamique.

Les **Balises de template Django** nous permettent de transferer des choses ressemblant à du Python dans du HTML afin de nous permettre de construire des sites web plus rapidement. Cool, non ?

## Template d'affichage de la liste des posts

Dans le chapitre précédent, nous avons donné à notre template une liste de posts à l'aide de la variable `posts`. Nous allons maintenant les afficher en HTML.

Afin d'afficher une variable dans un template Django, nous utiliserons des doubles accolades avec le nom de la variable à l'intérieur. Ça ressemble à ceci :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Essayez de faire la même chose avec votre template `blog/templates/blog/post_list.html`. Ouvrez-le avec votre éditeur et remplacez tout ce qui se trouve entre la seconde balise `<div>` jusqu'au troisième `</div>` avec la ligne `{{ posts }}`. Sauvegardez votre fichier et rafraichissez votre page pour voir le résultat :

![Figure 13.1](images/step1.png)

Comme vous pouvez le voir, tout ce que nous avons, c'est ceci :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Cela signifie que Django l'interprète comme une liste d'objets. Essayez de vous rappeler comment afficher des listes en Python. Si vous avez un trou de mémoire, allez voir dans le chapitre **Introduction à Python**. Vous avez trouvé ? Avec des boucles ! Dans un template Django, vous pouvez les écrire de la façon suivante :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Essayez ceci dans votre template.

![Figure 13.2](images/step2.png)

Ça marche ! Cependant, nous aimerions plutôt afficher les posts à la manière des posts statiques, comme lorsque nous les avions créés dans le chapitre **Introduction au HTML**. Vous pouvez mixer HTML et balises de template. Notre `body` ressemble maintenant à ceci :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %}Tout ce qui se situe entre `{% for %}` et `{% endfor %}` va être répété pour chaque objet présent dans la liste. Rafraichissez votre page :{% endraw %}

![Figure 13.3](images/step3.png)

Avez-vous remarqué que nous avons utilisé une notation légèrement différente cette fois-ci (`{{ post.title }}` ou `{{ post.text }}`) ? Nous accédons aux données associées à chaque champ défini dans notre modèle `Post`. De même, le `|linebreaksbr` nous permet de rediriger le texte des posts à travers un filtre qui convertit automatiquement les fins de lignes en paragraphes.

## Une dernière chose

Maintenant, ça serait bien de voir si votre site Web fonctionne toujours sur Internet. Nous allons essayer de le re-déployer sur PythonAnywhere. Voici un récapitulatif des étapes…

* En premier lieu, envoyez votre code sur GitHub (push)

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Ensuite, reconnectez-vous à [PythonAnywhere](https://www.pythonanywhere.com/consoles/) et allez sur la "**Bash console**" (ou démarrer-en une nouvelle), et lancez les commandes suivantes :

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(N’oubliez pas de remplacer `<your-pythonanywhere-domain>` avec votre propre nom de sous domaine sur PythonAnywhere, sans les chevrons.)

* Pour finir, n'oubliez pas de recharger votre application web : onglet [Web](https://www.pythonanywhere.com/web_app_setup/) puis cliquez sur le bouton **Reload**. (Pour rejoindre les autres pages de PythonAnywhere à partir de la console, utilisez le bouton de menu dans le coin supérieur droit). Votre mise à jour devrait apparaître sur https://subdomain.pythonanywhere.com--Allez regarder dans le navigateur ! Si les posts sur PythonAnywhere ne correspondent pas à ceux qui apparaissent dans votre version locale du blog, ne vous inquiétez pas. Les deux bases de données, la locale et celle sur PythonAnywhere, ne sont pas synchronisées comme le reste des fichiers.

Félicitations ! Maintenant, allez de l'avant et essayez d'ajouter un nouveau message dans votre administrateur Django (rappelez-vous d'ajouter publication_date!) Assurez-vous que vous êtes dans l'administrateur Django pour votre site pythonanywhere, https://subdomain.pythonanywhere.com/admin. Ensuite, rafraîchissez votre page pour voir si le message apparaît.

Ça a marché ? Nous sommes super fière de vous ! Éloignez vous un peu de votre clavier maintenant : vous avez mérité de faire une pause. :)

![Figure 13.4](images/donut.png)