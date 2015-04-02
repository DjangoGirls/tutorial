# Extiende tu aplicación

Ya hemos completado todos los pasos necesarios para la creación de nuestro sitio web: sabemos cómo escribir un model, url, view y template. También sabemos cómo hacer que nuestro sitio web.

Tiempo para practicar!

Lo primero que necesitamos en nuestro blog, es obviamente, una página para mostrar un post, ¿cierto?

Ya tenemos un modelo `Post`, así que no necesitamos añadir nada a `models.py`.

## Crea un enlace en la plantilla

Vamos a empezar añadiendo un enlace dentro del archivo `blog/templates/blog/post_list.html`. Hasta el momento debe verse así:

    {% extends 'blog/base.html' %}
    
    {% block content %}
        {% for post in posts %}
            <div class="post">
                <div class="date">
                    {{ post.published_date }}
                </div>
                <h1><a href="">{{ post.title }}</a></h1>
                <p>{{ post.text|linebreaks }}</p>
            </div>
        {% endfor %}
    {% endblock content %}
    

Queremos tener un enlace a una página de detalle sobre el título del post. Vamos a cambiar `< h1 >< a href = "" >{{ post.title }} < /a >< / h1 >` dentro del enlace:

    <h1><a href="{% url 'blog.views.post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
    

Tiempo para explicar lo misterioso `{% url 'blog.views.post_detail' pk=post.pk %}`. Como sospechas, la notación `{% %}` significa que estamos utilizando Django template tags. Esta vez vamos a utilizar uno que va a crear una dirección URL para nosotros!

`blog.views.post_detail` es una ruta hacia `post_detail` *view* que queremos crear. Por favor nota: `blog` es el nombre de nuestra aplicación (el `blog` de directorio), `views` es el nombre del archivo `views.py` y `post_detail` - es el nombre de la *view*.

Ahora cuando vayamos a:

    http://127.0.0.1:8000/
    

Tendremos un error (como era de esperar, ya que no tenemos una dirección URL o una *viwe* para `post_detail`). Se verá así:

![NoReverseMatch error][1]

 [1]: images/no_reverse_match2.png

Vamos a crear una dirección URL en `urls.py` para nuestro `post_detail` *view*!

### URL: http://127.0.0.1:8000/post/1/

Queremos crear una dirección URL de Django a una *view* denominada `post_detail`, que mostrará una entrada del blog. ¿Agrega la línea `url (r'^ poste / (?P < pk >[0-9] +) / $', views.post_detail),` en el archivo `blog/urls.py`. Debe tener este aspecto:

    from django.conf.urls import include, url
    from . import views
    
    urlpatterns = [
        url(r'^$', views.post_list),
        url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail),
    ]
    

Da miedo, pero no te preocupes - lo explicaremos para ti: - comienza con `^` otra vez, "el principio" - `post /` sólo significa que después del comienzo, la dirección URL debe contener la palabra **post** y **/**. Hasta ahora, bien. - `(?P < pk >[0-9] +)`-esta parte es más complicada. Significa que Django llevará todo lo que coloques aquí y lo transferirá a una vista como una variable llamada `pk`. `[0-9]` también nos dice que sólo puede ser un número, no es una carta (entre 0 y 9). `+` significa que tiene que haber uno o más dígitos. Por algo como `http://127.0.0.1:8000/post / /` no es válido, pero `1234567890/post/http://127.0.0.1:8000/` es perfectamente aceptable! -`/` - entonces necesitamos **/** de nuevo - `$` - "the end"!

Eso significa que si entras en `http://127.0.0.1:8000/post/5/` en tu navegador, Django entenderá que estás buscando una *view* denominada `post_detail` y transferirá la información de `pk` que es igual a `5` a la *view*.

`PK` es atajo para la `llave principal`. Este nombre se utiliza a menudo en proyectos de Django. Pero puedes nombrar tus variable como te gusta (Recuerda: minúscula y `_` en lugar de espacios en blanco!). Por ejemplo en lugar de `(?.¿P < pk >[0-9] +)` podríamos tener variable `post_id`, así que esto lo verías como: `(?P < post_id > [0-9] +)`.

¡Bien! Vamos a actualizar la página:

    http://127.0.0.1:8000/
    

¡Boom! Sin embargo otro error! Como era de esperarse!

![AttributeError][2]

 [2]: images/attribute_error2.png

¿Te acuerdas del próximo paso? Por supuesto: agregar una view!

## post_detail view

Esta vez nuestra *view* tendrá un parámetro adicional `pk`. ¿Nuestra *view* necesita atraparla, cierto? Entonces definiremos nuestra función como `def post_detail (petición, pk):`. Ten en cuenta que tenemos que usar exactamente el mismo nombre que especificamos en las urls (`pk`). Omitir esta variable es incorrecto y resultará en un error!

Ahora, queremos sólo una entrada del blog. Para ello podemos usar querysets como esta:

    Post.objects.get(pk=pk)
    

Pero este código tiene un problema. Si no hay ningún `Post` con `llave primaria` (`pk`) tendremos un error muy feo!

![DoesNotExist error][3]

 [3]: images/does_not_exist2.png

No queremos eso! Pero, por supuesto, Django viene con algo que se encargará de ese problema por nosotros: `get_object_or_404`. En caso de que no haya ningún `Post` con el dado `pk` se mostrará una más agradable página ( llamada `Page Not Found 404`).

![Page not found][4]

 [4]: images/404_2.png

La buena noticia es que puedes crear tu propia página `Page Not Found` y diseñarla como desees. Pero por ahora, no es súper importante.

Es hora de agregar una *view* a nuestro archivo `views.py`!

Deberíamos abrir `blog/views.py` y agregue el siguiente código:

    from django.shortcuts import render, get_object_or_404
    

Cerca de la líneas `from`. Y en el final del archivo añadimos nuestra *view*:

    def post_detail(request, pk):
        post = get_object_or_404(Post, pk=pk)
        return render(request, 'blog/post_detail.html', {'post': post})
    

Sí. Es hora de actualizar la página:

    http://127.0.0.1:8000/
    

![Post list view][5]

 [5]: images/post_list2.png

¡ Funcionó! Pero ¿qué pasa cuando haces clic en un enlace en el título del post?

![TemplateDoesNotExist error][6]

 [6]: images/template_does_not_exist2.png

¡ Oh no! Otro error! Pero ya sabemos cómo lidiar con eso, ¿no? Tenemos que añadir una plantilla!

Crearemos un archivo en `blog/templates/blog` llamado `post_detail.html`.

Se verá así:

    {% extends 'blog/base.html' %}
    
    {% block content %}
        <div class="date">
            {% if post.published_date %}
                {{ post.published_date }}
            {% endif %}
        </div>
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaks }}</p>
    {% endblock %}
    

Una vez más estamos extendiendo `base.html`. En el bloque de `content` queremos mostrar un post published_date (si existe), título y texto. Pero deberíamos discutir algunas cosas importantes, ¿cierto?

`{% if ... %} ... {% endif %}` es una template tag que podemos usar cuando queramos ver algo (recuerdas `if... else...` desde el capítulo de **Introducción a Python**?). En este escenario queremos comprobar si `published_date de un post` no está vacío.

Bien, podemos actualizar nuestra página y ver si `Page Not Found` se ha ido.

![Post detail page][7]

 [7]: images/post_detail2.png

¡ Yay! ¡ Funciona!

## Una cosa más: ¡Tiempo de implementación!

Sería bueno ver si tu sitio sigue funcionando en Heroku, ¿no? Intentemos implementarlo nuevamente. Si olvidaste como hacerlo, revisa el final del capítulo 15:

    $ git status
    ...
    $ git add -A .
    $ git status
    ...
    $ git commit -m "Added more views to the website."
    ...
    $ git push heroku master
    

¡Y eso debería ser todo! Felicidades :)
