# Vistas de Django - es hora de crear!

Es hora de deshacerse de el error que hemos creado en el último capítulo :)

Una *View* es un lugar donde ponemos la «lógica» de nuestra aplicación. Se solicitará información del `model` que se creo anteriormente y pasarlo a una `view` que va a crearse en el próximo capítulo. Las vistas son sólo métodos de Python que son un poco más complicados que lo que hicimos en el capítulo de **Introducción a Python**.

Las Vistas se colocan en el archivo `views.py`. Agregaremos nuestras *vistas* al archivo `blog/views.py`.

## blog/views.py

Bien, vamos abrir este archivo y ver lo que contiene:

    from django.shortcuts import render
    
    # Create your views here.
    

No, demasiadas cosas aquí todavía. La simple *view* puede verse como esto:

    def post_list(request):
    
        return render(request, 'blog/post_list.html', {})
    

Como puedes ver, hemos creado un método (`def`) llamado `post_list` que contiene un `request` y `return` de un método, el `render` se redirigira a nuestra plantilla `blog/post_list.html`.

En seguida, guarde el archivo, y dirígete a tu navegador a http://127.0.0.1:8000 / para ver lo que tenemos ahora.

Otro error! Lee lo que está pasando ahora:

![Error][1]

 [1]: images/error.png

Esto es fácil: *TemplateDoesNotExist*. Vamos a arreglar este error, creando una plantilla en el siguiente capítulo!

> Aprenda más acerca de las vistas de Django mediante la lectura de la documentación oficial: https://docs.djangoproject.com/en/1.8/topics/http/views/
