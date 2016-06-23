# Plantillas de Django

¡Es hora de mostrar algunos datos! Django nos provee las útiles **template tags** para ello.

## ¿Qué son las template tags?

Verás, en HTML no puedes realmente poner código Python, porque los navegadores no lo entienden. Ellos sólo saben HTML. Sabemos que HTML es algo estático, mientras que Python es mucho más dinámico.

**Django template tags** nos permiten transferir cosas de Python como cosas en HTML, así que tu puedes construir sitios web dinámicos más rápido y fácil.

## Mostrar la plantilla post list

En el capítulo anterior dimos a nuestra plantilla una lista de posts en la variable `posts`. Ahora lo mostraremos en HTML.

Para imprimir una variable en una plantilla de Django, utilizamos llaves dobles con el nombre de la variable dentro, así:

``` html
    {{ posts }}
```    

Prueba esto en tu plantilla `blog/templates/blog/post_list.html` (reemplaza el segundo y el tercer par de etiquetas `<div></div>` con la línea `{{ posts }}`), guarda el archivo y actualiza la página para ver los resultados:

![Figura 13.1][1]

 [1]: images/step1.png

Como puedes ver, todo lo que obtenemos es esto:

    [<Post: Mi segundo post>, <Post: Mi primer post>]
    

Esto significa que Django lo entiende como una lista de objetos. ¿Recuerdas de **Introducción a Python** cómo podemos mostrar listas? Sí, ¡con los ciclos for! En una plantilla de Django, lo haces de esta manera:

``` html
    {% for post in posts %}
        {{ post }}
    {% endfor %}
``` 

Prueba esto en tu plantilla.

![Figura 13.2][2]

 [2]: images/step2.png

¡Funciona! Pero queremos que se muestren como los posts estáticos que creamos anteriormente en el capítulo de **Introducción a HTML**. Puedes mezclar HTML y template tags. Nuestro `body` se verá así:

``` html
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

Todo lo que pones entre `{% for %}` y `{% endfor %}` se repetirá para cada objeto en la lista. Actualiza tu página:

![Figura 13.3][3]

 [3]: images/step3.png

¿Has notado que utilizamos una notación diferente esta vez `{{ post.title }}` o `{{ post.text }}`? Estamos accediendo a datos en cada uno de los campos definidos en nuestro modelo `Post`. También el `|linebreaksbr` está dirigiendo el texto de los posts a través de un filtro para convertir saltos de línea en párrafos.

## Una cosa más

Sería bueno ver si tu sitio web seguirá funcionando en la Internet pública, ¿verdad? Intentemos desplegándola en PythonAnywhere nuevamente. Aquí te dejamos un ayuda memoria...

*   Primero, sube tu código a GitHub

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

*   Luego, identifícate en [PythonAnywhere][4] y ve a tu **consola Bash** (o empieza una nueva), y ejecuta:

```
$ cd my-first-blog
$ git pull
[...]
```

*   Finalmente, ve a la [pestaña Web][5] y presiona **Reload** en tu aplicación web. ¡Tu actualización debería poder verse!

 [4]: https://www.pythonanywhere.com/consoles/
 [5]: https://www.pythonanywhere.com/web_app_setup/

¡Felicidades! Ahora sigue adelante, trata de agregar un nuevo post usando el panel de administrador de Django (¡recuerda añadir published_date!) y luego actualiza tu página para ver si aparece tu nuevo post.

¿Funciona como un encanto? ¡Estamos orgullosos! Aléjate de tu computadora por un rato, te has ganado un descanso. :)

![Figura 13.4][6]

 [6]: images/donut.png
