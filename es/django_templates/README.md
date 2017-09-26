# Plantillas de Django

¡Es hora de mostrar algunos datos! Para ello Django incorpora unas etiquetas de plantillas, **template tags**, muy útiles.

## ¿Qué son las etiquetas de plantilla?

You see, in HTML, you can't really write Python code, because browsers don't understand it. They know only HTML. We know that HTML is rather static, while Python is much more dynamic.

**Django template tags** allow us to transfer Python-like things into HTML, so you can build dynamic websites faster and easier. Cool!

## Mostrar la plantilla post list

En el capítulo anterior le dimos a nuestra plantilla una lista de entradas en la variable `posts`. Ahora la vamos a mostrar en HTML.

Para imprimir una variable en una plantilla de Django, utilizamos llaves dobles con el nombre de la variable dentro, así:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Prueba esto en la plantilla `blog/templates/blog/post_list.html`. Sustituye todo desde el segundo `<div>` al tercer `</div>` por `{{ posts }}`. Guarda el archivo y refresca la página para ver los resultados:

![Figura 13.1](images/step1.png)

Como puedes ver, lo que hemos conseguido es esto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Significa que Django lo entiende como una lista de objetos. ¿Recuerdas de **Introducción a Python** cómo podemos mostrar listas? Sí, ¡con bucles for! En una plantilla de Django se hacen así:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Prueba esto en tu plantilla.

![Figura 13.2](images/step2.png)

¡Funciona! But we want the posts to be displayed like the static posts we created earlier in the **Introduction to HTML** chapter. Usted puede mezclar HTML y etiquetas de plantilla. Nuestro `body` se verá así:

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

{% raw %}Todo lo que pongas entre `{% for %}` y `{% endfor %}` se repetirá para cada objeto de la lista. Refresca la página:{% endraw %}

![Figura 13.3](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }})`? Estamos accediendo a los datos en cada uno de los campos definidos en nuestro modelo `Post`. Also, the `|linebreaksbr` is piping the posts' text through a filter to convert line-breaks into paragraphs.

## Una cosa más

It'd be good to see if your website will still be working on the public Internet, right? Let's try deploying to PythonAnywhere again. Here's a recap of the steps…

* Primero, sube tu código a GitHub

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Luego, vuelve a entrar en [PythonAnywhere](https://www.pythonanywhere.com/consoles/) y ve a tu **consola Bash** (o inicia una nueva), y ejecuta:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd my-first-blog
    $ git pull
    [...]
    

* Finalmente, ve a la [pestaña Web](https://www.pythonanywhere.com/web_app_setup/) y presiona **Reload** en tu aplicación web. ¡Tu actualización debería verse! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://yourname.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figura 13.4](images/donut.png)