# CSS - ¡Hazlo bonito!

Nuestro blog todavía luce bastante feo, ¿verdad? ¡Ya es tiempo de mejorarlo! Utilizaremos CSS para eso.

## ¿Qué es CSS?

El lenguaje CSS (las siglas en inglés de hojas de estilos en cascada, o Cascading Style Sheets), sirve para describir la apariencia y el formato de un sitio web escrito en un lenguaje de marcado (como HTML). Has de cuenta que es como aplicar maquillaje a nuestra página web. ;)

Pero no queremos empezar de cero otra vez, ¿verdad? Una vez más vamos a utilizar algo que otros programadores ya han publicaron gratis en internet. Reinventar la rueda todo el tiempo no es nada divertido.

## ¡Comenzemos a usar Bootstrap!

Bootstrap es uno de los frameworks de HTML y CSS mas populares para desarrollar para sitios web atractivos: https://getbootstrap.com/

Fue escrito por programadores que trabajaban en Twitter. ¡Ahora lo mantienen y desarrollan voluntarios de todo el mundo!

## Instala Bootstrap

Para instalar Bootstrap, abre tu fichero `.html` en el editor de código y añade esto a la sección `<head>`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Esto no añade ningún archivo a tu proyecto. Solo apunta a archivos que ya existen en Internet. Así que adelante, accede a tu sitio web y actualiza la página ¡Aquí la tienes!

![Figura 14.1](images/bootstrap1.png)

¡Ya luce mucho mejor!

## Archivos estáticos en Django

Finalmente vamos a mirar más de cerca esto que hemos estado llamando **archivos estáticos**. Los archivos estáticos son todas tus imágenes y archivos CSS. Su contenido no depende del contexto requerido y siempre será el mismo para cada usuario.

### Dónde poner los archivos estáticos para Django

Django ya sabe dónde encontrar los archivos estáticos para la incorporación de la aplicación "admin". Ahora necesitamos añadir los archivos estáticos de nuestra aplicación, `blog`.

Hacemos eso creando una carpeta llamada `static` dentro de la aplicación blog:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django automáticamente encontrará cualquier carpeta llamada "static" dentro de cualquiera de las carpetas de tus aplicaciones. Entonces va a ser posible usar su contenido como archivos estáticos.

## ¡Tu primer archivo CSS!

Vamos a crear un archivo CSS, para añadir tu propio estilo a la página. Crea un nuevo directorio llamado `css` dentro de la carpeta `static`. A continuación, crea un nuevo archivo llamado `blog.css` dentro de la carpeta `css`. ¿Listos?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

¡Vamos a escribir algo de CSS! Abre el archivo `blog/static/css/blog.css` en el editor de código.

No vamos a profundizar demasiado en cómo personalizar y aprender CSS. Pero te podemos recomendar un un curso gratuito de CSS al final de esta página por si quieres aprender más.

Pero vamos a hacer al menos un poco. ¿Quizas podamos cambiar el color de nuestros encabezados? Los ordenadores utilizan códigos especiales para expresar los colores. Estos códigos empiezan con `#` seguidos por 6 letras (A-F) y números (0-9). Por ejemplo, el código del color azul es `#0000FF`. Puedes encontrar los códigos de muchos colores aquí: http://www.colorpicker.com/ y en otras páginas web. También puedes utilizar [colores predefinidos](http://www.w3schools.com/colors/colors_names.asp) utilizando su nombre en inglés, como `red` y `green`.

En el archivo `blog/static/css/blog.css` deberías añadir el siguiente código:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
     color: #C25100;
}

```

`h1 a` es un selector CSS. Esto significa que estamos aplicando nuestros estilos a cualquier elemento de `a` dentro de un elemento de `h1`; el selector `h2 a` hace lo mismo para los elementos de `h2`. Así, cuando tenemos algo como `<h1><a href="">link</a></h1>`, se aplicará el estilo `h1 a`. En este caso, le estamos diciendo que cambie el color a un `#C25100`, que es un naranjo oscuro. O puedes poner tu propio color aqui, ¡pero asegurate que tenga un buen contraste contra un fondo blanco!

En un archivo CSS se definen los estilos de los elementos que aparecen en el archivo HTML. La primera forma de identificar los elementos es por su nombre. Puede que los recuerdes como 'tags' de la sección de HTML. Cosas como `a`, `h1`, y `body` son algunos ejemplos de nombres de elementos. También podemos identificar elementos por el atributo `class` o el atributo `id`. Los valores de "class" e "id" son nombres que das al elemento para poderlo identificar. Con el atributo "class" identificamos grupos de elementos del mismo tipo y con el atributo "id" identificamos un elemento específico. Por ejemplo, el siguiente elemento lo podrías identificar por su nombre de "tag" `a`, por su "class" `external_link`, o por su "id" `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Si quieres aprender más sobre los selectores CSS puedes consultar en [Selectores de CSS en w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

También necesitamos decirle a nuestra plantilla HTML que hemos añadido código CSS. Abre el archivo `blog/templates/blog/post_list.html` en el editor de código y añade esta línea al principio del todo:

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
                <h2><a href="">{{ post.title }}</a></h2>
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
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Figura 14.3](images/font.png)

¡Genial!

Como ya hemos dicho, CSS tiene un concepto de clases. Las clases te permiten dar un nombre a una parte del código HTML para aplicar estilos solo a esta parte, sin afectar a otras. ¡Esto puede ser súper útil! Quizá tienes dos divs haciendo algo diferente (como el encabezado y el texto de tu publicación). Las clases pueden ayudarte a asignarles estilos distintos.

Adelante, nombra algunas partes del código HTML. Añade una clase llamada `page-header` a tu `div` que contiene el encabezado, así:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

Y ahora añade una clase `post` a tu `div` que contiene una publicación del blog.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>publicado: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Ahora añadiremos bloques de declaración a varios selectores. Los selectores que comienzan con `.` hacen referencia a clases. Hay muchos tutoriales y explicaciones excelentes sobre CSS en la Web que te pueden ayudar a entender el código que sigue a continuación. Por ahora, copia y pega lo siguiente en tu archivo `blog/static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
.page-header {
    background-color: #C25100;
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

.post h2 a, .post h2 a:visited {
    color: #000000;
}
```

Luego rodea el código HTML que muestra los posts con declaraciones de clases. Cambia esto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <p>publicado: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

en `blog/templates/blog/post_list.html` por esto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        <p>publicado: {{ post.published_date }}</p>
                    </div>
                    <h2><a href="">{{ post.title }}</a></h2>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

Guarda estos archivos y recarga tu sitio.

![Figura 14.4](images/final.png)

¡Woohoo! Queda genial, ¿Verdad? Mira el código que acabamos de pegar para encontrar los lugares donde añadimos clases en el HTML y las usamos en el CSS. ¿Qué cambiarías si quisieras que la fecha fuera color turquesa?

No tengas miedo a experimentar con este CSS un poco y tratar de cambiar algunas cosas. Jugar con el CSS te puede ayudar a entender lo que hacen las distintas secciones. Si algo deja de funcionar, no te preocupes, ¡siempre puedes deshacerlo!

Realmente recomendamos hacer cursos gratuitos online de "básico HTML & HTML5" y "CSS básico" en freeCodeCamp<0>. Pueden ayudarte a aprender todo acerca de hacer tus sitios web más bonitos con HTML y CSS.</p> 

¡¿Lista para el siguiente capítulo?! :)