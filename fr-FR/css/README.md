# CSS – make it pretty!

Soyons honnêtes : notre blog est plutôt moche, non ? Un peu de CSS devrait nous permettre d'arranger ça !

## Qu'est-ce que le CSS ?

Cascading Style Sheets (CSS) is a language used for describing the look and formatting of a website written in a markup language (like HTML). Treat it as make-up for our web page. ;)

But we don't want to start from scratch again, right? Once more, we'll use something that programmers released on the Internet for free. Reinventing the wheel is no fun, you know.

## Utilisons Bootstrap !

Bootstrap is one of the most popular HTML and CSS frameworks for developing beautiful websites: https://getbootstrap.com/

Il a été créé par d'anciens programmeurs·ses de chez Twitter. Il est maintenant développé par des bénévoles aux quatre coins du monde !

## Installer Bootstrap

To install Bootstrap, you need to add this to your `<head>` in your `.html` file:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

This doesn't add any files to your project. It just points to files that exist on the Internet. Just go ahead, open your website and refresh the page. Here it is!

![Figure 14.1](images/bootstrap1.png)

C'est déjà un peu mieux !

## Les fichiers statiques dans Django

Enfin, allons jeter un coup d'œil à ces **fichiers statiques** dont nous n'arrêtons pas de vous parler. Les fichiers statiques correspondent à tous vos CSS et vos images. Leur contenu ne dépend pas du contexte de la requête et sera le même pour tous les utilisateurs.

### Où ranger les fichiers statiques dans Django ?

Django sait déjà où trouver les fichiers statiques pour la partie « admin ». Maintenant, il ne nous reste plus qu'à ajouter les fichiers statiques liés à notre app `blog`.

Pour cela, nous allons créer un fichier appelé `static` à l'intérieur de notre blog app :

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django will automatically find any folders called "static" inside any of your apps' folders. Then it will be able to use their contents as static files.

## Votre première CSS !

Let's create a CSS file now, to add your own style to your web page. Créez un nouveau dossier appelé `css` à l'intérieur de votre dossier `static`. Ensuite, créez un nouveau fichier appelé `blog.css` à l'intérieur du dossier `css`. Vous êtes prête ?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Et c'est parti pour un peu de CSS ! Ouvrez le fichier `static/css/blog.css` dans votre éditeur de texte.

We won't be going too deep into customizing and learning about CSS here. There is a recommendation for a free CSS course at the end of this page if you would like to learn more.

Que pourrions-nous faire rapidement ? Pourquoi ne pas changer la couleur de notre en-tête ? Pour indiquer la couleur que nous souhaitons utiliser, nous devons utiliser un code particulier. These codes start with `#` followed by 6 letters (A–F) and numbers (0–9). For example, the code for blue is `#0000FF`. You can find the color codes for many colors here: http://www.colorpicker.com/. Vous pouvez aussi utiliser des [couleurs prédéfinies](http://www.w3schools.com/colors/colors_names.asp), comme le `rouge` et le `vert`.

Ajoutez le code suivant dans votre fichier `blog/static/css/blog.css` :

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
}
```

`h1 a` est un sélecteur CSS. This means we're applying our styles to any `a` element inside of an `h1` element. So when we have something like `<h1><a href="">link</a></h1>`, the `h1 a` style will apply. Dans notre exemple précédent, nous indiquions notre souhait de changer la couleur du texte en `#FCA205`, c'est à dire en orange. Bien évidemment, vous êtes libre de choisir n'importe quelle couleur !

Un fichier CSS permet de déterminer le style des éléments présents dans un fichier HTML. The first way we identify elements is with the element name. You might remember these as tags from the HTML section. Things like `a`, `h1`, and `body` are all examples of element names. We also identify elements by the attribute `class` or the attribute `id`. Class et id sont des noms que vous choisissez vous-même. Les classes définissent des groupes d'éléments tandis que les ids désignent des éléments précis. For example, you could identify the following tag by using the tag name `a`, the class `external_link`, or the id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

You can read more about [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

We also need to tell our HTML template that we added some CSS. Open the `blog/templates/blog/post_list.html` file and add this line at the very beginning of it:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load staticfiles %}
```

We're just loading static files here. :) Between the `<head>` and `</head>` tags, after the links to the Bootstrap CSS files, add this line:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

The browser reads the files in the order they're given, so we need to make sure this is in the right place. Otherwise the code in our file may be overriden by code in Bootstrap files. Nous venons simplement de dire à notre template où nous avons rangé notre fichier CSS.

Maintenant, votre fichier doit ressembler à ceci :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load staticfiles %}
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

Add that to your CSS, save the file and see how it works!

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

As mentioned above, CSS has a concept of classes. These allow you to name a part of the HTML code and apply styles only to this part, without affecting other parts. This can be super helpful! Maybe you have two divs that are doing something different (like your header and your post). A class can help you make them look different.

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

Nous allons maintenant ajouter des blocs déclaratifs à différents sélecteurs. Les sélecteurs qui commencent par `.` sont reliés aux classes. There are many great tutorials and explanations about CSS on the Web that can help you understand the following code. Pour l'instant, copier-coller le code qui suit dans votre fichier `blog/static/css/blog.css` :

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

Woohoo! Looks awesome, right? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. Where would you make the change if you wanted the date to be turquoise?

Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!

We really recommend taking this free online [Codeacademy HTML & CSS course](https://www.codecademy.com/tracks/web). It can help you learn all about making your websites prettier with CSS.

Prête pour le chapitre suivant ? :)