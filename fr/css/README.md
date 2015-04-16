# CSS - Rendez votre site joli !

Soyons honnête : notre blog est plutôt moche, non ? Un peu de CSS devrait nous permettre d'arranger ça !

## Qu'est-ce que le CSS ?

Les feuilles de style en cascade, ou Cascading Style Sheets (CSS), sont un langage informatique utilisé pour décrire l'apparence et le formatage d'un document écrit en langage markup (ex : HTML). Pour faire simple : des produits cosmétiques pour pages web ;).

Je suppose que vous n'avez pas envie de partir de rien et de tout construire vous-même. Pour éviter cela, nous allons une nouvelle fois utiliser différentes ressources créées et mises à disposition gratuitement sur Internet par d'autres développeur·se·s. Réinventer à chaque fois la roue n'est pas fun en plus d'être absolument inutile.

## Utilisons Bootstrap !

Bootsrap est l'un des frameworks HTML et CSS les plus populaires. Il est utilisé pour créer de très beaux sites web : http://getbootstrap.com/

Il fut codé par d'anciens programmeurs de chez Twitter et est maintenant développé par des bénévoles aux quatre coins du monde.

## Installer Bootstrap

Pour installer Bootstrap, vous avez besoin d'ajouter ceci dans le `<head>` de votre fichier `.html` (`blog/templates/blog/post_list.html`) :

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    

En faisant ceci, vous n'ajoutez aucun nouveau fichier à votre projet : vous reliez simplement des fichiers hébergés sur Internet à votre projet. Essayez maintenant de rafraichir votre page. Et voilà !

![Figure 14.1][1]

 [1]: images/bootstrap1.png

C'est déjà un peu mieux, n'est-ce pas ?

## Les fichiers statiques dans Django

Les **fichiers statiques** (static files) font eux aussi partie des nouvelles choses que vous allez apprendre aujourd'hui. Votre CSS ainsi que vos images font partie des fichiers statiques. Ces fichiers ne sont pas dynamiques, ce qui signifie qu'ils ne dépendent pas du contexte de la requête et seront donc identiques pour chaque utilisateur.

Comme la CSS est un fichier statique, nous devons tout d'abord configurer les fichiers statiques dans Django. Vous n'avez besoin de faire cette étape qu'une seule fois. Commençons :

### Configurer les fichiers statiques dans Django

Tout d'abord, nous devons créer un dossier pour y ranger nos fichiers statiques. Allez-y : créez un dossier appelé `static` à l'intérieur de votre dossier `djangogirls`.

    djangogirls
    ├─── static
    └─── manage.py
    

Ouvrez le fichier `mysite/settings.py` et allez à la fin de celui-ci pour ajouter les lignes suivantes :

    STATICFILES_DIRS = (
        os.path.join(BASE_DIR, "static"),
    )
    

Maintenant, Django sait où se trouvent vos fichiers statiques.

## Votre première CSS !

Nous allons créer un fichier CSS afin de personnaliser notre page web. Créez un nouveau dossier appelé `css` à l'intérieur de votre dossier `static`. Ensuite, créez un nouveau fichier appelé `blog.css` à l'intérieur du dossier `css`. Vous êtes prêt·e·s ?

    static
    └─── css
            blog.css
    

Maintenant, écrivons un peu de CSS : ouvrez le fichier `static/css/blog.css` dans votre éditeur de texte.

Vous n'avez peut-être pas envie de passer le reste de la journée à personnaliser vos pages web et à apprendre le CSS. De toute manière, ce n'est pas l'objectif de cet atelier ! Nous vous invitons donc, une fois rentré·e chez vous, à vous plonger dans d'autres tutoriels de CSS. Vous verrez, c'est assez simple à comprendre. Vous pouvez consulter le cours [Codeacademy HTML & CSS course][2] qui est une excellente ressource qui vous permettra d'en apprendre plus sur la personnalisation de site web à l'aide de CSS.

 [2]: http://www.codecademy.com/tracks/web

Que pourrions-nous faire rapidement ? Je sais : changer la couleur de notre entête ! Pour indiquer la couleur que nous souhaitons utiliser, nous devons utiliser un code particulier. Ces codes commencent par `#` et sont suivis de 6 lettres (A-F) et chiffres (0-9). Afin de trouver le code associé à la couleur de votre choix, vous pouvez consulter le site http://www.colorpicker.com/. Vous pouvez aussi utiliser des [couleurs prédéfinies][3], comme le `rouge` et le `vert`.

 [3]: http://www.w3schools.com/cssref/css_colornames.asp

Ajoutez ceci dans votre fichier `static/css/blog.css` :

    h1 a {
        color: #FCA205;
    }
    

`h1 a` est un sélecteur CSS. Cela signifie que nous appliquons ce style pour chaque élément `a` présent à l'intérieur d'un élément `h1` (ce qui est le cas de `<h1><a href="">link</a></h1>`). Dans notre exemple précédent, nous indiquions notre souhait de changer la couleur du texte en `#FCA205`, c'est à dire en orange. Bien évidemment, vous êtes libre de choisir n'importe quelle couleur !

Un fichier CSS permet de déterminer le style des éléments présents dans un fichier HTML. Les différents éléments sont identifiés par leur nom (`a`, `h1`, `body`), l’attribut `class` ou l’attribut `id`. Class et id sont des noms que vous choisissez vous-même. Les classes définissent des groupes d'éléments tandis que les ids désignent des éléments précis. Par exemple, l'élément suivant peut être identifié par CSS à la fois par son nom `a`, sa classe `external_link`, ou son identifiant `link_to_wiki_page` :

    <a href="http://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
    

Nous vous conseillons d'en apprendre un peu plus sur les sélecteurs CSS sur [w3schools][4].

 [4]: http://www.w3schools.com/cssref/css_selectors.asp

Afin que nos modifications fonctionnent, nous devons aussi signaler à notre template HTML que nous utilisons des CSS. Ouvrez le fichier `blog/templates/blog/post_list.html` et ajoutez cette ligne au tout début de celui-ci :

```
    {% load staticfiles %}
``` 

Hop, nous chargeons les fichiers statiques :). Pour l'ajout de code suivant, gardez en tête que le navigateur lit vos fichiers dans l'ordre dans lequel ils lui sont donnés : en le plaçant à l'endroit que nous vous indiquons, vous allez pouvoir remplacer du code provenant des fichiers Boostrap par le vôtre. Donc, entre le `<head>` et le `</head>` et après les liens vers les fichiers CSS de Boostrap, ajoutez ceci :

    <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    

Nous venons simplement de dire à notre template où nous avons rangé notre fichier CSS.

Maintenant, votre fichier doit ressembler à ceci :

    {% load staticfiles %}
    <html>
        <head>
            <title>Django Girls blog</title>
            <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
            <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
            <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
            <link rel="stylesheet" href="{% static 'css/blog.css' %}">
        </head>
        <body>
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
        </body>
    </html>
    

Ok, on sauvegarde et on rafraîchit la page !

![Figure 14.2][5]

 [5]: images/color2.png

Bravo ! Peut-être que nous pourrions un peu aérer notre page web en augmentant la marge du côté gauche ? Essayons pour voir !

    body {
        padding-left: 15px;
    }
    

Ajoutez ceci à votre fichier CSS, sauvegardez-le et voyons le résultat !

![Figure 14.3][6]

 [6]: images/margin2.png

Et si nous changions aussi la police de caractères de notre entête ? Collez ceci dans la partie `<head>` de votre fichier `blog/templates/blog/post_list.html` :

    <link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
    

Cette ligne nous permet d'importer la police de caractères *Lobster* depuis Google Fonts (https://www.google.com/fonts).

Maintenant, ajouter la ligne `font-family: 'Lobster';` dans votre fichier CSS `static/css/blog.css`. Attention à bien la placer à l'intérieur du block déclaratif `h1 a` (c'est à dire entre les accolades `{` et `}`). Ensuite, rechargez la page. Votre code doit ressembler à ceci :

    h1 a {
        color: #FCA205;
        font-family: 'Lobster';
    }
    

![Figure 14.3][7]

 [7]: images/font.png

Super !

Comme nous l'avions mentionné précédemment, il existe une notion de classe dans CSS. En gros, cela vous permet de donner un nom à un morceau de code HTML auquel vous souhaitez appliquer un style particulier sans que cela ne concerne le reste du code. C'est particulièrement pratique lorsque vous avez deux divs qui font quelque chose de différent (par exemple, votre entête et votre post) et que vous ne voulez pas qu'ils soient identiques.

Allons donner des noms à certaines parties de notre code html. Ajouter la classe `page-header` à votre `div` qui contient votre entête. Votre fichier doit ressembler maintenant à ceci :

    <div class="page-header">
        <h1><a href="/">Django Girls Blog</a></h1>
    </div>
    

Maintenant, ajouter la classe `post` à votre `div` contenant votre blog post.

    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaks }}</p>
    </div>
    

Nous allons maintenant ajouter des blocs déclaratifs à différents sélecteurs. Les sélecteurs qui commencent par `.` sont reliés aux classes. Le net regorge de bons tutoriels sur CSS qui vous permettront de comprendre le code que nous allons maintenant rajouter à notre fichier. Comme nous n'avons malheureusement pas le temps d'entrer dans les détails, copiez le code suivant dans votre fichier `mysite/static/css/blog.css` :

    .page-header {
        background-color: #ff9400;
        margin-top: 0;
        padding: 20px 20px 20px 40px;
    }
    
    .page-header h1, .page-header h1 a, .page-header h1 a:visited, .page-header h1 a:active {
        color: #ffffff;
        font-size: 36pt;
        text-decoration: none;
    }
    
    .content {
        margin-left: 40px;
    }
    
    h1, h2, h3, h4 {
        font-family: 'Lobster', cursive;
    }
    
    .date {
        float: right;
        color: #828282;
    }
    
    .save {
        float: right;
    }
    
    .post-form textarea, .post-form input {
        width: 100%;
    }
    
    .top-menu, .top-menu:hover, .top-menu:visited {
        color: #ffffff;
        float: right;
        font-size: 26pt;
        margin-right: 20px;
    }
    
    .post {
        margin-bottom: 70px;
    }
    
    .post h1 a, .post h1 a:visited {
        color: #000000;
    }
    

Nous allons maintenant nous intéresser au code concernant les posts. Remplacer le code suivant :

    {% for post in posts %}
        <div class="post">
            <p>published: {{ post.published_date }}</p>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaks }}</p>
        </div>
    {% endfor %}
    

Ce code se trouve dans le fichier `blog/templates/blog/post_list.html` et doit être remplacé par celui-ci :

    <div class="content container">
        <div class="row">
            <div class="col-md-8">
                {% for post in posts %}
                    <div class="post">
                        <div class="date">
                            {{ post.published_date }}
                        </div>
                        <h1><a href="">{{ post.title }}</a></h1>
                        <p>{{ post.text|linebreaks }}</p>
                    </div>
                {% endfor %}
            </div>
        </div>
    </div>
    

Sauvegardez les fichiers modifiés et rafraîchissez votre site web.

![Figure 14.4][8]

 [8]: images/final.png

Woohoo ! C'est pas mal, non ? Le code que nous avons collé n'est pas bien compliqué à comprendre et vous devriez pouvoir en comprendre l'essentiel rien qu'en le lisant (ce n'est pas grave si ce n'est pas le cas ! ).

N'ayez pas peur et jouez un peu avec la CSS : essayez par exemple d'en changer des morceaux. Vous avez cassé quelque chose ? Pas de problème : vous pouvez toujours annuler vos modifications !

Voilà pour la partie CSS. Nous vous encourageons vivement à suivre le tutoriel gratuit de [Code Academy][2] : considérez ce tutoriel comme un petit travail à faire une fois rentré⋅e chez vous. Vous connaîtrez ainsi tout ce qu'il y a savoir pour rendre son site bien plus joli !

Prêt⋅e pour le chapitre suivant ? :)