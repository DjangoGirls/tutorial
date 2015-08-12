# Vistas de Django - ¡Es hora de crear!

Es hora de deshacerse del error que hemos creado en el capítulo anterior :)

Una *View* es un lugar donde ponemos la "lógica" de nuestra aplicación. Se solicitará información del `model` que creaste anteriormente y se pasará a una `view` que crearás en el próximo capítulo. Las vistas son sólo métodos de Python que son un poco más complicados que lo que hicimos en el capítulo de **Introducción a Python**.

Las Vistas se colocan en el archivo `views.py`. Agregaremos nuestras *views* al archivo `blog/views.py`.

## blog/views.py

Bien, vamos abrir este archivo y ver lo que contiene:

``` python
    from django.shortcuts import render
    
    # Create your views here.
```

No demasiadas cosas aquí todavía. La *view* más simple puede ser como esto:

``` python
    def post_list(request):
        return render(request, 'blog/post_list.html', {})
```    

Como puedes ver, hemos creado un método (`def`) llamado `post_list` que toma un `request` y hace un `return` de un método `render` que renderizará (construirá) nuestra plantilla `blog/post_list.html`.

Guarda el archivo, dirígete a http://127.0.0.1:8000/ y veamos lo que tenemos ahora.

¡Otro error! Leamos lo que está pasando ahora:

![Error][1]

 [1]: images/error.png

Este es uno fácil: *TemplateDoesNotExist*. ¡Vamos a arreglar este error creando una plantilla en el siguiente capítulo!

> Aprende más acerca de las views de Django leyendo la documentación oficial: https://docs.djangoproject.com/en/1.8/topics/http/views/
