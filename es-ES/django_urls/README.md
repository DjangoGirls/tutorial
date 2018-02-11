# URLs en Django

Estamos a punto de construir nuestra primera página web: ¡una página de inicio para el blog! Pero primero, vamos a aprender un poco acerca de las urls en Django.

## ¿Qué es una URL?

Una URL es simplemente una dirección web. Puedes ver una URL cada vez que visitas una página. Se ve en la barra de direcciones del navegador. (Sì! ¡`127.0.0.1:8000` es una URL! Y `https://djangogirls.org` también es una URL.)

![URL](images/url.png)

Cada página en Internet necesita su propia URL. De esta manera tu aplicación sabe lo que debe mostrar a un usuario que abre una URL. In Django, we use something called `URLconf` (URL configuration). URLconf is a set of patterns that Django will try to match the requested URL to find the correct view.

## ¿Cómo funcionan las URLs en Django?

Vamos a abrir el archivo `mysite/urls.py` en el editor de código de tu elección y veamos lo que tiene:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
]
```

Como puedes ver, Django ya puso algo aquí por nosotros.

Líneas entre triples comillas (`'''` o `"""`) son llamadas docstrings - puedes escribirlos en la parte superior de un archivo, clase o método para describir lo que hace. No serán ejecutadas por Python.

The admin URL, which you visited in the previous chapter, is already here:

{% filename %}mysite/urls.py{% endfilename %}

```python
    url(r'^admin/', admin.site.urls),
```

Esta linea dice que para cada URL que empieza con `admin/` Django encontrará su correspondiente *view*. In this case, we're including a lot of admin URLs so it isn't all packed into this small file – it's more readable and cleaner.

## Regex

¿Te preguntas cómo compara Django las direcciones URL con las vistas? Bueno, esta parte es complicada. Django usa `regex`, abreviatura de "expresiones regulares". Regex tiene muchas normas (¡un montón!) que forman un patrón de búsqueda. Since regexes are an advanced topic, we will not go into detail over how they work.

Si aún así quieres entender cómo hemos creado los patrones, aquí hay un ejemplo del proceso. Sólo necesitaremos un grupo limitado de reglas para expresar el patrón que estamos buscando, en concreto:

* `^` para el inicio del texto
* `$` para el final del texto
* `/d` para un dìgito
* `+` para indicar que el elemento anterior se deberìa repetir al menos una vez
* `()` para capturar parte del patròn

Cualquier otra cosa en la definición de la URL será tomada literalmente.

Ahora imagina que tienes un sitio web con una dirección como esta: `http://www.mysite.com/post/12345/`, donde `12345` es el número de post.

Escribir vistas separadas para todos los números de entradas en el blog sería realmente molesto. Con expresiones regulares podemos crear un patrón que encontrarà la URL y extraerá el número para nosotros: `^post/(\d+)/$`. Analicemos esta expresión parte por parte para entender qué es lo que estamos haciendo:

* **^post/** is telling Django to take anything that has `post/` at the beginning of the URL (right after `^`)
* **(\d+)** significa que habrá un número (de uno o más dígitos) y que queremos que ese número sea capturado y extraído
* **/** tells Django that another `/` character should follow
* **$** indica el final de la URL, lo que significa que sólo coincidirán con este patrón las cadenas que terminen en `/`

## ¡Tu primera URL de Django!

¡Es hora de crear nuestra primera URL! Queremos que 'http://127.0.0.1:8000/' sea la página de inicio del blog y que muestre una lista de post.

También queremos mantener limpio el archivo `mysite/urls.py`, así que vamos a importar las urls de nuestra aplicación `blog` en el archivo principal `mysite/urls.py`.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.

El archivo `mysite/urls.py` debería verse ahora así:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.conf.urls import include
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'', include('blog.urls')),
]
```

Django will now redirect everything that comes into 'http://127.0.0.1:8000/' to `blog.urls` and looks for further instructions there.

Cuando se escriben expresiones regulares en Python siempre se pone `r` delante de la cadena. Esto le da una pista a Python de que la cadena puede contener caracteres especiales que no son para Python en sí, sino para la expresión regular.

## blog.urls

Crea un nuevo archivo vacìo llamado `urls.py` en la carpeta `blog`. Muy bien! Añade estas dos lineas:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

Aquí estamos importando la función de Django `url` y todos nuestras `views` desde la aplicación `blog` (no tenemos una aun, pero veremos eso en un minuto!)

Luego de esto, podemos agregar nuestro primer patrón URL:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

Como puedes ver, ahora estamos asignando una vista `view` llamada `post_list` al URL `^$`. Esta expresión regular coincidirá con `^` (un inicio) seguido de `$` (un final), por lo tanto sólo coincidirá con una cadena vacìa. Es correcto, porque en el sistema de resolución de URL de Django, 'http://127.0.0.1:8000/' no forma parte de la URL. Este patrón le dirá a Django que `views.post_list` es el lugar correcto al que ir si alguien entra a tu sitio web con la dirección 'http://127.0.0.1:8000/'.

La última parte `name='post_list'` es el nombre de la URL que se utilizará para identificar a la vista. Puede coincidir con el nombre de la vista pero también puede ser algo completamente distinto. Utilizaremos las URL con nombre más delante en el proyecto así que es importante darle un nombre a cada URL de la aplicación. También deberíamos intentar mantener los nombres de las URL únicos y fáciles de recordar.

Si tratas de visitar http://127.0.0.1:8000/ ahora, encontrarás un mensaje de error 'web page not available' a algo así. Esto es porque el servidor (¿recuerdas que escribimos `runserver`?) ya no está funcionando. Mira la ventana de la consola del servidor para saber por qué.

![Error](images/error1.png)

La consola esta mostrando un error, pero no te preocupes - de hecho es muy ùtil: està diciendote que **no existe el atributo 'post_list'**. Ese es el nombre del *view* que Django está tratando de encontrar y usar, pero aun no lo hemos creado. At this stage, your `/admin/` will also not work. No te preocupes, ya llegaremos a eso.

> Si quieres saber más sobre Django URLconfs, mira la documentación oficial: https://docs.djangoproject.com/en/1.11/topics/http/urls/