# Formularios en Django

Lo último que haremos en nuestro sitio web será crear una forma agradable de agregar y editar posts en el blog. El `admin` de Django está bien, pero es bastante difícil de personalizar y hacerlo bonito. Con `forms` tendremos un poder absoluto sobre nuestra interfaz; ¡podemos hacer casi cualquier cosa que podamos imaginar!

Lo bueno de los formularios de Django es que podemos definirlos desde cero o crear un `ModelForm`, el cual guardará el resultado del formulario en el modelo.

Esto es exactamente lo que queremos hacer: crearemos un formulario para nuestro modelo `Post`.

Como cada parte importante de Django, los formularios tienen su propio archivo: `forms.py`.

Necesitamos crear un archivo con este nombre en el directorio `blog`.

```
blog
   └── forms.py
```

OK, vamos a abrirlo y a escribir el siguiente código:

{% filename %}blog/forms.py{% endfilename %}
```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

Primero necesitamos importar los formularios de Django (`from django import forms`) y, obviamente, nuestro modelo `Post` (`from .models import Post`).

`PostForm`, como probablemente sospechas, es el nombre de nuestro formulario. Necesitamos decirle a Django que este formulario es un `ModelForm` (así Django hará algo de magia por nosotros) - `forms.ModelForm` es responsable de ello.

A continuación, tenemos `class Meta`, donde le decimos a Django qué modelo debe utilizar para crear este formulario (`model = Post`).

Finalmente, podemos decir que campo(s) deberían estar en nuestro formulario. En este escenario sólo queremos `title` y `text` para ser mostrados - `author` será la persona que se ha autenticado (¡tú!) y `created_date` se definirá automáticamente cuando creemos un post (es decir, en el código), ¿cierto?

¡Y eso es todo! Todo lo que necesitamos hacer ahora es usar el formulario en una *view* y mostrarla en una plantilla.

Una vez más vamos a crear: un enlace a la página, una dirección URL, una vista y una plantilla.

## Enlace a una página con el formulario

Es hora de abrir `blog/templates/blog/base.html`. Vamos a agregar un enlace en un `div` llamado `page-header`:

{% filename %}blog/templates/blog/base.html{% endfilename %}
```html
    <a href="{% url 'blog.views.post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```    

Ten en cuenta que queremos llamar a nuestra nueva vista `post_new`. La clase `"glyphicon glyphicon-plus"` es provista por el tema de bootstrap que estamos usando, y mostrará un signo más por nosotros.

Después de agregar la línea, tu archivo html debería tener este aspecto:

{% filename %}blog/templates/blog/base.html{% endfilename %}
```html
    {% load staticfiles %}
    <html>
        <head>
            <title>Django Girls blog</title>
            <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
            <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
            <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
            <link rel="stylesheet" href="{% static 'css/blog.css' %}">
        </head>
        <body>
            <div class="page-header">
                <a href="{% url 'blog.views.post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
                <h1><a href="/">Django Girls Blog</a></h1>
            </div>
            <div class="content container">
                <div class="row">
                    <div class="col-md-8">
                        {% block content %}
                        {% endblock %}
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
```

Luego de guardar y actualizar la página http://127.0.0.1:8000 obviamente verás un error `NoReverseMatch` familiar, ¿verdad?

## URL

Abrimos `blog/urls.py` y añadimos una línea:

{% filename %}blog/urls.py{% endfilename %}
```python
url(r'^post/new/$', views.post_new, name='post_new'),
```

Y el código final tendrá este aspecto:

{% filename %}blog/urls.py{% endfilename %}
```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
    url(r'^post/new/$', views.post_new, name='post_new'),
]
```

Después de actualizar el sitio, veremos un `AttributeError`, puesto que no tenemos la vista `post_new` implementada. Vamos a agregarla ahora.

## Vista post_new

Es el momento de abrir el archivo `blog/views.py` y agregar las siguientes líneas al resto de las filas `from`:

{% filename %}blog/views.py{% endfilename %}
```python
from .forms import PostForm
```

And then our *view*:

{% filename %}blog/views.py{% endfilename %}
```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Para crear un nuevo formulario `Post`, tenemos que llamar a `PostForm()` y pasarlo a la plantilla. Volveremos a esta *vista* pero, por ahora, vamos a crear rápidamente una plantilla para el formulario.

## Plantilla

Tenemos que crear un archivo `post_edit.html` en el directorio `blog/templates/blog`. Para hacer que un formulario funcione necesitamos varias cosas:

* tenemos que mostrar el formulario. Podemos hacerlo por ejemplo con un simple `{% raw %}{{ form.as_p }}{% endraw %}`.
* la línea anterior tiene que estar dentro de una etiqueta de formulario HTML: `<form method="POST">...</form>`
* necesitamos un botón `Guardar`. Lo hacemos con un botón HTML: `<button type='submit'>Save</button>`
* y por último justo después de abrir la etiqueta `<form ...>` tenemos que agregar `{% raw %}{% f_token %}{% endraw %}`. ¡Esto es muy importante ya que hace que tus formularios sean seguros! Django se quejará si te olvidas de esta parte cuando intentes guardar el formulario.

![CSFR Forbidden page](images/csrf2.png)

Bueno, vamos a ver cómo quedará el HTML en `post_edit.html`:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}
```html
{% extends 'blog/base.html' %}

{% block content %}
    <h1>New post</h1>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

¡Es hora de actualizar! ¡Si! ¡Tu formulario se muestra!

![Nuevo formulario](images/new_form2.png)

Pero, ¡un momento! Si escribes algo en los campos `títle` y `text` y tratas de guardar los cambios - ¿qué pasará?

¡Nada! Una vez más estamos en la misma página y el texto se ha ido... no se añade ningún post nuevo. Entonces, ¿qué ha ido mal?

La respuesta es: nada. Tenemos que trabajar un poco más en nuestra *vista*.

## Guardar el formulario

Abre `blog/views.py` una vez más. Actualmente, lo que tenemos en la vista `post_new` es:

{% filename %}blog/views.py{% endfilename %}
```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Cuando enviamos el formulario somos redirigidos a la misma vista, pero esta vez tenemos algunos datos adicionales en `request`, más específicamente en `request.POST` (el nombre no tiene nada que ver con un post del blog, se refiere a que estamos "publicando" -en inglés, posting- datos). ¿Recuerdas que en el archivo HTML la definición de `<form>` tenía la variable `method="POST"`? Todos los campos del formulario estan ahora en `request.POST`. No deberías renombrar la variable `POST` (el único nombre que también es válido para la variable `method` es `GET`, pero no tenemos tiempo para explicar cuál es la diferencia).

En nuestra *view* tenemos dos posibles situaciones a contemplar. Primero: cuando accedemos a la página por primera vez y queremos un formulario en blanco. Segundo: cuando volvemos a la *view* con los datos del formulario que acabamos de escribir. Así que tenemos que agregar una condición (utilizaremos `if` para eso).

{% filename %}blog/views.py{% endfilename %}
```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Es hora de llenar los puntos `[...]`. Si el `method` es `POST` queremos construir el `PostForm` con los datos del formulario, ¿no? Lo haremos con:

{% filename %}blog/views.py{% endfilename %}
```python
form = PostForm(request.POST)
```

Fácil! Lo siguiente es verificar si el formulario es correcto (todos los campos necesarios están definidos y no hay valores incorrectos). Lo hacemos con `form.is_valid()`.

Comprobamos que el formulario es válido y, si es así, ¡lo podemos salvar!

{% filename %}blog/views.py{% endfilename %}
```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

Básicamente, tenemos que hacer dos cosas aquí: guardamos el formulario con `form.save` y añadimos un autor (ya que no había ningún campo de `author` en el `PostForm` y este campo es obligatorio). `commit=False` significa que no queremos guardar el modelo `Post` todavía - queremos agregar el autor primero. La mayoría de las veces utilizarás `form.save()`, sin `commit=False`, pero en este caso, tenemos que hacerlo. `post.save()` conservará los cambios (añadiendo el autor) y se creará una nuevo post en el blog.

Por último, sería genial si podemos inmediatamente ir a la página `post_detail` del nuevo post de blog, ¿no? Para hacerlo necesitamos importar algo más:

{% filename %}blog/views.py{% endfilename %}
```python
from django.shortcuts import redirect
```

Agrégalo al principio del archivo. Y ahora podemos decir: vé a la página `post_detail` del post recién creado.

{% filename %}blog/views.py{% endfilename %}
```python
    return redirect('blog.views.post_detail', pk=post.pk)
```    

`blog.views.post_detail` es el nombre de la vista a la que queremos ir. ¿Recuerdas que esta *view* requiere una variable `pk`? Para pasarlo a las vistas utilizamos `pk=post.pk`, donde `post` es el post recién creado.

Bien, hablamos mucho, pero probablemente queremos ver como se ve ahora la *vista*, ¿verdad?

{% filename %}blog/views.py{% endfilename %}
```python
    def post_new(request):
        if request.method == "POST":
            form = PostForm(request.POST)
            if form.is_valid():
                post = form.save(commit=False)
                post.author = request.user
                post.published_date = timezone.now()
                post.save()
                return redirect('blog.views.post_detail', pk=post.pk)
        else:
            form = PostForm()
        return render(request, 'blog/post_edit.html', {'form': form})
```    

Vamos a ver si funciona. Ve a la página http://127.0.0.1:8000/post/new/, añade un `title` y un `text`, guardalo... ¡y voilà! Se añade el nuevo post al blog y se nos redirige a la página de `post_detail`.

Puede que hayas notado que estamos indicando la fecha de publicación antes de guardar la entrada. Más adelante introduciremos un *botón de publicar* en el libro **Django Girls Tutorial: Extensions**.

¡Eso es genial!

> Como recientemente hemos utilizado la interfaz de administrador de Django, el sistema piensa que estamos conectadas. Hay algunas situaciones que podrían llevarnos a desconectarnos (cerrando el navegador, reiniciando la base de datos, etc.). Si estás recibiendo errores al crear un post que indican la falta de inicio de sesión de usuario, dirígete a la página de administración `http://127.0.0.1:8000/admin` e inicia sesión nuevamente. Esto resolverá el problema temporalmente. Hay un arreglo permanente esperándote en el capítulo **Tarea: ¡Añadir seguridad a tu sitio web!** después del tutorial principal.

## Validación de formularios

Ahora, vamos a enseñarte qué tan bueno es Django forms. Un post del blog debe tener los campos `title` y `text`. En nuestro modelo `Post` no dijimos (a diferencia de `published_date`) que estos campos son requeridos, así que Django, por defecto, espera que estén definidos.

Trata de guardar el formulario sin `title` y `text`. ¡Adivina qué pasará!

![Validación de formularios](images/form_validation2.png)

Django se encarga de validar que todos los campos en el formulario estén correctos. ¿No es genial?

![Error de inicio de sesión](images/post_create_error.png)

## Editar el formulario

Ahora sabemos cómo agregar un nuevo formulario. Pero, ¿qué pasa si queremos editar uno existente? Es muy similar a lo que acabamos de hacer. Vamos a crear algunas cosas importantes rápidamente (si no entiendes algo, pregúntale a tu tutor o revisa lo capítulos anteriores, son temas que ya hemos cubierto).

Abre el archivo `blog/templates/blog/post_detail.html` y añade esta línea:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}
```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

para que la plantilla quede:

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
        <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

En el archivo `blog/urls.py` añadimos esta línea:

{% filename %}blog/urls.py{% endfilename %}
```python
    url(r'^post/(?P<pk>\d+)/edit/$', views.post_edit, name='post_edit'),
```

Vamos a reusar la plantilla `blog/templates/blog/post_edit.html`, así que lo último que nos falta es una *view*.

Abramos el archivo `blog/views.py` y añadamos al final esta línea:

{% filename %}blog/views.py{% endfilename %}
```python
    def post_edit(request, pk):
        post = get_object_or_404(Post, pk=pk)
        if request.method == "POST":
            form = PostForm(request.POST, instance=post)
            if form.is_valid():
                post = form.save(commit=False)
                post.author = request.user
                post.save()
                return redirect('blog.views.post_detail', pk=post.pk)
        else:
            form = PostForm(instance=post)
        return render(request, 'blog/post_edit.html', {'form': form})
```    

Esto se ve casi exactamente igual a nuestra view `post_new`, ¿no? Pero no del todo. Primero: pasamos un parámetro extra `pk` de los urls. Luego: obtenemos el modelo `Post` que queremos editar con `get_object_or_404(Post, pk=pk)` y después, al crear el formulario pasamos este post como una `instancia` tanto al guardar el formulario:

{% filename %}blog/views.py{% endfilename %}
```python
form = PostForm(request.POST, instance=post)
```

como al abrir un formulario con este post para editarlo:

{% filename %}blog/views.py{% endfilename %}
```python
form = PostForm(instance=post)
```

Ok, ¡vamos a probar si funciona! Dirígete a la página `post_detail`. Debe haber ahí un botón para editar en la esquina superior derecha:

![Botón editar](images/edit_button2.png)

Al dar click ahí, debes ver el formulario con nuestro post del blog:

![Editar formulario](images/edit_form2.png)

¡Siéntete libre de cambiar el título o el texto y guarda los cambios!

¡Felicitaciones! ¡Tu aplicación está cada vez más completa!

Si necesitas más información sobre los formularios de Django, debes leer la documentación: https://docs.djangoproject.com/en/1.10/topics/forms/

## Seguridad

¡Poder crear entradas nuevas sólo con pulsar un botón es genial! Pero, ahora mismo, cualquiera que visite tu página podría publicar una nueva entrada y seguro que eso no es lo que quieres. Vamos a hacer que el botón sea visible para ti pero no para nadie más.

En `blog/templates/blog/base.html`, buscar el `div` `page-header` y la etiqueta de enlace que has puesto ahí antes. Debería ser algo como:

{% filename %}blog/templates/blog/base.html{% endfilename %}
```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```
    

Vamos a agregar otra etiqueta `{% if %}` que hará que el enlace sólo parezca para los usuarios que hayan iniciado sesión en el admin. Ahora mismo, ¡eres sólo tú! Cambia la etiqueta `<a>` para que se parezca a esto:

{% filename %}blog/templates/blog/base.html{% endfilename %}
```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

Este `{% if %}` hará que el enlace sólo se envíe al navegador si el usuario que solicita la página ha iniciado sesión. Esto no protege completamente la creación de nuevas entradas, pero es un buen primer paso. Veremos más sobre seguridad en el libro de extensiones.

¿Recuerdas el ícono de editar que agregamos en nuestra página de detalle? Queremos agregar ese mismo cambio aquí, así otras personas no son capaces de editar entradas existentes.

Abre `blog/templates/blog/post_detail.html` y busca esta línea:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}
```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Cámbiala por esta:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}
```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}

Ya que probablemente tengas iniciada la sesión, si refrescas la página no verás nada distinto. sin embargo, abre la página en un navegador nuevo o en una ventana de incógnito ¡y verás que el enlace no se muestra!


## Una cosa más: ¡Tiempo de implementación!

Veamos si todo esto funciona en PythonAnywhere. ¡Tiempo de hacer otro despliegue!

*   Primero, haz un commit con tu nuevo código y súbelo a GitHub

```
$ git status
$ git add --all .
$ git status
$ git commit -m "Added views to create/edit blog post inside the site."
$ git push
```

* Luego, en una [consola Bash de PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}Terminal{% endfilename %}
```
$ cd my-first-blog
$ git pull
[...]
```

* Finalmente, ve a la pestaña [Web](https://www.pythonanywhere.com/web_app_setup/) y haz click en **Reload**.

¡Y eso debería ser todo! Felicidades :)
