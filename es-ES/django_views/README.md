# Vistas en Django - ¡Hora de crear!

Es hora de deshacerse del error que hemos creado en el capítulo anterior! :)

Una *View* es un lugar donde ponemos la "lógica" de nuestra aplicación. Pedirá información del `modelo` que has creado antes y se la pasará a la `plantilla`. Crearemos una plantilla en el próximo capítulo. Las vistas son sólo métodos de Python que son un poco más complicados que los que escribimos en el capítulo **Introducción a Python**.

Las Vistas se colocan en el archivo `views.py`. Agregaremos nuestras *views* al archivo `blog/views.py`.

## blog/views.py

OK, let's open up this file in our code editor and see what's in there:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

No hay demasiadas cosas aquí todavía.

Recuerda que las lineas que comienzan con `#` son comentarios - significa que Python no las ejecutarà.

Creemos una *vista (view)* como sugiere el comentario. Añade la siguiente mini-vista por debajo:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Como puedes ver, hemos creado una función (`def`) llamada `post_list` que acepta `request` y `return` una función `render` que reproduce (construye) nuestra plantilla `blog/post_list.html`.

Guarda el archivo, ve a http://127.0.0.1:8000/ y mira lo que hemos hecho.

¡Otro error! Leamos lo que está pasando ahora:

![Error](images/error.png)

Esto demuestra que el servidor está funcionando otra vez, al menos, pero todavía no se ve bien, ¿No? No te preocupes, es sólo una página de error, ¡nada a que temer! Al igual que los mensajes de error en la consola, estos son realmente muy útiles. Puedes leer que la *TemplateDoesNotExist*. Vamos a corregir este error y crear una plantilla en el próximo capítulo!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/views/