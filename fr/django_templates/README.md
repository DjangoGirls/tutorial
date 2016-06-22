# Templates Django

Il est temps d'afficher des données ! Pour nous aider, Django fournit des balises de gabarit (**template tags**) qui sont intégrées au framework. Pour le reste du tutoriel, nous utiliserons plutôt le mot template, bien plus répandu que sa traduction "gabarit".

## Qu'est-ce que c'est que des balises de template ?

En HTML, vous ne pouvez pas mettre directement du code Python car les navigateurs seraient incapables de le comprendre. Les navigateurs ne connaissent que le HTML. Nous vous avons signalé précédemment que HTML est du genre statique, alors que Python est bien plus dynamique.

Les **Balises de template Django** nous permettent de transférer des choses ressemblant à du Python dans du HTML afin de nous permettre de construire des sites web plus rapidement et facilement. Cool, non ?

## Template d'affichage de la liste des posts

Dans le chapitre précédent, nous avons donné à notre template une liste de posts à l'aide de la variable `posts`. Nous allons maintenant les afficher en HTML.

Afin d'afficher une variable dans un template Django, nous utiliserons des doubles accolades avec le nom de la variable à l'intérieur. Ça ressemble à ceci :

```html
{{ posts }}
```

Essayez de faire la même chose avec votre template `blog/templates/blog/post_list.html`. Remplacez tout ce qui se trouve entre la seconde balise `<div>` jusqu'au troisième `</div>` avec la ligne `{{ posts }}`. Sauvegardez votre fichier et rafraichissez votre page pour voir le résultat :

![Figure 13.1][1]

 [1]: images/step1.png

Comme vous pouvez le voir, tout ce que nous avons, c'est ceci :

```python
[<Post: My second post>, <Post: My first post>]
```

Cela signifie que Django l'interprète comme une liste d'objets. Essayez de vous rappeler comment afficher des listes en Python. Si vous avez un trou de mémoire, allez voir dans le chapitre **Introduction à Python**. Vous avez trouvé ? Avec des boucles ! Dans un template Django, vous pouvez les écrire de la façon suivante :

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Essayez ceci dans votre template.

![Figure 13.2][2]

 [2]: images/step2.png

Ça marche ! Cependant, nous aimerions plutôt les afficher à la manière des posts statiques, comme lorsque nous les avions créés dans le chapitre **Introduction au HTML**. Vous pouvez mixer HTML et balises de template. Notre `body` ressemble maintenant à ceci :

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>publié: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %}Tout ce qui se situe entre `{% for %}` et `{% endfor %}` va être répété pour chaque objet présent dans la liste. Rafraichissez votre page :{% endraw %}

![Figure 13.3][3]

 [3]: images/step3.png

Avez-vous remarqué que nous utilisons une notation légèrement différente cette fois (`{{ post.title }}` or `{{ post.text }}`) ? Nous accédons aux données associées à chaque champ défini dans notre modèle `Post`. De même, les barres verticales `|` nous permettent de rediriger le texte des posts à travers un filtre qui convertit automatiquement les fins de lignes en paragraphes.

## Encore une chose !

Maintenant, ça serait bien de voir si votre site Web fonctionne toujours sur Internet. Nous allons essayer de le re-déployer sur PythonAnywhere. Voici un récapitulatif des étapes...

*   En premier lieu, envoyez votre code sur GitHub (push)
```
    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
```

*   Ensuite, reconnectez-vous à [PythonAnywhere][4] et allez sur la "**Bash console**" (ou démarrez-en une nouvelle), et lancez les commandes suivantes :

 [4]: https://www.pythonanywhere.com/consoles/
```
    $ cd my-first-blog
    $ git pull
    [...]
```

*   Finalement, allez sur l'[onglet Web][5] et cliquez sur **Reload** sur votre application web. Votre site mis-à-jour devrait être en ligne !

 [5]: https://www.pythonanywhere.com/web_app_setup/

Félicitations ! Maintenant, pourquoi ne pas essayer d'ajouter un nouveau post à l'aide de l'interface d'administration ? N'oubliez pas d'ajouter une date de publication ! Ensuite, rafraichissez votre page et regardez si votre post apparait.

Ça a marché ? Nous sommes super fières de vous ! Éloignez vous un peu de votre clavier maintenant : vous avez mérité de faire une pause. :)

![Figure 13.4][6]

 [6]: images/donut.png
