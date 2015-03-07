# Extendiendo Plantillas

Otra cosa buena que Django tiene para tí es la **extensión de plantillas** ¿Qué significa esto? Significa que puedes usar las mismas partes de tu HTML en diferentes páginas de tu sitio.

De esta manera no tienes que repetir lo mismo en cada archivo, cuando quieras usar la misma información/layout. Y si quieres cambiar algo,no tienes que hacerlo en cada plantilla, ¡solo una vez!

## Creando una plantilla base

Una plantilla base es la más básica de las plantillas que quieras extender en cada página de tu sitio.

Vamos a crear un archivo `base.html` en `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Luego abrelo y copia todo de `post_list.html` al archivo `base.html`, de la siguiente manera:

    {% load staticfiles %}
    <html>
        <head>
            <title>Django Girls blog</title>
            <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
            <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
            <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
            <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
            <link rel="stylesheet" href="{% static 'css/blog.css' %}">
        </head>
        <body>
            <div class="page-header">
                <h1><a href="/">Django Girls Blog</a></h1>
            </div>
    
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
        </body>
    </html>
    

Luego en `base.html`, remplaza completamente tu `<body>` (todo entre `<body>` and `</body>`) con esto:

    <body>
        <div class="page-header">
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>
        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                {% block content %}
                {% endblock %}
                </div>
            </div>
        </div>
    </body>
    

Nosotros básicamente remplazamos todo entre `{% for post in posts %}{% endfor %}` con:

    {% block content %}
    {% endblock %}
    

¿Qué significa esto? Acabas de crear un `block`, el cual es una etiqueta de plantilla que te permite insertar HTML en este bloque en otros templates que extiendan de `base.html`. Te mostraremos como hacer esto en un momento.

Ahora guardalo, y abre `blog/templates/blog/post_list.html` de nuevo. Elimina todo lo demás que está dentro del body y luego elimina `<div class="page-header"></div>`, de forma que el archivo se vea de la siguiente manera:

    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaks }}</p>
        </div>
    {% endfor %}
    

Y ahora agrega esta linea al inicio del archivo:

    {% extends 'blog/base.html' %}
    

Significa que ahora estamos extendiendo del template `base.html` en `post_list.html`. Solo nos falta una cosa: poner todo (excepto la línea que acabamos de agregar) entre `{% block content %}` y `{% endblock content %}`. Como esto:

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
    

¡Eso es todo! Verifica que tu sitio web aún funcione apropiadamente :)

> Si tienes un error `TemplateDoesNotExists` que diga que no hay un archivo `blog/base.html` y tienes `runserver` ejecutandose en la consola, intenta pararlo (presionando Ctrl+C - Botones Control y C juntos) y reinicialo ejecutando el comando `python manage.py runserver`.