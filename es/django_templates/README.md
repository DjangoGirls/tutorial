# Plantillas de Django

Es hora de mostrar algunos datos! Django nos da algo de ayuda, construyendo **template tags** para ello.

## ¿Qué son las etiquetas de plantilla?

Verás en HTML, no puedes realmente poner código Python, porque los navegadores no lo entienden. Ellos sólo saben HTML. Sabemos que HTML es algo estático, mientras que Python es mucho más dinámico.

**Etiquetas de plantilla Django** nos permiten transferir Python-como cosas en HTML, así que usted puede construir sitios web dinámicos más rápido y fácil. ¡ Huy!

## Plantillas de listas de Post

En el capítulo anteriordimos a nuestra plantilla una lista de posts en la variable `posts`. Ahora lo mostraremos en HTML.

Para imprimir una variable en la plantilla de Django, utilizamos llaves dobles con el nombre de la variable dentro, así:

    {{ posts }}
    

Prueba esto en tu plantilla `blog/templates/blog/post_list.html` (reemplaza todo entre la segunda etiqueta `<div></div>` con `{{ posts }}`), guarda el archivo y actualiza la página para ver el resultado:

![Figura 13.1][1]

 [1]: images/step1.png

Como puedes ver, todo lo que obtenemos es esto:

    [< post: mi segundo post >, < Post: mi primer post >]
    

Esto significa que Django lo entiende como una lista de objetos. ¿Recuerdas de **Introducción a Python,** ¿cómo podemos mostrar listas? Sí, con el ciclo for! En una plantilla de Django, los haces de esta manera:

    {% for post in posts %} {{ post }}{% endfor %}
    

Pruebe esto en tu plantilla.

![Figura 13.2][2]

 [2]: images/step2.png

¡ Funciona! Pero queremos que se muestre como los posts estáticos que creamos anteriormente en el capítulo de **Introducción a HTML**. Usted puede mezclar HTML y etiquetas de plantilla. Nuestro `body` se verá así:

    < div >< h1 >< a href = "/" > Django chicas Blog < /a >< / h1 >< / div >{% for post in posts %} < div >< p > publicado: {{ post.published_date }} < /p >< h1 >< a href = "" >{{ post.title }} < /a >< / h1 >< p >{{ post.text|linebreaks }} < /p >< / div >{% endfor %}
    

Todo lo que pones entre `{% for %}` y `{% endfor %}` se repetirá para cada objeto en la lista. Actualizar la página:

![Figura 13.3][3]

 [3]: images/step3.png

¿Has notado que utilizamos una notación diferente esta vez `{{ post.title }}` o `{{ post.text }}`? Estamos accediendo a datos en cada uno de los campos definidos en nuestro modelo `Post`. También el `|linebreaks` es un filtro para convertir saltos de línea en los párrafos.

## Una cosa más

Sería bueno ver si tu sitio sigue funcionando en Heroku, ¿no? Intentemos implementarlo nuevamente. Si olvidaste como hacerlo, revisa el final del capítulo 15:

    $ git status
    ...
    $ git add -A .
    $ git status
    ...
    $ git commit -m "Used Django templates instead of static HTML."
    ...
    $ git push heroku master
    

¡ Felicidades! Ahora seguir adelante y trata de agregar un nuevo post en tu administración de Django (recuerde añadir published_date!), luego actualizar lau página para ver si aparece el nuevo post.

¿Funciona como un encanto?. Estamos orgullosos! Regálate algo dulce, te lo has ganado :)

![Figura 13.4][4]

 [4]: images/donut.png