# CSS - Hazlo bonito!

Nuestro blog todavia se ve bastante feo, verdad? Es hora de hacerlo bonito! Vamos a usar CSS para eso.

## ¿Qué es CSS?

Hojas de estilo en cascada (CSS) es un lenguaje utilizado para describir el aspecto y el formato de un sitio web escrito en lenguaje de marcado (como HTML). Trátelo como maquillaje para nuestra página web ;).

Pero no queremos empezar de cero otra vez, ¿verdad? Una vez más, usamos algo que ya ha sido hecho por programadores y publicado en Internet de forma gratuita. Ya sabes, reinventar la rueda no es divertido.

## ¡Vamos a usar Bootstrap!

Bootstrap es una de las infraestructuras digitales mas populares para hacer paginas web bonitas: http://getbootstrap.com/

Fue escrito por programadores que trabajaron para Twitter y ahora es desarrollado por voluntarios en todo el mundo.

## Instalar Bootstrap

Para instalar Bootstrap, tienes que añadir esto al `< head >` en el archivo `.html` (`blog/templates/blog/post_list.html`):

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    

Esto no añade los archivos a su proyecto. Sólo apunta a los archivos que existen en internet. Adelante, abra su sitio de Internet, actualice la página. ¡ Aquí está!

![Figura 14.1][1]

 [1]: images/bootstrap1.png

¡Se ve mucho mejor!

## Archivos estáticos en Django

Otra cosa sobre la que ustedes aprenderán hoy se llama **archivos estáticos**. Las paginas estáticas son todo tu CSS e imágenes -- archivos que no son dinámicos entonces su contenido no depende de contexto de solicitud y sera el mismo para todos los usuarios.

CSS es un archivo estatico, así que para personalizar CSS necesitamos primero configurar archivos estáticos en Django. Solo tendrás que hacerlo una vez. Empecemos:

### Configurar archivos estáticos en Django

En primer lugar, necesitamos crear un directorio para almacenar nuestros archivos estáticos. Adelante, crea un directorio llamado `static` dentro de tu directorio `djangogirls`.

    djangogirls
    ├─── static
    └─── manage.py
    

Abrir el archivo `mysite/settings.py`, desplácese hasta el fondo del asunto y agregue las siguientes líneas:

    STATICFILES_DIRS = (
       os.path.join(BASE_DIR, "static"),
    )
    

De esta manera Django sabrá dónde encontrar los archivos estáticos.

## ¡Tu primer archivo CSS!

Vamos a crear un archivo CSS ahora, para agregar su propio estilo a tu página web. Crear un nuevo directorio llamado `css` dentro de tu directorio `static`. Crear un nuevo archivo llamado `blog.css` dentro de este directorio `css`. Listo?

    static
    └─── css
            blog.css
    

Hora de escribir CSS! Abra el archivo `static/css/blog.css` en el editor de código.

No iremos muy profundamente en la personalización y aprendizaje sobre CSS aquí, porque es muy fácil y lo puedes aprender por tu cuenta después de este taller. Realmente recomendamos hacer este [curso de HTML y CSS en Codecademy][2] para aprender todo lo que necesitas saber sobre cómo hacer tus sitios web más bonitos con CSS.

 [2]: http://www.codecademy.com/tracks/web

Pero vamos a hacer al menos un poco. ¿Tal vez podríamos cambiar el color de nuestro titulo? Para entender los colores, las computadoras utilizan códigos especiales. Empiezan con `#` y siguen con 6 letras (A-F) y números (0-9). Usted puede encontrar los códigos de color por ejemplo aquí: http://www.colorpicker.com/. También puede utilizar [colores predefinidos][3], tales como `rojo` y `verde`.

 [3]: http://www.w3schools.com/cssref/css_colornames.asp

En el archivo `static/css/blog.css` debe agregas el siguiente código:

    h1 a {
        color: #FCA205;
    }
    

`h1 un` es un Selector de CSS. Esto significa que estamos aplicando nuestros estilos a `cualquier elemento dentro de un elemento <code>h1`</code> (por ejemplo cuando tenemos en código algo como: `< h1 >< a href = "" > enlace < /a >< / h1 >`). En este caso, estamos diciendo que cambie su color a `#FCA205`, que es de color naranja. Por supuesto, usted puede poner su propio color aquí!

En un archivo CSS determinamos estilos para los elementos en el archivo HTML. Los elementos se identifican por el nombre del elemento (es decir, `a` `h1`, `body`), el atributo `class` o el atributo `id`. Class y id son nombres que le das al elemento tu mismo. Classes definen grupos de elementos y ids apuntan a elementos específicos. Por ejemplo, la siguiente etiqueta puede identificarse mediante CSS usando la etiqueta nombre `a`, la clase `external_link` o el id `link_to_wiki_page`:

    <a href="http://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
    

Leer sobre [Selectores de CSS en w3schools][4].

 [4]: http://www.w3schools.com/cssref/css_selectors.asp

Entonces, necesitamos decirle a nuestra plantilla HTML que hemos añadido CSS. Abra el archivo `blog/templates/blog/post_list.html` y agregue esta línea al principio:

    {% load staticfiles %}
    

Estamos cargando archivos estáticos aquí:). Luego, entre el `< head >` `y/< / head >`, después de los enlaces a los archivos CSS Bootstrap (el navegador lee los archivos en el orden que los das, así que nuestro archivo de código puede anular el código en los archivos de arranque), añade la siguiente línea:

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

![Figura 14.2][5]

 [5]: images/color2.png

¡ Buen trabajo! Tal vez también nos gustaría dar un poco de aire a nuestro sitio web y aumentar el margen en el lado izquierdo. Vamos a intentarlo!

    body {
        padding-left: 15px;
    }
    

Añade esto a tu CSS, guarda el archivo y ve cómo funciona!

![Figura 14.3][6]

 [6]: images/margin2.png

¿Tal vez podemos personalizar la tipografía en nuestra cabecera? Pegue esto en `< head >` del archivo `blog/templates/blog/post_list.html`:

    <link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
    

Esta línea va a importar una letra llamada *Lobster* de Google Fonts (https://www.google.com/fonts).

Ahora agrega la linea `font-family: 'Lobster';` en el archivo CSS `static/css/blog.css` dentro del bloque `h1 a` (el codigo entre las llaves `{` and `}`) y actualiza la página:

    h1 a {
        color: #FCA205;
        font-family: 'Lobster';
    }
    

![Figura 14.3][7]

 [7]: images/font.png

Genial!

Como se mencionó anteriormente, CSS tiene un concepto de clases, que básicamente permite nombrar una parte del código HTML y aplicarle estilos solo a esa parte, no afectara a los otros. Es super útil si tienes dos divs, pero están haciendo algo muy diferente (como tu header y tu post), así que no quieres que se vean de la misma.

Adelante y nombra algunas partes del código HTML. Agregar una clase llamada `page-header` a tu `div` que contiene el encabezado, así:

    <div class="page-header">
        <h1><a href="/">Django Girls Blog</a></h1>
    </div>
    

Y ahora agrega la clase `post` a tu `div` que contiene una entrada del blog.

    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaks }}</p>
    </div>
    

Ahora agregaremos bloques de declaración a diferentes selectores. Selectores a partir de `.` se refieren a las clases. Hay muchos tutoriales y explicaciones sobre CSS en la Web para ayudarte el siguiente codigo. Por ahora, sólo copia y pega en tu archivo `mysite/static/css/blog.css`:

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
    

Luego envuelve el código HTML que muestra los mensajes con las declaraciones de clases. Cambiar esto:

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

![Figura 14.4][8]

 [8]: images/final.png

Woohoo! Parece increíble, ¿verdad? El codigo que acabamos de pegar no es tan difícil de entender y tu debe ser capaz de entender la mayoría sólo con leerlo.

No tengas miedo de juguetear un poco con este CSS e intentar cambiar algunas cosas. Si rompes algo, no te preocupes, siempre puede deshacerlo!

De todos modos, recomendamos tomando este libre en línea [Codeacademy HTML & CSS course][2] como tarea que para aprendas todo lo que necesitas acerca de embellecer tus sitios web con CSS.

¡¿Listo para el próximo capítulo?! :)