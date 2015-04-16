# CSS - ¡Hazlo bonito!

Nuestro blog todavia se ve bastante feo, verdad? Es hora de hacerlo bonito! Vamos a usar CSS para eso.

## ¿Qué es CSS?

CSS ('Cascading Style Sheets', que significa 'hojas de estilo en cascada') es un lenguaje utilizado para describir el aspecto y el formato de un sitio web escrito en lenguaje de marcado (como HTML). Trátalo como maquillaje para nuestra página web ;).

Pero no queremos empezar de cero otra vez, ¿verdad? Una vez más, usaremos algo que ya ha sido realizado por programadores y publicado en Internet de forma gratuita. Reinventar la rueda no es divertido, ¿Sabes?

## ¡Vamos a usar Bootstrap!

Bootstrap es una de las herramientas (framework) HTML y CSS más populares para desarrollar webs bonitas: http://getbootstrap.com/

Fue escrito por programadores que trabajaban para Twitter y ahora colaboran en él desarrolladores voluntarios de todo el mundo.

## Instalar Bootstrap

Para instalar Bootstrap, tienes que añadir esto al `< head >` en el archivo `.html` (`blog/templates/blog/post_list.html`):

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    

Esa línea no incluye ningún fichero a tu proyecto, simplemente utiliza uno existente en internet. Adelante, abre tu página web y actualízala. ¡Ahí lo tienes!

![Figure 14.1][1]

 [1]: images/bootstrap1.png

¡Se ve mucho mejor!

## Archivos estáticos en Django

Otra cosa que aprenderás hoy se llama **archivos estáticos**. Las paginas estáticas son todo tu CSS e imágenes -- archivos que no son dinámicos, es decir, su contenido no depende del contexto de la petición y será el mismo para todos los usuarios.

CSS es un fichero estatico, así que para reflejar las modificaciones que se realicen en CSS necesitamos primero configurar archivos estáticos en Django. Solo tendrás que hacerlo una vez. Empecemos:

### Configurar archivos estáticos en Django

En primer lugar, necesitamos crear un directorio para almacenar nuestros archivos estáticos. Adelante, crea un directorio llamado `static` dentro de tu directorio `djangogirls`.

    djangogirls
    ├─── static
    └─── manage.py
    

Abre el fichero `mysite/settings.py`, desplázate hasta el fondo del fichero y agregue las siguientes líneas:

    STATICFILES_DIRS = (
       os.path.join(BASE_DIR, "static"),
    )
    

De esta manera Django sabrá dónde encontrar los archivos estáticos.

## ¡Tu primer archivo CSS!

Vamos ahora a crear un fichero CSS para añadir tu propio estilo a tu página web. Crear un nuevo directorio llamado `css` dentro de tu directorio `static`. Crea un nuevo fichero llamado `blog.css` dentro de este directorio `css`. Listo?

    static
    └─── css
            blog.css
    

Hora de escribir CSS! Abra el archivo `static/css/blog.css` en el editor de código.

No nos adentraremos mucho en la personalización y aprendizaje sobre CSS aquí porque es muy fácil y lo puedes aprender por tu cuenta después de este taller. Recomendamos enormemente hacer este [curso de HTML y CSS en Codecademy][2] para aprender todo lo que necesitas saber sobre cómo hacer tus sitios web más bonitos con CSS.

 [2]: http://www.codecademy.com/tracks/web

Pero vamos a hacer un poco al menos. ¿Tal vez podríamos cambiar el color de nuestro titulo? Para entender los colores, las computadoras utilizan códigos especiales. Empiezan con `#` y siguen con 6 letras (A-F) y números (0-9). Puedes encontrar los códigos de color, por ejemplo, aquí: http://www.colorpicker.com/. También puedes utilizar [colores predefinidos][3], tales como `rojo` y `verde`.

 [3]: http://www.w3schools.com/cssref/css_colornames.asp

En el fichero `static/css/blog.css` debes añadir el siguiente código:

    h1 a {
        color: #FCA205;
    }
    

`h1 un` es un Selector de CSS. Esto significa que estamos aplicando nuestros estilos a `cualquier elemento dentro de un elemento <code>h1`</code> (por ejemplo cuando tenemos en código algo como: `< h1 >< a href = "" > enlace < /a >< / h1 >`). En este caso, estamos diciendo que cambie su color a `#FCA205`, que es de color naranja. Por supuesto, puedes poner tu propio color aquí!

En el fichero CSS se definen los estilos de los elementos que se encuentran en el fichero HTML. Los elementos se identifican por el nombre del elemento (es decir, `a` `h1`, `body`), el atributo `class` o el atributo `id`. Class y id son nombres que le das al elemento tu mismo. Classes definen grupos de elementos y ids apuntan a elementos específicos. Por ejemplo, la siguiente etiqueta puede identificarse mediante CSS usando el nombre `a`, la clase `external_link` o el id `link_to_wiki_page`:

    <a href="http://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
    

Leer sobre [Selectores de CSS en w3schools][4].

 [4]: http://www.w3schools.com/cssref/css_selectors.asp

Entonces, necesitamos decirle a nuestra plantilla HTML que hemos añadido CSS. Abra el fichero `blog/templates/blog/post_list.html` y añade esta línea al principio:

```
    {% load staticfiles %}
```    

Estamos cargando archivos estáticos aquí:). Luego, entre el `< head >` `y/< / head >`, después de los enlaces a los archivos CSS Bootstrap (el navegador lee los archivos en el orden que los das, así que nuestro archivo de código puede sobreescribir partes del código en de Bootstrap), añade la siguiente línea:

    <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    

Le acabamos de decir a nuestra plantilla donde se encuentra nuestro archivo CSS.

Tu archivo ahora debe verse así:

    {% load staticfiles %}
    <html>
        <head>
            <title>Django Girls blog</title>
            <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
            <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
            <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
            <link rel="stylesheet" href="{% static 'css/blog.css' %}">
        </head>
        <body>
            <div>
                <h1><a href="/">Django Girls Blog</a></h1>
            </div>
    
            {% for post in posts %}
                <div>
                    <p>published: {{ post.published_date }}</p>
                    <h1><a href="">{{ post.title }}</a></h1>
                    <p>{{ post.text|linebreaks }}</p>
                </div>
            {% endfor %}
        </body>
    </html>
    

OK, guarde el archivo y actualiza el sitio!

![Figure 14.2][5]

 [5]: images/color2.png

¡ Buen trabajo! Tal vez también nos gustaría dar un poco de aire a nuestro sitio web y aumentar el margen en el lado izquierdo. Vamos a intentarlo!

    body {
        padding-left: 15px;
    }
    

Añade esto a tu CSS, guarda el archivo y mira cómo funciona!

![Figure 14.3][6]

 [6]: images/margin2.png

¿Tal vez podemos personalizar la tipografía en nuestra cabecera? Pegue esto en `< head >` del archivo `blog/templates/blog/post_list.html`:

    <link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
    

Esta línea va a importar una tipografía llamada *Lobster* de Google Fonts (https://www.google.com/fonts).

Ahora agrega la linea `font-family: 'Lobster';` en el archivo CSS `static/css/blog.css` dentro del bloque `h1 a` (el codigo entre las llaves `{` and `}`) y actualiza la página:

    h1 a {
        color: #FCA205;
        font-family: 'Lobster';
    }
    

![Figure 14.3][7]

 [7]: images/font.png

Genial!

Como se mencionó anteriormente, CSS tiene un concepto de clases, que básicamente permite nombrar una parte del código HTML y aplicarle estilos solo a esa parte, no afectara a los otros. Es super útil si tienes dos divs, pero están haciendo algo muy diferente (como tu header y tu post), así que no quieres que se vean de la misma forma.

Adelante! Nombra algunas partes del código HTML. Añade una clase llamada `page-header` a tu `div` que contiene el encabezado, así:

    <div class="page-header">
        <h1><a href="/">Django Girls Blog</a></h1>
    </div>
    

Y ahora añade la clase `post` a tu `div` que contiene una entrada del blog.

    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaks }}</p>
    </div>
    

Ahora añadiremos bloques de declaración a diferentes selectores. Selectores a partir de `.` se refieren a las clases. Hay muchos tutoriales y explicaciones sobre CSS en la web para ayudarte entender el siguiente codigo. Por ahora, sólo copia y pega en tu archivo `mysite/static/css/blog.css`:

    .page-header {
        background-color: #ff9400;
        margin-top: 0;
        padding: 20px 20px 20px 40px;
    }
    
    .page-header h1, .page-header h1 a, .page-header h1 a:visited, .page-header h1 a:active {
        color: #ffffff;
        font-size: 36pt;
        text-decoration: none;
    }
    
    .content {
        margin-left: 40px;
    }
    
    h1, h2, h3, h4 {
        font-family: 'Lobster', cursive;
    }
    
    .date {
        float: right;
        color: #828282;
    }
    
    .save {
        float: right;
    }
    
    .post-form textarea, .post-form input {
        width: 100%;
    }
    
    .top-menu, .top-menu:hover, .top-menu:visited {
        color: #ffffff;
        float: right;
        font-size: 26pt;
        margin-right: 20px;
    }
    
    .post {
        margin-bottom: 70px;
    }
    
    .post h1 a, .post h1 a:visited {
        color: #000000;
    }
    

Luego envuelve el código HTML que muestra los mensajes con las declaraciones de clases. Cambia esto:

    {% for post in posts %}
        <div class="post">
            <p>published: {{ post.published_date }}</p>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaks }}</p>
        </div>
    {% endfor %}
    

En `blog/templates/blog/post_list.html` con esto:

    <div class="content container">
        <div class="row">
            <div class="col-md-8">
                {% for post in posts %}
                    <div class="post">
                        <div class="date">
                            {{ post.published_date }}
                        </div>
                        <h1><a href="">{{ post.title }}</a></h1>
                        <p>{{ post.text|linebreaks }}</p>
                    </div>
                {% endfor %}
            </div>
        </div>
    </div>
    

Guarda los archivos y actualiza tu sitio.

![Figure 14.4][8]

 [8]: images/final.png

Woohoo! Parece increíble, ¿verdad? El codigo que acabamos de pegar no es tan difícil de entender y debes de ser capaz de entender la mayoría sólo con leerlo.

No tengas miedo de jugar un poco con este CSS e intentar cambiar algunas cosas. Si rompes algo, no te preocupes, siempre puedes deshacerlo!

De todos modos, recomendamos que realices el curso curso gratuito [Codeacademy HTML & CSS][2] como tarea que para aprendas todo lo que necesitas acerca de hacer tus sitios web bonitos con CSS.

¡¿Lista para el siguiente capítulo?! :)