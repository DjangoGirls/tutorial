# Django urls

Vamos a construir nuestra primera página web - una página para tu blog! Pero primero, vamos a aprender un poco sobre Django urls.

## ¿Qué es una URL?

Una URL es simplemente una dirección web, puedes ver una URL cada vez que visitas cualquier sitio web - es visible en la barra de direcciones de tu navegador (¡Sí! `127.0.0.1:8000` es una URL. Y http://djangogirls.com es también una dirección URL):

![URL][1]

 [1]: images/url.png

Cada página en la Internet necesita su propia dirección URL. De esta manera su aplicación sabe lo que debe mostrar a un usuario que abre una dirección URL. En Django se usa algo llamado `URLconf` (configuración de URL), que es un conjunto de patrones que Django intentará hacer coincidir con la dirección URL recibida para encontrar la vista correcta.

## ¿Cómo funcionan las URLs en Django?

Vamos a abrir el archivo `mysite/urls.py` y ver lo que aparece:

    from django.conf.urls import include, url
    from django.contrib import admin
    
    urlpatterns = [
        # Examples:
        # url(r'^$', 'mysite.views.home', name='home'),
        # url(r'^blog/', include('blog.urls')),
    
        url(r'^admin/', include(admin.site.urls)),
    ]
    

Como puedes ver, Django ya puso algo aquí para nosotros.

Las líneas que comienzan con `#` son comentarios - significa que esas líneas no serán ejecutadas por Python. Muy útil, verdad?

Ya está aquí la URL de admin, que visitaste en el capítulo anterior:

    url(r'^admin/', include(admin.site.urls)),
    

Esto significa que para cada URL que empieza con `admin /` Django encontrará un *view*. En este caso vamos a incluir muchas URLs a admin para que eso es mejor empacar todo en este pequeño archivo - es más legible y limpio.

## Regex

¿Te preguntas cómo Django coincide con las direcciones URL a las vistas? Bueno, esta parte es difícil. Django utiliza `regex`--expresiones regulares. Regex tiene muchos (un montón!) de normas que forman un patrón de búsqueda. No es tan fácil de entender así que no te preocupes hoy y sin duda los conocerás y utilizaras en el futuro. Hoy vamos a utilizar sólo los que necesitamos.

Aquí hay un simple ejemplo para no atrapar esta frase: imagina que tienes un sitio web con la dirección: `http://www.mysite.com/post/12345/`, donde `12345` es el número de tu post. Escribir vistas separadas para todos los números de post sería muy molesto. Django facilita permitiéndole escribir `http://www.mysite.com/post/<un > número /`. Django se encargará del resto!

## Tu primer url Django!

Es hora de crear nuestro primer URL! Queremos http://127.0.0.1:8000 / para ser una presentación de nuestro blog y mostrar una lista de posts.

También queremos limpiar el archivo `mysite/urls.py`, así que vamos a importar urls desde nuestra aplicación de `blog` en el archivo principal `mysite/urls.py`.

Adelante, eliminar las líneas comentadas (líneas que comienzan con `#`) y añadir una línea que va a importar en el principal (url `blog.urls``''`).

El archivo `mysite/urls.py` ahora debe verse así:

    from django.conf.urls import include, url
    from django.contrib import admin
    
    urlpatterns = [
        url(r'^admin/', include(admin.site.urls)),
        url(r'', include('blog.urls')),
    ]
    

Django redirigirá ahora todo lo que entre en `http://127.0.0.1:8000 /` a `blog.urls` y esperara para más instrucciones.

## blog.urls

Cree un nuevo archivo vacío `blog/urls.py`. ¡Muy bien! Añade estas dos primeras líneas:

    from django.conf.urls import include, url
    from . import views
    

Aquí nosotros sólo importaremos métodos de Django y todas nuestras `vistas` de aplicación `blog` (aún no tenemos ninguna, pero llegaremos a eso en un minuto!)

Después de eso, podemos agregar nuestro primer patrón de URL:

    urlpatterns = [
        url(r'^$', views.post_list),
    ]
    

Como puedes ver, estamos asignando una `vista` denominada `post_list` a la `^ $` URL. Pero, ¿qué hace`^ $`? Es una magia regex :) Lo desglosemos:-`^` en regex significa "el principio"; de este signo podemos empezar buscando nuestro patrón - `$` si coincide sólo "el fin" de la cadena, lo que significa que vamos a terminar buscando nuestro patrón aquí

Si pones estos dos signos juntos, parece que estamos buscando una cadena vacía! Y eso es correcto, porque en la resolución de Django url, `http://127.0.0.1:8000 /` no es parte de la URL. Este patrón mostrará a Django que `views.post_list` es el lugar perfecto para ir si alguien entra en su sitio de Internet en la dirección `http://127.0.0.1:8000 /`.

¿Todo bien? Abre http://127.0.0.1:8000 en tu navegador para ver el resultado.

![Error][2]

 [2]: images/error1.png

No "funciona", ¿eh? No te preocupes, es sólo una página de error, nada que temer. Son en realidad muy útiles:

Se puede leer que no existe ningún atributo **'post_list'**. *¿Post_list* lo recuerdas? Esto es lo que llamamos nuestro punto de vista! Esto significa que todo esté en su lugar, simplemente no creamos nuestra *view* todavía. No te preocupes, llegaremos ahí.

> Si quieres saber más sobre Django URLconfs, mira la documentación oficial: https://docs.djangoproject.com/en/1.8/topics/http/urls/
