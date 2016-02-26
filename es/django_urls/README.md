# Django urls

Vamos a construir nuestra primera página web -- ¡una página de inicio para tu blog! Pero primero, vamos a aprender un poco sobre Django urls.

## ¿Qué es una URL?

Una URL es simplemente una dirección web, puedes ver una URL cada vez que visitas cualquier sitio web - es visible en la barra de direcciones de tu navegador (¡Sí! `127.0.0.1:8000` es una URL. Y http://djangogirls.com es también una URL):

![URL][1]

 [1]: images/url.png

Cada página en Internet necesita su propia URL. De esta manera tu aplicación sabe lo que debe mostrar a un usuario que abre una URL. En Django se usa algo llamado `URLconf` (configuración de URL), un conjunto de patrones que Django intentará hacer coincidir con la dirección URL recibida para encontrar la vista correcta.

## ¿Cómo funcionan las URLs en Django?

Vamos a abrir el archivo `mysite/urls.py` y ver cómo es:

``` python
    from django.conf.urls import include, url
    from django.contrib import admin
    
    urlpatterns = [
        # Examples:
        # url(r'^$', 'mysite.views.home', name='home'),
        # url(r'^blog/', include('blog.urls')),
    
        url(r'^admin/', include(admin.site.urls)),
    ]
```    

Como puedes ver, Django ya puso algo aquí para nosotros.

Las líneas que comienzan con `#` son comentarios - significa que esas líneas no serán ejecutadas por Python. Muy útil, ¿verdad?

Ya está aquí la URL de admin, que visitaste en el capítulo anterior:

``` python
        url(r'^admin/', include(admin.site.urls)),
```    

Esto significa que para cada URL que empieza con `admin/` Django encontrará su correspondiente *view*. En este caso estamos incluyendo en una sola línea muchas URLs de admin, así no está todo comprimido en este pequeño archivo - es más limpio y legible.

## Regex

¿Te preguntas cómo Django coincide las direcciones URL con las vistas? Bueno, esta parte es difícil. Django utiliza `regex` -- expresiones regulares. Regex tiene muchas (¡un montón!) de normas que forman un patrón de búsqueda. Dado que las expresiones regulares son un tema avanzado, no entraremos en detalles sobre su funcionamiento.

Si te interesa entender cómo creamos esos patrones, aquí hay un ejemplo del proceso - solamente necesitaremos un subconjunto de reglas limitado para expresar el patrón que estamos buscando:

    ^ denota el principio del texto
    $ denota el final del texto
    \d representa un dígito
    + indica que el ítem anterior debería ser repetido por lo menos una vez
    () para encerrar una parte del patrón
    

Cualquier otra cosa en la definición del URL será tomada literalmente.

Ahora imagina que tienes un sitio web con una dirección como esta: `http://www.mysite.com/post/12345/`, donde `12345` es el número de post.

Escribir vistas separadas para todos los números de post sería realmente molesto. Con las expresiones regulares podemos crear un patrón que coincidirá la URL y extraerá el número para nosotras: `^post/(\d+)/$`. Analicemos esta expresión parte por parte para entender qué es lo que estamos haciendo aquí:

*   **^post/** le está diciendo a Django que tome cualquier cosa que tenga `post/` al principio del URL (justo antes de `^`)
*   **(\d+)** significa que habrá un número (de uno o más dígitos) y que queremos que ese número sea capturado y extraído
*   **/** le dice a Django que otro caracter `/` debería venir a continuación
*   **$** indica el final del URL, lo que significa que sólo cadenas finalizando con `/` coincidirán con este patrón

## ¡Tu primer URL de Django!

¡Es hora de crear nuestro primer URL! Queremos que 'http://127.0.0.1:8000/' sea la página de inicio de nuestro blog y que muestre una lista de posts.

También queremos mantener el archivo `mysite/urls.py` limpio, así que importaremos URLs de nuestro `blog` al archivo `mysite/urls.py` principal.

Elimina las líneas comentadas (líneas comenzando con `#`) y agrega una línea que importará `blog.urls` en el url principal (`''`).

Tu archivo `mysite/urls.py` debería verse como este:

``` python
    from django.conf.urls import include, url
    from django.contrib import admin
    
    urlpatterns = [
        url(r'^admin/', include(admin.site.urls)),
        url(r'', include('blog.urls')),
    ]
``` 

Django ahora redirigirá todo lo que vaya hacia 'http://127.0.0.1:8000/' a `blog.urls` y buscará más instrucciones allí.

Cuando escribes expresiones regulares en Python acostúmbrate a poner `r` al principio de la cadena - esto es solamente una pista para que Python entienda que la cadena contenerá caracteres especiales que no son para ser interpretados por Python sino que son parte de la expresión regular.

## blog.urls

Crea un nuevo archivo vacío `blog/urls.py`. ¡Muy bien! Agrega estas primeras dos líneas:

``` python
    from django.conf.urls import include, url
    from . import views
```

Aquí solo estamos importando los métodos de Django y todas nuestras `views` del `blog` (todavía no tenemos ninguna, pero lo haremos en un minuto)

Luego de esto, podemos agregar nuestro primer patrón URL:

``` python
    urlpatterns = [
        url(r'^$', views.post_list),
    ]
```

Como puedes ver, ahora estamos asignando una `view` llamada `post_list` al URL `^$`. Esta expresión regular coincidirá con `^` (un inicio) seguido de `$` (un final) - por lo tanto, sólo una cadena vacía coincidirá. Y esto es correcto, ya que en los URL resolvers de Django 'http://127.0.0.1:8000/' no es parte del URL. Este patrón mostrará a Django que `views.post_list` es el lugar correcto al que ir si alguien ingresa a tu sitio web con la dirección 'http://127.0.0.1:8000/'.

¿Todo bien? Abre http://127.0.0.1:8000/ en tu navegador para ver el resultado.

![Error][2]

 [2]: images/error1.png

No hay más un "It works", ¿verdad? No te preocupes, es solamente una página de error, ¡nada que nos asuste! De hecho, son bastante útiles:

Puedes leer que no hay ningún **atributo 'post_list'**. ¿*post_list* te recuerda algo? ¡Así es como llamamos a nuestra vista! Esto significa que todo está en su lugar, sólo que no creamos nuestra *view* todavía. No te preocupes, ya llegaremos a eso.

> Si quieres saber más sobre Django URLconfs, mira la documentación oficial: https://docs.djangoproject.com/en/1.8/topics/http/urls/
