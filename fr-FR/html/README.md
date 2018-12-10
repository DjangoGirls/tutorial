# Introduction au HTML

Vous vous demandez sûrement ce qu'est un template.

Un template est un fichier que vous pouvez réutiliser afin de présenter des informations différentes sous un seul et même format. Par exemple, vous pourriez avoir envie d'utiliser un template pour écrire une lettre : bien que son contenu varie ou qu'elle puisse être adressée à des personnes différentes, sa forme reste la même.

Le format d'un template Django est décrit grâce à un langage qui s'appelle HTML (c'est le même HTML que celui dont nous parlions dans le chapitre un, **Comment fonctionne l'Internet**).

## Qu'est-ce que le HTML ?

HTML est un code qui est interprété par votre navigateur (Chrome, Firefox ou Safari) et qui permet d'afficher une page web à l'utilisateur.

L'abréviation HTML signifie « HyperText Markup Language ». **HyperText** signifie que c'est un type de texte qui supporte les hyperliens entre les pages. **Markup** signifie que nous avons pris un document et que nous avons balisé le code pour signifier (ici, au navigateur) comment il faut interpréter la page. Le code HTML est construit à l'aide de **balises**, chacune commençant par `<` et finissant par `>`. Ces balises représentent des **éléments** markup.

## Votre premier template !

Créer un template signifie créer un fichier template. Et oui, encore des fichiers ! Vous aviez déjà probablement remarqué que tout tourne autour des fichiers.

Les templates sont sauvegardés dans le dossier `blog/templates/blog`. Tout d'abord, créons un dossier appelé `templates` à l'intérieur du dossier de notre blog. Ensuite, créez un autre dossier appelé `blog` à l'intérieur de votre dossier templates :

    blog
    └───templates
        └───blog
    

Vous pourriez vous demander pourquoi nous avons besoin de deux dossiers portant tous les deux le nom `blog`. Comme vous le découvrirez plus tard, c'est une convention de nommage qui va nous faciliter la vie quand les choses vont commencer à devenir compliquées.

Et maintenant, créez un fichier `post_list.html` (laisser le vide pour le moment) dans le dossier `templates/blog/blog`.

Allons regarder à quoi ressemble notre site maintenant : http://127.0.0.1:8000/

> Si vous avez encore l'erreur `TemplateDoesNotExist`, essayez de redémarrer votre serveur. Allez sur votre ligne de commande et arrêtez votre server en appuyant simultanément sur Ctrl+C (les touches Control et C de votre clavier). Vous pouvez le relancer en tapant la commande `python manage.py runserver`.

![Figure 11.1](images/step1.png)

Et voilà, il n'y a plus d'erreurs ! Bravo :) Cependant, notre site ne peut rien faire d'autre pour le moment qu'afficher une page blanche. La faute à notre template que nous avons laissé vide. Allons corriger ça.

Ouvrez le nouveau fichier dans l’éditeur de code et ajoutez le morceau suivant :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

Alors, à quoi ressemble notre site web maintenant ? Allons le découvrir : http://127.0.0.1:8000/

![Figure 11.2](images/step3.png)

Ça marche ! Bon boulot :)

* La balise la plus élémentaire, `<html>`, figure toujours au début de n'importe quelle page web tandis que `</html>` est toujours située à la fin. Comme vous pouvez le constater, l'intégralité du contenu de notre page web est située entre la balise de départ, `<html>`, et la balise fermante, `</html>`
* `<p>` est la balise pour les éléments de type paragraphe. `</p>` permet de fermer chaque paragraphe.

## Head et body

Chaque page HTML est divisée en deux éléments : **head** (entête) et **body** (corps.

* **head** est un élément qui contient des informations sur le document : son contenu ne s'affichera pas à l'écran.

* **body** est un élément qui contient tout le reste. Son contenu s'affichera à l'écran et constituera notre page web.

Nous utilisons `<head>` pour transmettre la configuration de la page au navigateur tandis que `<body>` l'informe sur le contenu de la page.

Par exemple, vous pouvez donner un titre à votre page web en utilisant l'élément titre dans le `<head>` :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Ola's blog</title>
    </head>
    <body>
        <p>Hi there!</p>
        <p>It works!</p>
    </body>
</html>
```

Sauvegardez votre fichier et actualisez la page.

![Figure 11.3](images/step4.png)

Vous avez vu comment le navigateur a compris que « Le Blog d'Ola » est le titre de votre page ? Il a interprété `<title>Le blog d'Ola</title>` et a placé ce texte dans la barre de titre de votre navigateur (c'est ce titre qui va être aussi utilisé lorsque vous créez un marque-page, etc.).

Vous avez aussi probablement remarqué que chaque balise ouvrante possède sa *balise fermante*, composée d'un `/`, est qu'elles *encadrent* les différents éléments. Cela signifie que vous ne pouvez pas fermer une balise si celles imbriquées à l'intérieur de celle-ci n'ont pas été fermées.

Pensez à lorsque vous mettez des choses à l'intérieur de boîtes. Vous avez une grosse boîte, `<html></html>`; à l'intérieur de celle-ci, on trouve une plus petite boîte, `<body></body>`, qui contient elle-même d'autres petites boîtes, `<p></p>`.

Essayez de vous rappeler de cet exemple lorsque vous utilisez les balises *fermantes* et que vous avez des éléments *imbriqués*. Si vous ne suivez pas ces règles, votre navigateur risque de ne pas être capable d'interpréter votre code correctement et votre page web sera mal affichée.

## Personnaliser votre template

Et si nous en profitions pour nous amuser un peu ? Essayons de personnaliser notre template ! Voici quelques balises que vous pouvez utiliser :

* `<h1>Titre 1</h1>` pour vos titres les plus importants
* `<h2>Titre 2</h2>` pour les sous-titres
* `<h3>Titre 3</h3>` ... et ainsi de suite jusqu'à `<h6>`
* `<p>Un paragraphe contenant du texte</p>`
* `<em>texte</em>` permet de mettre l'accent sur une partie du texte
* `<strong>texte</strong>` permet de mettre encore plus l'accent sur une partie de texte
* `<br>` permet d'insérer un saut de ligne (vous ne pouvez rien mettre à l'intérieur d'un élément br et il n'y a pas de balise fermante)
* `<a href="https://djangogirls.org">link</a>` permet de créer un lien
* `<ul><li>premier item</li><li>second item</li></ul>` permet de créer des listes, comme celle que nous sommes en train de faire !
* `<div></div>` permet de créer une section au sein de la page

Voici un exemple d’un modèle complet, copiez et collez-le dans `blog/templates/blog/post_list.html` :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">Mon second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </div>
    </body>
</html>
```

Nous avons créé trois sections à l'aide de `div`.

* The first `div` element contains the title of our blog – it's a heading and a link
* Another two `div` elements contain our blog posts with a published date, `h2` with a post title that is clickable and two `p`s (paragraph) of text, one for the date and one for our blog post.

Ce qui nous donne :

![Figure 11.4](images/step6.png)

Yaaay ! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## Une dernière chose : déployer !

Ne serait-il pas génial de pouvoir voir tout ces changements en ligne ? Hop, déployons à nouveau !

### Commit, and push your code up to GitHub

Tout d'abord, allons voir quels sont les fichiers qui ont changé depuis notre dernier déploiement (lancez ces commandes dans votre console locale et non celle de PythonAnywhere) :

{% filename %}command-line{% endfilename %}

    $ git status
    

Make sure you're in the `djangogirls` directory and let's tell `git` to include all the changes in this directory:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    

> **Note** `--all` means that `git` will also recognize if you've deleted files (by default, it only recognizes new/modified files). Essayez de vous rappeler du chapitre 3 : `.` permet de désigner le dossier courant.

Avant que nous puissions uploader nos fichiers, regardons ce que `git` à l'intention de faire (tous les fichiers que `git` va uploader vont apparaître en vert) :

{% filename %}command-line{% endfilename %}

    $ git status
    

On y est presque : nous devons maintenant lui dire de sauvegarder ces changements dans son historique. Nous allons y ajouter un "message de commit" qui nous permettra de décrire ce qui a été changé. Vous pouvez mettre ce que vous voulez dans un message de commit. Généralement, il est préférable de mettre quelque chose d'utile qui vous permettra de vous souvenir plus tard de ce que vous avez fait.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Modification du HTML du site"
    

> **Note** N'oubliez pas d'utiliser de doubles guillemets autour de votre message de commit.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Puller les modifications sur PythonAnywhere et recharger son appli web

* Allez sur la page des [consoles de PythonAnywhere](https://www.pythonanywhere.com/consoles/). Retournez dans votre **console Bash** ou ouvrez-en une nouvelle puis tapez la commande suivante :

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

And watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **"Files" page** and view your code on PythonAnywhere (you can reach other PythonAnywhere pages from the menu button on the console page).

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)