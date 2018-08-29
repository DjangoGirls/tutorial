# Templates Django

Il est temps d'afficher des données ! Pour nous aider, Django fournit des balises de gabarit (**template tags**) qui sont intégrées au framework. Pour le reste du tutoriel, nous utiliserons plutôt le mot template, bien plus répandu que sa traduction "gabarit".

## Qu'est-ce que c'est que des balises de template ?

You see, in HTML, you can't really write Python code, because browsers don't understand it. They know only HTML. We know that HTML is rather static, while Python is much more dynamic.

**Django template tags** allow us to transfer Python-like things into HTML, so you can build dynamic websites faster. Cool!

## Template d'affichage de la liste des posts

Dans le chapitre précédent, nous avons donné à notre template une liste de posts à l'aide de la variable `posts`. Nous allons maintenant les afficher en HTML.

Afin d'afficher une variable dans un template Django, nous utiliserons des doubles accolades avec le nom de la variable à l'intérieur. Ça ressemble à ceci :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Essayez de faire la même chose avec votre template `blog/templates/blog/post_list.html`. Remplacez tout ce qui se trouve entre la seconde balise `<div>` jusqu'au troisième `</div>` avec la ligne `{{ posts }}`. Sauvegardez votre fichier et rafraichissez votre page pour voir le résultat :

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

Ça marche ! But we want the posts to be displayed like the static posts we created earlier in the **Introduction to HTML** chapter. Vous pouvez mixer HTML et balises de template. Notre `body` ressemble maintenant à ceci :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
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
```

{% raw %}Tout ce qui se situe entre `{% for %}` et `{% endfor %}` va être répété pour chaque objet présent dans la liste. Rafraichissez votre page :{% endraw %}

![Figure 13.3](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }}`)? Nous accédons aux données associées à chaque champ défini dans notre modèle `Post`. Also, the `|linebreaksbr` is piping the posts' text through a filter to convert line-breaks into paragraphs.

## Une dernière chose

It'd be good to see if your website will still be working on the public Internet, right? Let's try deploying to PythonAnywhere again. Here's a recap of the steps…

* First, push your code to GitHub

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Ensuite, reconnectez-vous à [PythonAnywhere](https://www.pythonanywhere.com/consoles/) et allez sur la "**Bash console**" (ou démarrer-en une nouvelle), et lancez les commandes suivantes :

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd $USER.pythonanywhere.com
    $ git pull
    [...]
    

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app. (To reach other PythonAnywhere pages from the console, use the menu button in the upper right corner.) Your update should be live on https://yourname.pythonanywhere.com -- check it out in the browser! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Félicitations! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://yourname.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figure 13.4](images/donut.png)