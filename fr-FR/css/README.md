# CSS - Rendez votre site joli !

Soyons honnêtes : notre blog est plutôt moche, non ? Un peu de CSS devrait nous permettre d'arranger ça !

## Qu'est-ce que le CSS ?

Les feuilles de style (CSS : Cascading Style Sheets) sont un langage utilisé pour décrire l'apparence et la disposition d'un site écrit en langage de balisage (comme HTML). Considérez-le comme le maquillage de notre page web. ;)

Mais on ne souhaite pas repartir de zéro. Une fois de plus, nous utiliserons quelque chose que les programmeurs ont publié gratuitement sur Internet. Réinventer la roue n'est pas amusant, n'est-ce pas ?

## Utilisons Bootstrap !

Bootstrap est l'un des frameworks HTML/CSS les plus populaires pour développer de beaux sites web : https://getbootstrap.com/

Il a été créé par d'anciens développeurs de Twitter. Il est maintenant développé par des bénévoles aux quatre coins du monde !

## Installer Bootstrap

Pour installer Bootstrap, il vous faut ajouter ceci à votre `<head>` dans votre fichier `.html` :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Ceci n'ajoute aucun fichier à votre projet. Il ne fait que pointer vers des fichiers qui existent sur Internet. Allez-y, ouvrez votre site Web et rafraîchissez la page. Le voilà !

![Figure 14.1](images/bootstrap1.png)

C'est déjà un peu mieux !

## Les fichiers statiques dans Django

Enfin, allons jeter un coup d'œil à ces **fichiers statiques** dont nous n'arrêtons pas de vous parler. Les fichiers statiques correspondent à tous vos CSS et vos images. Leur contenu ne dépend pas du contexte de la requête et sera le même pour tous les utilisateurs.

### Où ranger les fichiers statiques dans Django ?

Django sait déjà où trouver les fichiers statiques pour la partie « admin ». Maintenant, il ne nous reste plus qu'à ajouter les fichiers statiques liés à notre app, `blog`.

Pour cela, nous allons créer un dossier appelé `static` à l'intérieur de notre appli blog :

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django va rechercher automatiquement tous les dossiers dits "statiques" à l'intérieur de vos dossiers d'appli. Ensuite, il sera en mesure d'utiliser leur contenu sous forme de fichiers statiques.

## Votre premier fichier CSS !

Let's create a CSS file now, to add your own style to your web page. Créez un nouveau dossier appelé `css` à l'intérieur de votre dossier `static`. Ensuite, créez un nouveau fichier appelé `blog.css` à l'intérieur du dossier `css`. Vous êtes prête ?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Et c'est parti pour un peu de CSS ! Ouvrez le fichier `static/css/blog.css` dans votre éditeur de texte.

Nous ne serons pas trop ajuster et apprendre CSS ici. Il y a une recommandation pour un cours CSS gratuit à la fin de cette page si vous voulez en savoir plus.

Que pourrions-nous faire rapidement ? Pourquoi ne pas changer la couleur de notre en-tête ? Pour indiquer la couleur que nous souhaitons utiliser, nous devons utiliser un code particulier. These codes start with `#` followed by 6 letters (A–F) and numbers (0–9). For example, the code for blue is `#0000FF`. You can find the color codes for many colors here: http://www.colorpicker.com/. Vous pouvez aussi utiliser des [couleurs prédéfinies](http://www.w3schools.com/colors/colors_names.asp), comme le `rouge` et le `vert`.

Ajoutez le code suivant dans votre fichier `blog/static/css/blog.css` :

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
}
```

`h1 a` est un sélecteur CSS. This means we're applying our styles to any `a` element inside of an `h1` element. So when we have something like `<h1><a href="">link</a></h1>`, the `h1 a` style will apply. Dans notre exemple précédent, nous indiquions notre souhait de changer la couleur du texte en `#FCA205`, c'est à dire en orange. Bien évidemment, vous êtes libre de choisir n'importe quelle couleur !

Un fichier CSS permet de déterminer le style des éléments présents dans un fichier HTML. La première façon dont nous permettent d'identifier des éléments est avec le nom de l'élément. Vous pouvez vous souvenir de cela comme une balise de la section HTML. Things like `a`, `h1`, and `body` are all examples of element names. We also identify elements by the attribute `class` or the attribute `id`. Class et id sont des noms que vous choisissez vous-même. Les classes définissent des groupes d'éléments tandis que les ids désignent des éléments précis. For example, you could identify the following tag by using the tag name `a`, the class `external_link`, or the id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

You can read more about [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

We also need to tell our HTML template that we added some CSS. Open the `blog/templates/blog/post_list.html` file and add this line at the very beginning of it:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

We're just loading static files here. :) Between the `<head>` and `</head>` tags, after the links to the Bootstrap CSS files, add this line:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Le navigateur lit les fichiers dans l'ordre où ils sont donnés, donc nous devons nous assurer que c'est dans le bon endroit. Sinon le code dans notre fichier peut être remplacé par du code dans des fichiers d'Amorçage. Nous venons simplement de dire à notre template où nous avons rangé notre fichier CSS.

Maintenant, votre fichier doit ressembler à ceci :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
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
                <p>{{ post.text|linebreaksbr }}</p>
            </div>
        {% endfor %}
    </body>
</html>
```

Ok, on sauvegarde et on rafraîchit la page !

![Figure 14.2](images/color2.png)

Bravo ! Peut-être que nous pourrions un peu aérer notre page web en augmentant la marge du côté gauche ? Essayons pour voir !

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Ajoutez-le à votre CSS, enregistrez le fichier et voir comment cela fonctionne!

![Figure 14.3](images/margin2.png)

Et si nous changions aussi la police de caractères de notre entête ? Collez ceci dans la partie `<head>` de votre fichier `blog/templates/blog/post_list.html` :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

As before, check the order and place before the link to `blog/static/css/blog.css`. This line will import a font called *Lobster* from Google Fonts (https://www.google.com/fonts).

Find the `h1 a` declaration block (the code between braces `{` and `}`) in the CSS file `blog/static/css/blog.css`. Now add the line `font-family: 'Lobster';` between the braces, and refresh the page:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

![Figure 14.3](images/font.png)

Super !

Comme mentionné ci-dessus, CSS a un concept de classe. Ceux-ci vous permettent de nommer une partie de code HTML et appliquer des styles que pour cette partie, sans affecter les autres parties. Cela peut être très utile! Peut-être que vous avez deux divs qui sont en train de faire quelque chose de différent (comme votre tête et de votre post). Une classe peut vous aider à leur donner un aspect différent.

Allons donner des noms à certaines parties de notre code html. Ajouter la classe `page-header` à votre `div` qui contient votre entête. Votre fichier doit ressembler maintenant à ceci :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

Maintenant, ajoutez la classe `post` à votre `div` contenant votre blog post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Nous allons maintenant ajouter des blocs déclaratifs à différents sélecteurs. Les sélecteurs qui commencent par `.` sont reliés aux classes. Il y a de nombreux tutoriels et des explications à propos de CSS sur le Web qui peuvent vous aider à comprendre le code suivant. Pour l'instant, copier-coller le code qui suit dans votre fichier `blog/static/css/blog.css` :

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
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
```

Nous allons maintenant nous intéresser au code concernant les posts. Il va falloir remplacer le code le code suivant :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

Ce code se trouve dans le fichier `blog/templates/blog/post_list.html`. Il doit être remplacé par le code suivant :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        <p>published: {{ post.published_date }}</p>
                    </div>
                    <h1><a href="">{{ post.title }}</a></h1>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

Sauvegardez les fichiers modifiés et rafraîchissez votre site web.

![Figure 14.4](images/final.png)

Woohoo! Looks awesome, right? Regarde le code que nous venons juste collé à trouver les endroits où nous avons ajouté des classes dans le code HTML et de les utiliser dans le CSS. Où souhaitez-vous faire le changement si vous vouliez la date turquoise?

N'ayez pas peur de bricoler avec ce CSS un peu et essayer de changer certaines choses. Jouer avec le CSS peut vous aider à comprendre quelles sont les différentes choses sont en train de faire. Si vous cassez quelque chose, ne vous inquiétez pas – vous pouvez toujours annuler!

We really recommend taking this free online [Codeacademy HTML & CSS course](https://www.codecademy.com/tracks/web). Il peut vous aider à apprendre tout au sujet de faire votre site web plus joli avec les CSS.

Prête pour le chapitre suivant ? :)