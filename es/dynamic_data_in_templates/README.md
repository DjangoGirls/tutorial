# Datos dinámicos en plantillas

Tenemos diferentes piezas en su lugar: el modelo `Post` está definido en `models.py`, tenemos a `post_list` en `views.py` y la plantilla agregada. ¿Pero cómo haremos realmente para que nuestros posts aparezcan en nuestra plantilla HTML? Porque eso es lo que queremos: tomar algún contenido (modelos guardados en la base de datos) y mostrarlo adecuadamente en nuestra plantilla, ¿no?

Esto es exactamente lo que las *views* se supone que hacen: conectar modelos con plantillas. En nuestra *view* `post_list` necesitaremos tomar los modelos que deseamos mostrar y pasarlos a una plantilla. Así que básicamente en una *view* decidimos qué (modelo) se mostrará en una plantilla.

Muy bien, ahora ¿cómo lo hacemos?

Necesitamos abrir nuestro archivo `blog/views.py`. Hasta ahora la *view* `post_list` se ve así:

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

El punto después de `from` indica el *directorio actual* o la *aplicación actual*. Como `views.py` y `models.py` están en el mismo directorio, simplemente usamos `.` y el nombre del archivo (sin `.py`). Ahora importamos el nombre del modelo (`Post`).

¿Pero ahora qué sigue? Para tomar publicaciones reales del modelo `Post`, necesitamos algo llamado `QuerySet` (conjunto de consultas).

## QuerySet

Ya debes estar familiarizada con la forma en que funcionan los QuerySets. Hablamos de ellos en el capítulo [Django ORM (QuerySets)](../django_orm/README.md).

Así que ahora nos interesa tener una lista de entradas del blog que han sido publicadas y ordenadas por `published_date` (fecha de publicación), ¿no? ¡Ya lo hicimos en el capítulo QuerySets!

{% filename %}blog/views.py{% endfilename %}
```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Ahora pondremos este bloque de código en el archivo `blog/views.py`, agregándolo a la función `def post_list(request)`:

{% filename %}blog/views.py{% endfilename %}
```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

La última parte es pasar el QuerySet `posts` a la plantilla (veremos cómo mostrarla en el siguiente capítulo).

Fíjate en que creamos una *variable* para el QuerySet: `posts`. Trátala como si fuera el nombre de nuestro QuerySet. De aquí en adelante vamos a referirnos al QuerySet con ese nombre.

Además, este código utiliza la función `timezone.now()`, así que necesitamos agregar una importación de `timezone`.

En la función `render` ya tenemos el parámetro `request` (todo lo que recibimos del usuario via Internet) y el archivo `'blog/post_list.html'` como plantilla. El último parámetro, que se ve así: `{}` es un lugar en el que podemos agregar algunas cosas para que la plantilla las use. Necesitamos nombrarlos (los seguiremos llamando `'posts'` por ahora :)). Se debería ver así: `{'posts': posts}`. Fíjate en que la parte antes de `:` es una cadena; tienes que envolverla con comillas `''`.

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

Si quieres leer un poco más acerca de QuerySets en Django, puedes darle un vistazo a: https://docs.djangoproject.com/en/1.10/ref/models/querysets/
