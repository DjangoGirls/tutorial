# Templates Django

Il est temps d'afficher des données! Pour nous aider, Django fournit des balises de gabarit (**template tags**) qui sont intégrées au framework. Pour le reste du tutoriel, nous utiliserons plutôt le mot template, bien plus répandu que sa traduction "gabarit".

## Qu'est-ce que c'est que des balises de template?

En HTML, vous ne pouvez pas mettre directement du code Python car les navigateurs seraient incapables de le comprendre. Les navigateurs ne connaissent que le HTML. Nous vous avons signalé précédemment que HTML est du genre statique, alors que Python est bien plus dynamique.

Les **Balises de template Django** nous permettent de transfert des choses ressemblant à du Python dans du HTML afin de nous permettre de construire des sites web plus rapidement et facilement. Cool, non?

## Template d'affichage de la liste des posts

Dans le chapitre précédent, nous avons donné à notre template une liste de posts à l'aide de la variable `posts`. Nous allons maintenant les afficher en HTML.

Afin d'afficher une variable dans un template Django, nous utilisons des doubles accolades avec le nom de la variable à l'intérieur. Ça ressemble à ceci:

    {{ posts }}
    

Essayez de faire la même chose avec votre template `blog/templates/blog/post_list.html`: remplacez tout ce qui se trouve entre la seconde balise `<div></div>` avec la ligne `{{ posts }}`. Sauvegardez votre fichier et rafraîchissez votre page pour voir le résultat:

![Figure 13.1][1]

 [1]: images/step1.png

Comme vous pouvez le voir, tout ce que nous avons, c'est ceci:

    [<Post: Mon second post>, <Post: Mon premier post>]
    

Cela signifie que Django l'interprète comme une liste d'objets. Essayez de vous rappeler comment afficher des listes en Python. Si vous avez un trou de mémoire, allez voir dans le chapitre **Introduction to Python**. Vous avez trouvé? Avec des boucles! Dans un template Django, vous pouvez les écrire de cette façon:

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```
    

Essayez-la dans votre template.

![Figure 13.2][2]

 [2]: images/step2.png

Ça marche! Cependant, nous aimerions plutôt les afficher à la manière des posts statiques, comme lorsque nous les avions créés dans le chapitre **Introduction to HTML**. Vous pouvez mixer HTML et balises de template. Notre `body` ressemble maintenant à ceci:

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaks }}</p>
    </div>
{% endfor %}
```
    

{% raw %}Tout ce qui se situe entre `{% for %}` et `{% endfor %}` va être répété pour chaque objet dans la liste. Rafraichissez votre page:{% endraw %}

![Figure 13.3][3]

 [3]: images/step3.png

{% raw %}Avez-vous remarqué que nous utilisons une notation légèrement différente cette fois (`{{ post.title }}` or `{{ post.text }}`)? Nous accédons aux données associées à chaque champ défini dans notre modèle `Post`. De même, les `|barres verticales` nous permettent de rediriger le texte des posts à travers un filtre qui convertit automatiquement les fins de lignes en paragraphes.{% endraw %}

## Une dernière chose

Ce serait génial si nous pouvions aller sur notre site web hébergé sur Heroku et voir toutes ces nouvelles fonctionnalités! Remontons nos manches et déployons encore une fois. Si vous ne vous souvenez plus de ce que fait chaque commande, consultez la fin du chapitre 15:

```bash
$ git status
...
$ git add -A .
$ git status
...
$ git commit -m "Utilisation de template Django à la place de HTML statique"
...
$ git push heroku master
```
    

Félicitations! Maintenant, pourquoi ne pas essayer d'ajouter un nouveau post à l'aide de l'interface d'administration? N'oubliez pas d'ajouter une date de publication! Ensuite, rafraîchissez votre page et regardez si votre post apparaît.

Ça a marché? Super! Vous pouvez être fière de vous! Allez faire une pause et manger quelque chose qui vous fera plaisir: vous l'avez bien mérité!

![Figure 13.4][4]

 [4]: images/donut.png
