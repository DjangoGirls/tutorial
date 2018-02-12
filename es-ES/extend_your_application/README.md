# Extiende tu aplicación

Ya hemos completado todos los pasos necesarios para la creación de nuestro sitio web: sabemos cómo escribir un model, url, view y template. También sabemos cómo hacer que nuestro sitio web se vea lindo.

¡Hora de practicar!

Lo primero que necesitamos en nuestro blog es, obviamente, una página para mostrar un post, ¿cierto?

Ya tenemos un modelo `Post`, así que no necesitamos añadir nada a `models.py`.

## Crea un enlace al detalle de una entrada

Empezaremos añadiendo un link en el archivo `blog/templates/blog/post_list.html`. Hasta el momento debería verse así: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

{% raw %}Queremos tener un enlace que vaya desde el título de la entrada en la lista de entradas hasta la página de detalle de la entrada. Vamos a cambiar `<h1><a href="">{{ post.title }}</a></h1>` para que enlace a la página de detalle de la entrada:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Es hora de explicar el misterioso `{% url 'post_detail' pk=post.pk %}`. Como probablemente sospeches, la notación `{% %}` significa que estamos utilizando Django template tags. ¡Esta vez vamos a usar una que creará una URL!{% endraw %}

La parte de `post_detail` se refiere a que Django estara esperando una URL en `blog/urls.py` con name=post_detail

Y que pasa con `pk=post.pk`? `pk` se refiere a primary key (clave primaria), la cual es un nombre único por cada registro en una base de datos. Debido a que no especificamos una llave primaria en nuestro modelo `Post`, Django creará una por nosotros (por defecto, un número que incrementa una unidad por cada registro, por ejemplo, 1, 2, 3) y lo añadirá como un campo llamado `pk` a cada uno de nuestros posts. Accedemos a la clave primaria escribiendo `post.pk`, del mismo modo en que accedemos a otros campos (`título`, `autor`, etc.) en nuestro objeto `Post`!

Ahora cuando vayamos a: http://127.0.0.1:8000/ tendremos un error (como era de esperar, ya que no tenemos una URL o una *vista* para `post_detail`). Se verá así:

![NoReverseMatch error](images/no_reverse_match2.png)

## Crea una URL al detalle de una entrada

Vamos a crear una URL en `urls.py` para nuestra *vista* `post_detail`!

Queremos que el detalle de la primera entrada se visualice en esta **URL**: http://127.0.0.1:8000/post/1/

Vamos a crear una URL en el fichero `blog/urls.py` que dirija a Django hacia una *vista* llamada `post_detail`, que mostrará una entrada de blog completa. Añade la línea `url(r'^post/(?P<pk>+)/$', views.post_detail, name='post_detail'),` al fichero `blog/urls.py`. El fichero debería parecerse a esto:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
]
```

La parte `^post/(?P<pk>\d++)/$` es aterradora, pero no te preocupes, te la explicaremos:

- de nuevo comienza con `^`, "el comienzo".
- `post/` significa que después del comienzo, la URL debería contener la palabra **post** y un **/**. Hasta ahora, sin problemas.
- `(?P<pk>+)` - esta parte es más complicada. Significa que Django cogerá todo lo que pongas aquí y lo transferirá a una vista como una variable llamada `pk`. (Fijate que coincide con el nombre que le dimos a la variable de la llave primaria en `blog/templates/blog/post_list.html`!) `\d` también nos dice que solo puede ser un dígito, no una letra (todo entre 0 y 9). `+` significa que ahí tiene que haber uno o más dígitos. Así que algo como `http://127.0.0.1:8000/post//` no es válido, ¡pero `http://127.0.0.1:8000/post/1234567890` es perfectamente aceptable!
- `/` luego necesitamos un **/** de nuevo.
- `$` "el final"!

Esto quiere decir que si pones `http://127.0.0.1:8000/post/5/` en tu navegador, Django entenderá que estás buscando una *vista* llamada `post_detail` y transferirá la información de que `pk` es igual a `5` a esa *vista*.

OK, hemos añadido un nuevo patrón de URL a `blog/urls.py`! Actualizamos la pagina: http://127.0.0.1:8000/ y boom! El servidor vuelve a dejar de funcionar. Echa un vistazo a la consola – como era de esperar, hay otro error!

![AttributeError](images/attribute_error2.png)

¿Recuerdas cuál es el próximo paso? Por supuesto: ¡agregar una vista!

## Añade una vista de detalle de la entrada

Esta vez nuestra *vista* tomará un parámetro adicional `pk`. Nuestra *vista* necesita recibirlo, ¿verdad? Así que definiremos nuestra función como `def post_detail (request, pk):`. Ten en cuenta que tenemos que usar exactamente el mismo nombre que especificamos en las urls (`pk`). ¡Omitir esta variable es incorrecto y resultará en un error!

Ahora, queremos obtener solo un post. Para ello podemos usar querysets como este:

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Pero este código tiene un problema. Si no hay ningún `Post` con esa `clave primaria` (`pk`), ¡tendremos un error muy feo!

![DoesNotExist error](images/does_not_exist2.png)

¡No queremos eso! Pero, por supuesto, Django viene con algo que se encargará de ese problema por nosotros: `get_object_or_404`. En caso de que no haya ningún `Post` con el `pk` dado se mostrará una página mucho más agradable, `Page Not Found 404`.

![Page not found](images/404_2.png)

La buena noticia es que puedes crear tu propia página `Page Not Found` y diseñarla como desees. Pero por ahora no es tan importante, así que lo omitiremos.

¡Es hora de agregar una *view* a nuestro archivo `views.py`!

En `blog/urls.py` creamos un regla de URL denominada `post_detail` que hace referencia a una vista llamada `view.post_detail`. Esto significa que Django va a estar esperando una función llamada `post_detail` de vista en `blog/views.py`.

Deberiamos abrir `blog/views.py` y añadir lo siguiente por donde estan los otros `from`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

Y al final del archivo agregamos nuestra *vista*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Sí. Es hora de actualizar la página: http://127.0.0.1:8000/

![Post list view](images/post_list2.png)

¡Funcionó! Pero ¿qué pasa cuando haces click en un enlace en el título del post?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

¡Oh no! ¡Otro error! Pero ya sabemos cómo lidiar con eso, ¿no? ¡Tenemos que añadir una plantilla!

## Crear una plantilla para post detail

Crearemos un archivo en `blog/templates/blog` llamado `post_detail.html`.

Se verá así:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Una vez más estamos extendiendo `base.html`. En el bloque `content` queremos mostrar la fecha de publicación (si existe), título y texto de nuestros posts. Pero deberíamos discutir algunas cosas importantes, ¿cierto?

{% raw %}`{% if ... %} ... {% endif %}` es un template tag que podemos usar cuando querramos ver algo. (Recuerdas `if ... else ..` del capítulo **Intruducción a Python**?) Ahora queremos mirar si la `published_date` de un post no esta vacía.{% endraw %}

Bien, podemos actualizar nuestra página y ver si `TemplateDoesNotExist` se ha ido.

![Post detail page](images/post_detail2.png)

¡Yay! ¡Funciona!

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add -A .
    $ git status
    $ git commit -m "Agregadas vistas y plantilla para el detalle del post del blog así como también CSS para el sitio."
    $ git push
    

Luego, en una [consola Bash de PythonAnywhere](https://www.pythonanywhere.com/consoles/)

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

## Updating the static files on the server

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}command-line{% endfilename %}

    $ workon <your-pythonanywhere-username>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the [Web tab](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload**.

And that should be it! Congrats :)