# Introduction au HTML

Vous vous demandez sûrement ce qu'est un template.

Un template est un fichier que vous pouvez réutiliser afin de présenter des informations différentes sous un seul et même format. Par exemple, vous pourriez avoir envie d'utiliser un template pour écrire une lettre: bien que son contenu varie ou qu'elle puisse être adressée à des personnes différentes, sa forme reste la même.

Le format d'un template Django est décrit grâce à un langage qui s'appelle HTML (c'est le même HTML que celui dont nous parlions dans le chapitre un, **Comment Internet marche**).

## Qu'est-ce que le HTML?

HTML est un code simple qui est interprété par votre navigateur (Chrome, Firefox ou Safari) et qui permet d'afficher une page web à l'utilisateur.

HTML est l'abréviation de "HyperText Markup Language." **HyperText** signifie que s'est un type de texte qui supporte les hyperliens entre les pages. **Markup** signifie que nous avons pris un document et que nous avons balisé le code pour signifier (ici, au navigateur) comment il faut interpréter la page. Le code HTML est construit à l'aide de **balises**, chacune commençant par `<` et finissant par `>`. Ces balises permettent de structurer les **éléments**.

## Votre premier template!

Créer un template signifie créer un fichier template. Et oui, encore des fichiers! Vous aviez déjà probablement remarqué que tout tourne autour des fichiers.

Les templates sont sauvegardés dans le dossier `blog/templates/blog`. Tout d'abord, créons un dossier appelé `templates` à l'intérieur du dossier de notre blog. Ensuite, créez un autre dossier appelé `blog` à l'intérieur de votre dossier templates:

    blog
    └───templates
        └───blog
    

Vous pourriez vous demander pourquoi nous avons besoin de deux dossiers portant tous les deux le nom `blog`. Comme vous le découvrirez plus tard, c'est une simple convention de nommage qui va nous faciliter la vie quand les choses vont commencer à devenir compliquées.

Et maintenant, créez un fichier `post_list.html` (laisser le vide pour le moment) dans le dossier `templates/blog/blog`.

Allons regarder à quoi ressemble notre site maintenant: http://127.0.0.1:8000/

> Si vous avez une erreur `TemplateDoesNotExists`, essayez de redémarrer votre serveur. Prenez votre ligne de commande, arrêtez votre server en appuyant simultanément sur Ctrl+C (les touches Control et C de votre clavier) et relancer le en tapant la commande `python manage.py runserver`.

![Figure 11.1][1]

 [1]: images/step1.png

Et voilà, il n'y a plus d'erreurs! Bravo :) Cependant, notre site ne peut rien faire d'autre pour le moment qu'afficher une page blanche. La faute à notre template que nous avons laissé vide. Allons corriger ça.

Ajoutez ce qui suit à votre fichier template:

    <html>
        <p>Hi there!</p>
        <p>It works!</p>
    </html>
    

Alors, à quoi ressemble notre site web maintenant? Allons le découvrir: http://127.0.0.1:8000/

![Figure 11.2][2]

 [2]: images/step3.png

Ça marche! Bon boulot :)

*   La balise la plus élémentaire, `<html>`, figure toujours au début de n'importe quelle page web tandis que `</html>` est toujours située à la fin. Comme vous pouvez le constater, l'intégralité du contenu de notre page web est située entre la balise de départ, `<html>`, et la balise fermante, `</html>`
*   `<p>` est la balise pour les éléments de type paragraphe. `</p>` permet de fermer chaque paragraphe.

## Head & body

Chaque page HTML est divisée en deux éléments: **head** (entête) et **body** (corps).

*   **head** est un élément qui contient des informations sur le document: son contenu ne s'affichera pas à l'écran.

*   **body** est un élément qui contient tout le reste. Son contenu s'affichera à l'écran et constituera notre page web.

Nous utilisons `<head>` pour transmettre la configuration de la page au navigateur tandis que `<body>` l'informe sur le contenu de la page.

Par exemple, vous pouvez donner un titre à votre site en utilisant l'élément titre dans le `<head>`:

    <html>
        <head>
            <title>Le blog d'Ola</title>
        </head>
        <body>
            <p>Salut!</p>
            <p>Ça marche :)</p>
        </body>
    </html>
    

Sauvegardez votre fichier et actualisez la page.

![Figure 11.3][3]

 [3]: images/step4.png

Vous avez vu comment le navigateur a compris que « Le Blog d'Ola » est le titre de votre page? Il a interprété `<title>Le blog d'Ola</title>` et a placé ce texte dans la barre de titre de votre navigateur (c'est ce titre qui va être aussi utilisé lorsque vous créez un marque-page, etc.).

Vous avez aussi probablement remarqué que chaque balise ouvrante possède sa *balise fermante*, composée d'un `/`, est qu'elles *encadrent* les différents éléments. Cela signifie que vous ne pouvez pas fermer une balise si celles imbriquées à l'intérieur de celle-ci n'ont pas été fermées.

Pensez à lorsque vous mettez des choses à l'intérieur de boîtes. Vous avez une grosse boîte, `<html></html>`; à l'intérieur de celle-ci, on trouve une plus petite boîte, `<body></body>`, qui contient elle-même d'autres petites boîtes, `<p></p>`.

Essayez de vous rappeler cet exemple lorsque vous utilisez les balises *fermantes* et que vous avez des éléments *imbriqués*. Si vous ne suivez pas ces règles, votre navigateur risque de ne pas être capable d'interpréter votre code correctement et risque de mal afficher votre page web.

## Personnaliser votre template

Et si nous en profitions pour nous amuser un peu? Essayons de personnaliser notre template! Voici quelques balises que vous pouvez utiliser:

*   `<h1>Titre 1</h1>` - pour vos titres les plus importants
*   `<h2>Titre 2</h2>` - pour les sous-titres
*   `<h3>Titre 3</h3>`... et ainsi de suite jusqu'à `<h6>`
*   `<em>texte</em>` permet de mettre l'accent sur une partie du texte
*   `<strong>texte</strong>` permet de mettre encore plus l'accent sur une partie de texte
*   `<br />` permet d'insérer un saut de ligne (vous ne pouvez rien mettre à l'intérieur d'un élément br)
*   `<a href="http://djangogirls.org">link</a>` permet de créer un lien
*   `<ul><li>premier item</li><li>second item</li></ul>` permet de créer des listes, comme celle que nous sommes en train de faire!
*   `<div></div>` permet de créer une section au sein de la page

Voici un exemple de template utilisant plusieurs balises:

    <html>
        <head>
            <title>Django Girls blog</title>
        </head>
        <body>
            <div>
                <h1><a href="">Django Girls Blog</a></h1>
            </div>
    
            <div>
                <p>published: 14.06.2014, 12:14</p>
                <h2><a href="">Mon premier post</a></h2>
                <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
            </div>
    
            <div>
                <p>published: 14.06.2014, 12:14</p>
                <h2><a href="">Mon second post</a></h2>
                <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
            </div>
        </body>
    </html>
    

Nous avons créé trois sections à l'aide de `div`.

*   Le premier `div` contient le titre de notre blogpost - c'est un titre et un lien
*   Les deux autres `div` contiennent nos blogposts avec leur date de publication, un titre de post `h2` qui est cliquable ainsi que deux `p`s (paragraphe) de texte: un pour la date et l'autre pour notre blogpost.

Ce qui nous donne:

![Figure 11.4][4]

 [4]: images/step6.png

Yaaay! Pour l'instant, notre template nous permet seulement d'afficher les **mêmes informations** alors que nous disions précédemment qu'il doit nous permettre d'afficher des informations **différentes** utilisant le **même format**.

Ce qu'on aimerait pouvoir maintenant, c'est afficher les posts que nous avons créés précédemment dans l'interface d'administration de Django. Et si nous nous penchions là dessus?

## Encore une chose!

Ce serait bien de savoir si notre site web sera toujours capable de fonctionner correctement une fois sur Heroku. Essayons de le déployer à nouveau.

Tout d'abord, regardons quels fichiers ont été modifiés depuis notre dernier déploiement:

    $ git status
    

Maintenant, essayons de dire à `git` que nous voulons inclure les changements qui ont eu lieu dans le dossier courant:

    $ git add -A .
    

> **Note** `-A` (abréviation de "tout") signifie que `git` va aussi analyser si vous avez supprimé des fichiers (par défaut, il ne s'intéresse qu'aux nouveaux fichiers ou à ceux modifiés). Essayez de vous rappeler du chapitre 3: `.` permet de désigner le dossier courant.

Avant que nous puissions uploader nos fichiers, regardons ce que `git` à l'intention de faire (tous les fichiers que `git` va uploader vont apparaître en vert):

    $ git status
    

On y est presque: nous devons maintenant lui dire de sauvegarder ces changements dans son historique. Nous allons y ajouter un "message de commit" qui nous permettra de décrire ce qui a été changé. Vous pouvez mettre ce que vous voulez dans un message de commit. Généralement, il est préférable de mettre quelque chose d'utile qui vous permettra de vous souvenir plus tard de ce que vous avez fait.

    $ git commit -m "Modification du HTML du site"
    

> **Note** N'oubliez pas d'utiliser de doubles guillemets autour de votre message de commit.

Une fois que vous avez terminé, vous pouvez enfin uploader (pusher) vos modifications sur Heroku:

    git push heroku master
    

Normalement, ça devrait marcher! Une fois qu'Heroku a terminé, vous pouvez utiliser votre navigateur pour aller sur la page de votre site et la rafraîchir. Normalement, vous devriez constater du changement!
