# CSS - ¡Hazlo bonito!

Nuestro blog todavía se ve bastante feo, ¿verdad? ¡Es hora de hacerlo bonito! Vamos a usar CSS para eso.

## ¿Qué es CSS?

CSS ('Cascading Style Sheets', que significa 'hojas de estilo en cascada') es un lenguaje utilizado para describir el aspecto y el formato de un sitio web escrito en lenguaje de marcado (como HTML). Trátalo como maquillaje para nuestra página web ;).

Pero no queremos empezar de cero otra vez, ¿verdad? Una vez más, usaremos algo que ya ha sido hecho por programadores y publicado en Internet de forma gratuita. Ya sabes, reinventar la rueda no es divertido.

## ¡Vamos a usar Bootstrap!

Bootstrap es uno de los frameworks de HTML y CSS mas populares para desarrollar sitios bonitos: http://getbootstrap.com/

Fue escrito por programadores que trabajaban para Twitter y ahora está siendo desarrollado por voluntarios de todo el mundo.

## Instalar Bootstrap

Para instalar Bootstrap, tienes que agregar esto al `<head>` en tu archivo `.html`:


{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Esto no agrega archivos a tu proyecto, sólo hace referencia a archivos que existen en internet. Adelante, abre tu sitio y actualiza la página. ¡Ahí lo tienes!

![Figure 14.1](images/bootstrap1.png)

¡Se ve mucho mejor!

## Archivos estáticos en Django

Finalmente nos vamos a fijar en estas cosas que hemos estado llamando __archivos estáticos__. Los ficheros estáticos son todos tus CSS e imágenes; ficheros que no son dinámicos, por lo que su contenido no depende del contexto de la petición y serán iguales para todos los usuarios.


### Dónde poner los archivos estáticos para Django

Django ya sabe dónde encontrar los archivos estáticos para la aplicación "admin". Ahora necesitamos agregar algunos archivos estáticos para nuestra propia aplicación, `blog`.

Hacemos esto creando una carpeta llamada `static` dentro de la estructura de la aplicación que llamamos blog:

```
djangogirls
├── blog
│   ├── migrations
│   └── static
└── mysite
```

Django encontrará automáticamente cualquier carpeta que se llame "static" dentro de las carpetas de tus aplicaciones y podrá utilizar su contenido como archivos estáticos.


## ¡Tu primer archivo CSS!

Ahora creemos un archivo CSS para agregar tu propio estilo a tu página web. Crea un nuevo directorio llamado `css` dentro de tu directorio `static`. Después crea un nuevo archivo llamado `blog.css` dentro de este directorio `css`. ¿Lista?

```
djangogirls
└─── blog
     └─── static
          └─── css
               └─── blog.css
```

¡Es hora de escribir algo de CSS! Abre el archivo `blog/static/css/blog.css` en tu editor de código.

No nos adentraremos mucho en la personalización y aprendizaje sobre CSS aquí. Es muy fácil y lo puedes aprender por tu cuenta después de este taller. Hay una recomendación sobre un curso gratuito para aprender más al final de esta página.

Pero vamos a hacer un poco al menos. ¿Tal vez podríamos cambiar el color de nuestro título? Las computadoras utilizan códigos especiales para entender los colores. Estos códigos empiezan con `#` y les siguen 6 letras (A-F) y números (0-9). Por ejemplo, el color azúl es `#0000FF`. Puedes encontrar esto códigos para muchos colores aquí: http://www.colorpicker.com/. También puedes utilizar [colores predefinidos](http://www.w3schools.com/colors/colors_names.asp) utilizando su nombre en inglés, como `red` y `green`.

En tu archivo `blog/static/css/blog.css` deberías agregar el siguiente código:

{% filename %}blog/static/css/blog.css{% endfilename %}
```css
h1 a {
    color: #FCA205;
}
```

`h1 a` es un selector CSS. Esto significa que estamos aplicando nuestros estilos a cualquier elemento `a` dentro de un elemento `h1` (por ejemplo cuando tenemos en código como: `<h1><a href="">link</a></h1>`). En este caso le estamos diciendo que cambie el color a `#FCA205`, que es naranja. Por supuesto, ¡puedes poner tu propio color aquí!

En el archivo CSS se definen los estilos de los elementos que se encuentran en el archivo HTML. Los elementos se identifican por el nombre del elemento (por ejemplo `a`. `h1`, `body`), el atributo `class` o el atributo `id`. "class" y "id" son nombres que le asignas tú misma al elemento. Las "class" definen grupos de elementos y los "id" apuntan a elementos específicos. Por ejemplo, la siguiente etiqueta puede identificarse mediante CSS usando el nombre de etiqueta `a`, la clase `external_link` o el id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Puedes leer más sobre [selectores de CSS en w3schools](http://www.w3schools.com/cssref/css_selectors.asp)

También necesitamos decirle a nuestra plantilla HTML que hemos agregado algunos CSS. Abre el archivo `blog/templates/blog/post_list.html` y agrega esta línea al principio del todo:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{% load staticfiles %}
```

Aquí sólo estamos cargando archivos estáticos :). Luego, entre las etiquetas `<head>` y `</head>`, después de los enlaces a los archivos CSS de Bootstrap, agrega la siguiente línea:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```
El navegador lee los archivos en el orden que aparecen, de ese modo el código en nuestro archivo puede sobrescribir el código en los archivos de Bootstrap. Le acabamos de decir a nuestra plantilla dónde se encuentra nuestro archivo CSS.

Ahora tu archivo se debe ver así:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{% load staticfiles %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
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
                <p>{{ post.text|linebreaksbr }}</p>
            </div>
        {% endfor %}
    </body>
</html>
```

De acuerdo, ¡guarda el archivo y actualiza el sitio!

![Figure 14.2](images/color2.png)

¡Buen trabajo! ¿Tal vez nos gustaría también dar un poco de aire a nuestro sitio web y aumentar el margen en el lado izquierdo?. ¡Vamos a intentarlo!

{% filename %}blog/static/css/blog.css{% endfilename %}
```css
body {
    padding-left: 15px;
}
```  

Agrega esto a tu CSS, guarda el archivo y ¡mira cómo funciona!

![Figure 14.3](images/margin2.png)


¿Quizá podríamos personalizar la tipografía del título? Pega esto en la sección `<head>` del archivo `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Como antes, comprueba el orden y ubícalo antes del link al archivo `blog/static/css/blog.css`. Esta línea va a importar una tipografía llamada *Lobster* desde Google Fonts (https://www.google.com/fonts).

Busca la declaración `h1 a` (el código entre llaves `{` y `}`) en el archivo CSS `blog/static/css/blog.css`. Ahora agrega la línea `font-family: 'Lobster';` entre las llaves y refresca la página:

{% filename %}blog/static/css/blog.css{% endfilename %}
```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

![Figure 14.3](images/font.png)

¡Genial!

Como mencionamos anteriormente, CSS tiene un concepto de clases que básicamente permite nombrar una parte del código HTML y aplicar estilos sólo a esta parte, sin afectar a otras. ¡Esto puede ser muy útil!. Quizás tienes dos divs que hacen algo diferente (como el encabezado y el post). Una clase (`class`) puede ayudarte a hacer que se vean diferente.

Adelante, nombra algunas partes del código HTML. Agrega una clase llamada `page-header` a tu `div` que contiene el encabezado, así:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

Y ahora agrega la clase `post` a tu `div` que contiene una entrada del blog.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Ahora agregaremos bloques de declaración a diferentes selectores. Los selectores que comienzan con `.` hacen referencia a clases. Hay muchos tutoriales geniales y explicaciones sobre CSS en la Web para ayudarte a entender el siguiente código. Por ahora, simplemente copia y pega este bloque de código en tu archivo `blog/static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}
```css
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
```

Luego envuelve el código HTML que muestra los posts con declaraciones de clases. Reemplaza esto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

en  el archivo`blog/templates/blog/post_list.html` por esto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        <p>published: {{ post.published_date }}</p>
                    </div>
                    <h1><a href="">{{ post.title }}</a></h1>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```   

Guarda estos archivos y actualiza tu sitio.

![Figure 14.4](images/final.png)


¡Woohoo! Se ve genial, ¿verdad? Mira el código código que acabamos y busca los lugares dónde hemos agregado clases en el HTML y úsalas en el CSS. ¿Qué cambio deberías hacer para que la fecha se vea en turquesa?

No tengas miedo de jugar un poco con este CSS e intentar cambiar algunas cosas. Jugar con el código CSS te puede ayudar a entender qué hacen las diferentes cosas. Si rompes algo, no te preocupes, ¡siempre puedes deshacerlo!

Recomendamos encarecidamente que hagas este [Curso de HTML & CSS de Codeacademy](https://www.codecademy.com/tracks/web) gratuito y online. Te puede ayudar a aprender todo lo que necesitas saber para hacer tus sitios web más bonitos con CSS.

¡¿Lista para el siguiente capítulo?! :)
