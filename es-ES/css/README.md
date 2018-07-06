# CSS - ¡Hazlo verse bien!

Nuestro blog todavía se ve bastante feo, ¿verdad? ¡Es hora de hacerlo bonito! Vamos a usar CSS para eso.

## ¿Qué es CSS?

Las hojas de estilos en cascada (CSS por sus siglas en ingles) es un lenguaje usado para describir la apariencia de una página web escrita en un lenguaje de marcado (como HTML). Míralo como un maquillaje para nuestra página web ;)

Pero no queremos empezar de cero otra vez, ¿verdad? Una vez más, vamos a usar algo que los programadores publicaron en Internet. Sabes, reinventar la rueda no es divertido.

## ¡Vamos a usar Bootstrap!

Bootstrap es uno de los frameworks mas populares de HTML y CSS para desarrollar para sitios atractivos: https://getbootstrap.com/

Fue escrito por programadores que trabajaban para Twitter. ¡Ahora está siendo desarrollado por voluntarios de todo el mundo!

## Instalar Bootstrap

Para instalar Bootstrap, tienes que añadir esto a tu `<head>` tu archivo `.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Esto no añade ficheros a tu proyecto. Tan solo apunta a archivos que existen en la web. Sigue adelante, abre tu sitio web y actualiza la página. ¡Ahí lo tienes!

![Figure 14.1](images/bootstrap1.png)

¡Se ve mucho mejor!

## Archivos estáticos en Django

Finalmente nos vamos a fijar en estas cosas que hemos estado llamando **archivos estáticos**. Los archivos estáticos son todos tus CSS e imágenes. Su contenido no depende del contexto de la solicitud y será el mismo para todos los usuarios.

### ¿Dónde poner los archivos estáticos para Django

Django ya sabe donde encontrar los archivos estáticos dentro de la aplicación "admin" integrada. Ahora solo tenemos que añadir algunos de estos archivos estáticos a nuestro `blog`.

Hacemos esto creando una carpeta llamada `static` dentro de la estructura de la aplicación que llamamos blog:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django automáticamente buscará cualquier carpeta nombrada "static" que esté dentro de cualquiera de las carpetas de tus aplicaciones para usar su contenido como archivos estáticos.

## ¡Tu primer archivo CSS!

Creamos un archivo CSS, para añadir tu propio estilo a la página. Crea una nueva carpeta llamada `css` dentro de tu carpeta `static`. Luego, crea un nuevo archivo llamado `blog.css` dentro de la carpeta `css`. ¿Listo?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

¡Es hora de escribir algo de CSS! Abre el archivo `blog/static/css/blog.css` en tu editor de código.

No vamos a profundizar demasiado en cómo personalizar y aprender CSS aquí. Hay recomendación para un curso CSS gratuito al final de esta página por si quieres conocer más.

Pero vamos a hacer al menos algo. ¿Tal vez podríamos cambiar el color de nuestro título? Los ordenadores utilizan códigos especiales para entender los colores. Estos códigos empiezan con `#` seguidos por 6 letras (A-F) y números (0-9). Por ejemplo, el código del color azul es `#0000FF`. Puedes encontrar los códigos para muchos colores aquí: http://www.colorpicker.com/ y en otras páginas web. También puedes utilizar [colores predefinidos](http://www.w3schools.com/colors/colors_names.asp) utilizando su nombre en inglés, como `red` y `green`.

En tu archivo `blog/static/css/blog.css` deberías agregar el siguiente código:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
}
```

`h1 a` es un selector CSS. Este selector significa que aplicamos nuestros estilos a cualquier elemento dentro de un elemento `h1`. Así, cuando tenemos algo como `<h1><a href="">link</a></h1>`, el estilo `h1 a` será aplicado. En este caso le estamos diciendo que cambie el color a `#FCA205`, que es naranja. Por supuesto, ¡puedes poner tu propio color aquí!

En el archivo CSS se definen los estilos de los elementos que se encuentran en el archivo HTML. La primera manera de identificar los elementos será por sus nombres. Puede que te acuerdes de estos selectores de la sección sobre HTML. Cosas como `a`, `h1`, y `body` son algunos ejemplos de los nombres que se pueden usar como selectores. También podemos identificar elementos por atributos como `class` o clase, y `id`. "class" y "id" son nombres que le asignas tú mismo al elemento. Las "class" definen grupos de elementos y los "id" apuntan a elementos específicos. Por ejemplo, podrías identificar esta etiqueta por su selector `a`, por la "class" `external_link`, o el "id" `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Puedes leer mas acerca de [Selectores de CSS en w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

También tenemos que decirle a nuestra plantilla HTML que añadimos algo de CSS. Abre el archivo `blog/templates/blog/post_list.html` y añade esta línea al inicio de todo:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

Aquí solo estamos cargando archivos estáticos. :) Entre las etiquetas `<head>` y `</head>`, después de los enlaces a los archivos CSS de Bootstrap, añade esta línea:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

El navegador lee los archivos en el orden que le son dados, por lo que debemos asegurarnos de que está en el lugar correcto. De lo contrario, el código en nuestro archivo podría ser reemplazado por código en nuestros archivos Bootstrap. Le acabamos de decir a nuestra plantilla dónde se encuentra nuestro archivo CSS.

Ahora tu archivo debe tener este aspecto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
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

![Figura 14.2](images/color2.png)

¡Buen trabajo! ¿Tal vez nos gustaría también dar un poco de aire a nuestro sitio web y aumentar el margen en el lado izquierdo?. ¡Vamos a intentarlo!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Añade esto a tu CSS, guarda el archivo y ¡mira cómo funciona!

![Figura 14.3](images/margin2.png)

¿Quizá podríamos personalizar la tipografía del título? Pega esto en la sección `<head>` del archivo `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Como antes, revisa el orden y pon antes del enlace a `blog/static/css/blog.css`. Esta línea importará un estilo de letra llamada *Lobster* de Google Fonts (https://www.google.com/fonts).

Encuentra el bloque de declaración (el código entre las llaves `{` y `}`) `h1 a` en el archivo CSS `blog/static/css/blog.css`. Ahora añade la línea `font-family: 'Lobster';` entre las llaves y actualiza la página:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

![Figura 14.3](images/font.png)

¡Genial!

Como se mencionó anteriormente, CSS tiene un concepto de clases. Éstas te permiten nombrar parte del código HTML y aplicar estilos solo a esta parte, sin afectar las otras. ¡Esto puede ser súper útil! Quizá tienes dos divs haciendo algo diferente (como el encabezado y tu publicación). Una clase puede ayudarte a hacerlos verse distintos.

Adelante, nombra algunas partes del código HTML. Añade una clase llamada `page-header` a tu `div` que contiene el encabezado, así:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

Y ahora añade una clase `post` a tu `div` que contiene una entrada del blog.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Ahora añadiremos bloques de declaración a diferentes selectores. Los selectores que comienzan con `.` hacen referencia a clases. Hay muchos tutoriales y explicaciones excelentes acerca de CSS en la Web que te pueden ayudar a entender el código a continuación. Por ahora, simplemente copia y pega este bloque de código en tu archivo `blog/static/css/blog.css`:

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
```

Luego envuelve el código HTML que muestra los posts con declaraciones de clases. Cambia esto:

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

en `blog/templates/blog/post_list.html` con esto:

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

![Figura 14.4](images/final.png)

¡Woohoo! Se ve bien, ¿Verdad? Mira el código que acabamos de pegar para encontrar los lugares donde agregamos clases en el HTML y las usamos en el CSS. ¿Dónde harías el cambio si quisieras que la fecha fuera color turquesa?

No tengas miedo a experimentar con este CSS un poco y tratar de cambiar algunas cosas. Jugar con el CSS te puede ayudar a entrenar lo que hacen las distintas secciones. Si algo deja de funcionar, no te preocupes, siempre puedes deshacerlo!

Realmente recomendamos tomar este [curso HTML y CSS codecademy](https://www.codecademy.com/tracks/web). Puede ayudarte a aprender todo lo que necesitas para hacer tus websites más hermosos con CSS.

¡¿Listo para el siguiente capítulo?! :)