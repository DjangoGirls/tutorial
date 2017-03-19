# Plantillas de Django

¡Es hora de mostrar algunos datos! Para ello Django incorpora unas etiquetas de plantillas, __template tags__, muy útiles.

## ¿Qué son las template tags?

Verás, en HTML no se puede escribir código Python porque los navegadores no lo entienden. Sólo saben HTML. Sabemos que HTML es bastante estático, mientras que Python es mucho más dinámico.

Las __template tags de Django__ nos permiten comunicar elementos de Python a HTML, para que puedas construir sitios web dinámicos más rápido y fácil.

## Mostrar la plantilla post list

En el capítulo anterior le dimos a nuestra plantilla una lista de entradas en la variable `posts`. Ahora la vamos a mostrar en HTML.

Para imprimir una variable en una plantilla de Django, utilizamos llaves dobles con el nombre de la variable dentro, así:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{{ posts }}
```

Prueba esto en la plantilla `blog/templates/blog/post_list.html`. Sustituye todo desde el segundo `<div>` al tercer `</div>` por `{{ posts }}`. Guarda el archivo y refresca la página para ver los resultados:

![Figure 13.1](images/step1.png)

Como puedes ver, lo que hemos conseguido es esto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
[<Post: My second post>, <Post: My first post>]
```

Esto significa que Django lo entiende como una lista de objetos. ¿Recuerdas de __Introducción a Python__ cómo podemos mostrar listas? Sí, ¡con bucles for! En una plantilla de Django se hacen así:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Prueba esto en tu plantilla.

![Figure 13.2](images/step2.png)

¡Funciona! Pero queremos que se muestren como las entradas de blog estáticas que creamos anteriormente en el capítulo de __Introducción a HTML__. Puedes mezclar HTML y etiquetas de plantilla. Nuestro `body` se verá así:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```  

{% raw %}Todo lo que pongas entre `{% for %}` y `{% endfor %}` se repetirá para cada objeto de la lista. Refresca la página:{% endraw %}

![Figure 13.3](images/step3.png)

¿Has notado que utilizamos una notación diferente esta vez `{{ post.title }}` o `{{ post.text }}`? Estamos accediendo a los datos en cada uno de los campos definidos en nuestro modelo `Post`. También el `|linebreaks` está pasando el texto de las entradas a través de un filtro para convertir saltos de línea en párrafos.

## Una cosa más

Sería bueno ver si tu sitio web seguirá funcionando en la Internet pública, ¿no? Vamos a intentar desplegar de nuevo en PythonAnywhere. Aquí va un resumen de los pasos...

* Primero, sube tu código a Github

{% filename %}Terminal{% endfilename %}
```
$ git status
[...]
$ git add --all .
$ git status
[...]
$ git commit -m "Modified templates to display posts from database."
[...]
$ git push
```

* Luego, vuelve a entrar en [PythonAnywhere][4] y ve a tu **consola Bash** (o inicia una nueva), y ejecuta:

{% filename %}Terminal{% endfilename %}
```
$ cd my-first-blog
$ git pull
[...]
```

* Finalmente, ve a la [pestaña Web](https://www.pythonanywhere.com/web_app_setup/) y presiona **Reload** en tu aplicación web. ¡Tu actualización debería verse! Si las entradas en tu sitio web de PythonAnywhere no coinciden con las entradas del blog de tu servidor local, está bien. La base de datos de tu computadora local y la de PythonAnywhere no se sincronizan con el resto de tus archivos.


¡Felicidades! Ahora sigue adelante y trata de agregar una nueva entrada usando el panel de administrador de Django (¡recuerda agregar `published_date`!). Asegúrate de estar en el Django Admin de tu sitio de PythonAnywhere, https://yourname.pythonanywhere.com/admin. Luego actualiza tu página para ver si aparece tu nuevo post.

¿Funciona de maravilla? ¡Estamos orgullosas! Aléjate un rato del ordenador, te has ganado un descanso. :)

![Figure 13.4](images/donut.png)
