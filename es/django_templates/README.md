# Plantillas de Django

¡Es hora de mostrar algunos datos! Para ello Django incorpora unas etiquetas de plantillas, **template tags**, muy útiles.

## ¿Qué son las etiquetas de plantilla?

Verás, en HTML no se puede escribir código en Python porque los navegadores no lo entienden. Sólo saben HTML. Sabemos que HTML es bastante estático, mientras que Python es mucho más dinámico.

Las **etiquetas de plantilla de Django** nos permiten insertar elementos de Python dentro del HTML, para que puedas construir sitios web dinámicos más rápida y fácilmente. ¡Genial!

## Mostrar la plantilla lista de posts

En el capítulo anterior le dimos a nuestra plantilla una lista de entradas en la variable `posts`. Ahora la vamos a mostrar en HTML.

Para imprimir una variable en una plantilla de Django, utilizamos llaves dobles con el nombre de la variable dentro, algo así:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Prueba esto en la plantilla `blog/templates/blog/post_list.html`. Ábrela en el editor de código, y cambia todo desde el segundo `<div>` hasta el tercer `</div>` por `{{ posts }}`. Guarda el archivo y refresca la página para ver los resultados:

![Figura 13.1](images/step1.png)

Como puedes ver, lo que hemos conseguido es esto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>] >
```

Significa que Django lo entiende como una lista de objetos. ¿Recuerdas de **Introducción a Python** cómo podemos mostrar listas? Sí, ¡con bucles for! En una plantilla de Django se hacen así:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %} {{ post }}{% endfor %}
```

Prueba esto en tu plantilla.

![Figura 13.2](images/step2.png)

¡Funciona! Pero queremos que se muestren como los post estáticos que creamos anteriormente en el capítulo de **Introducción a HTML**. Usted puede mezclar HTML y etiquetas de plantilla. Nuestro `body` se verá así:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p> publicado: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %}Todo lo que pongas entre `{% for %}` y `{% endfor %}` se repetirá para cada objeto de la lista. Refresca la página:{% endraw %}

![Figura 13.3](images/step3.png)

¿Has notado que utilizamos una notación diferente esta vez (`{{ post.title }}` o `{{ post.text }}`)? Estamos accediendo a los datos en cada uno de los campos definidos en nuestro modelo `Post`. También el `|linebreaksbr` está pasando el texto de los post a través de un filtro para convertir saltos de línea en párrafos.

## Una cosa más

Sería bueno ver si tu sitio web seguirá funcionando en la Internet pública, ¿no? Vamos a intentar desplegar de nuevo en PythonAnywhere. Aquí va un resumen de los pasos…

* Lo primero, sube tu código a GitHub

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Templates modificados para mostrar post desde base de datos."
    [...]
    $ git push
    

* Luego, vuelve a entrar en [PythonAnywhere](https://www.pythonanywhere.com/consoles/) y ve a tu **consola Bash** (o inicia una nueva), y ejecuta:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Recuerda sustituir `<your-pythonanywhere-domain>` con tu subdominio de PythonAnywhere real, sin los paréntesis angulares.)

* Y finalmente, dirígete a la [página "Web"](https://www.pythonanywhere.com/web_app_setup/) y haz click en **Reload** en tu aplicación web. (Para ir a otras páginas de PythonAnywhere desde la consola, haz click en el botón de la esquina superior derecha.) Los cambios deberían estar visibles en https://subdomain.pythonanywhere.com -- ¡compruébalo en en navegador! Si ves distintas publicaciones en el sitio en PythonAnywhere de las que tienes en tu servidor local, es lo normal. Tienes dos bases de datos, una en tu ordenador local y otra en PythonAnywhere y no tienen por qué tener el mismo contenido.

¡Felicidades! Ahora intenta añadir un nuevo post en tu administrador de Django (recuerda añadir published_date!) Asegúrate de que estas en el administrador de Django de PytonAnywhere, https://tunombre.pythonanywhere.com/admin. Luego actualiza tu página para ver si los posts aparecen.

¿Funciona de maravilla? ¡Estamos orgullosas! Aléjate un rato del ordenador, te has ganado un descanso. :)

![Figura 13.4](images/donut.png)