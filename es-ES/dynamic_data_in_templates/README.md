# Datos dinámicos en plantillas

Tenemos diferentes piezas en su lugar: el modelo `Post` está definido en `models.py`, tenemos a `post_list` en `views.py` y la plantilla agregada. ¿Pero cómo haremos realmente para que nuestros posts aparezcan en nuestra plantilla HTML? Porque eso es lo que queremos, tomar algún contenido (modelos guardados en la base de datos) y mostrarlo adecuadamente en nuestra plantilla, ¿no?

Esto es exactamente lo que las *views* se supone que hacen: conectar modelos con plantillas. En nuestra *view* `post_list` necesitaremos tomar los modelos que deseamos mostrar y pasarlos a una plantilla. En una *vista* decidimos que (modelo) se mostrará en una plantilla.

Muy bien, entonces ¿cómo lo logramos?

Tenemos que abrir `blog/views.py` en el editor. De momento `post_list` *view* tiene esto:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

¿Recuerdas cuando hablamos de incluir código en diferentes archivos? Ahora tenemos que incluir el modelo que definimos en el archivo `models.py`. Agregaremos la línea `from .models import Post` de la siguiente forma:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

El punto antes de `models` indica el *directorio actual* o la *aplicación actual*. Ambos, `views.py` y `models.py` están en el mismo directorio. Esto significa que podemos utilizar `.` y el nombre del archivo (sin `.py`). Ahora importamos el nombre del modelo (`Post`).

¿Pero ahora qué sigue? Para tomar posts reales del modelo `Post`, necesitamos algo llamado `QuerySet`.

## QuerySet

Ya debes estar familiarizada con la forma en que funcionan los QuerySets. Hablamos de ellos en el capítulo [Django ORM (QuerySets)](../django_orm/README.md).

Así que ahora nos interesa tener una lista de post publicados ordenados por `published_date` (fecha de publicación), ¿no? ¡Ya lo hicimos en el capítulo QuerySets!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Abre `blog/views.py` en el editor, y añade este trozo de código a la función `def post_list(request)` -- pero no te olvides de añadir `from django.utils import timezone` antes:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

To display our QuerySet on our blog's post list, we have two things left to do:

1. Pass the `posts` QuerySet to the template context, by changing the `render` function call. We'll do this now.
2. Modify the template to display the `posts` QuerySet. We'll cover this in a later chapter.

Fíjate en que creamos una *variable* para el QuerySet: `posts`. Trátala como si fuera el nombre de nuestro QuerySet. De aquí en adelante vamos a referirnos al QuerySet con ese nombre.

En la función `render` tenemos el parámetro `request` (todo lo que recibimos del usuario via Internet) y otro parámetro dándole el archivo de la plantilla (`'blog/post_list.html'`). El último parámetro, que se ve así: `{}` es un lugar en el que podemos agregar algunas cosas para que la plantilla las use. Necesitamos nombrarlos (los seguiremos llamando `'posts'` por ahora). :) Se debería ver así: `{'posts': posts}`. Fíjate en que la parte antes de `:` es una cadena; tienes que envolverla con comillas: `"`.

Finalmente nuestro archivo `blog/views.py` debería verse así:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

¡Terminamos! Ahora regresemos a nuestra plantilla y mostremos este QuerySet.

¿Quieres leer un poco más sobre QuerySets en Django? Debería mirar aquí: https://docs.djangoproject.com/en/2.2/ref/models/querysets/