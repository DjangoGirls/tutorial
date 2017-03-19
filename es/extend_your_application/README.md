# Extender tu aplicación

Ya hemos completado todos los pasos necesarios para la creación de nuestro sitio web: sabemos cómo escribir un model, url, view y template. También sabemos cómo hacer que nuestro sitio web se vea lindo.

¡Hora de practicar!

Lo primero que necesitamos en nuestro blog es, obviamente, una página para mostrar un post, ¿cierto?

Ya tenemos un modelo `Post`, así que no necesitamos agregar nada a `models.py`.

## Crear un enlace al detalle de una entrada

Vamos a empezar añadiendo un enlace dentro del archivo `blog/templates/blog/post_list.html`. Hasta el momento debería verse así:
{% filename %}blog/templates/blog/post_list.html{% endfilename %}
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
{% endblock content %}
```

{% raw %}Queremos tener un enlace que vaya desde el título de la entrada en la lista de entradas hasta la página de detalle de la entrada. Vamos a cambiar `<h1><a href="">{{ post.title }}</a></h1>` para que enlace a la página de detalle de la entrada:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Es hora de explicar el misterioso `{% url 'post_detail' pk=post.pk %}`. Como probablemente sospeches, la notación `{% %}` significa que estamos utilizando Django template tags. ¡Esta vez vamos a usar una que creará una URL!{% endraw %}

`blog.views.post_detail` es una ruta hacia la *vista* `post_detail` que queremos crear. Fíjate bien: `blog` es el nombre de nuestra aplicación (el directorio `blog`), `views` es el nombre del archivo `views.py` y la última parte, `post_detail`, es el nombre de la *vista*.

¿Y, qué hay de `pk=post.pk`? `pk` es la abreviatura de `primary key`, clave primaria, el cuál es un nombre único para cada entrada en la base de datos. Como no hemos especificado ninguno en nuestro modelo `Post`, Django crea uno por nosotros (por defecto, un número que incrementa con cada entrada, eso es 1, 2, 3) y agrega este como un campo llamado `pk` para cada uno de nuestros posts. Podemos acceder a la clave primera escribiendo `post.pk`, de la misma forma que accedemos a otros campos (`title`, `author`, etc.) en nuestro objeto `Post`.

Ahora cuando vayamos a: http://127.0.0.1:8000/ tendremos un error (como era de esperar, ya que no tenemos una URL o una *vista* para `post_detail`). Se verá así:

![NoReverseMatch error](images/no_reverse_match2.png)

## Crea una URL al detalle de una entrada

Vamos a crear una URL en `urls.py` para nuestra *vista* `post_detail`!

Queremos que el detalle de la primera entrada se visualice en esta **URL**: http://127.0.0.1:8000/post/1/

Vamos a crear una URL en el archivo `blog/urls.py` que dirija a Django hacia una *vista* llamada `post_detail`, que mostrará una entrada de blog completa. Añade la línea `url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),` al archivo `blog/urls.py`. El archivo debería parecerse a esto:

{% filename %}blog/urls.py{% endfilename %}
```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
]
```

La parte de `^post/(?P<pk>[0-9]+)/$` da un poco de miedo, pero no te preocupes, te la vamos a explicar:
- comienza con `^` otra vez, "el principio".
- `post/` quiere decir que después del comienzo, la URL debe contener la palabra __post__  y __ /__ . Por ahora todo bien.
- `(?P<pk>[0-9]+)` - esta parte es más complicada. Significa que Django llevará todo lo que pongas aquí y lo transferirá a una vista como una variable llamada `pk`. `[0-9]` también nos dice que sólo puede ser un número, no una letra (todo lo que esté entre 0 y 9). `+` significa que tiene que haber uno o más dígitos. Así que algo como `http://127.0.0.1:8000/post//` no es válido, pero `http://127.0.0.1:8000/post/1234567890/` es perfectamente aceptable!
- `/` - necesitamos __ /__  de nuevo
- `$` - ¡"el final"!

Esto quiere decir que si pones `http://127.0.0.1:8000/post/5/` en tu navegador, Django entenderá que estás buscando una *vista* llamada `post_detail` y transferirá la información de que `pk` es igual a `5` a esa *vista*.

Bien, ¡hemos añadido un nuevo patrón de URL a `blog/urls.py`! Vamos a refrescar la página: http://127.0.0.1:8000/ ¡Zas! ¡Otro error! ¡Era de esperar!

![AttributeError](images/attribute_error2.png)

¿Recuerdas cuál es el próximo paso? Por supuesto: ¡agregar una vista!

## Agregar una vista de detalle de la entrada

Esta vez nuestra *vista* tomará un parámetro adicional `pk`. Nuestra *vista* necesita recibirlo, ¿verdad? Así que definiremos nuestra función como `def post_detail (request, pk):`. Ten en cuenta que tenemos que usar exactamente el mismo nombre que especificamos en las urls (`pk`). ¡Omitir esta variable es incorrecto y resultará en un error!

Ahora, queremos obtener una sola entrada del blog. Para ello podemos usar querysets como este:

{% filename %}blog/views.py{% endfilename %}
```python
Post.objects.get(pk=pk)
```

Pero este código tiene un problema. Si no hay ningún `Post` con esa `clave primaria` (`pk`), ¡tendremos un error muy feo!

![DoesNotExist error](images/does_not_exist2.png)

¡No queremos eso! Pero, por supuesto, Django viene con algo que se encargará de ese problema por nosotros: `get_object_or_404`. En caso de que no haya ningún `Post` con el dado `pk` se mostrará una más agradable página (`Page Not Found 404`).

![Page not found](images/404_2.png)

La buena noticia es que puedes crear tu propia página `Page Not Found` y diseñarla como desees. Pero por ahora no es tan importante, así que lo omitiremos.

¡Es hora de agregar una *view* a nuestro archivo `views.py`!

Deberíamos abrir `blog/views.py` y agregar el siguiente código debajo de las otras líneas `from`:

{% filename %}blog/views.py{% endfilename %}
```python
from django.shortcuts import render, get_object_or_404
```

Y en el final del archivo añadimos nuestra *view*:

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

¡Oh no! ¡Otro error! Pero ya sabemos cómo lidiar con eso, ¿no? ¡Tenemos que agregar una plantilla!

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

{% raw %}`{% if ... %} ... {% endif %}` es un template tag que podemos usar cuando querramos ver algo (¿recuerdas <code>if ... else...</code> del capítulo de __ Introducción a Python__ ?). En este escenario queremos comprobar si el campo `published_date` de un post no está vacío.{% endraw %}

Bien, podemos actualizar nuestra página y ver si `Page Not Found` se ha ido.

![Post detail page](images/post_detail2.png)

¡Yay! ¡Funciona!

## Una cosa más: ¡Tiempo de implementación!

Sería bueno verificar que tu sitio web aún funcionará en PythonAnywhere, ¿cierto? Intentemos desplegar de nuevo.

{% filename %}Terminal{% endfilename %}
```
$ git status
$ git add --all .
$ git status
$ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
$ git push
```

Luego, en una [consola Bash de PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}Terminal{% endfilename %}
```
$ cd my-first-blog
$ git pull
[...]
```

Finalmente, ve a la pestaña [Web](https://www.pythonanywhere.com/web_app_setup/) y haz click en **Reload** .

¡Y eso debería ser todo! Felicidades :)
