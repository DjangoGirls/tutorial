# Extendiendo plantillas

Otra cosa buena que Django tiene para tí es la __extensión de plantillas__. ¿Qué significa esto? Significa que puedes usar las mismas partes de tu HTML para diferentes páginas de tu sitio web.

Las plantillas son útiles cuando quieres usar una misma información o un mismo esquema en más de un lugar. De esta forma no tienes que repetir el código en cada uno de los archivos y si quieres cambiar algo, no necesitas hacerlo en cada plantilla sino, ¡solo en una!

## Crea la plantilla base

Una plantilla base es la plantilla más básica que extiendes en cada página de tu sitio web.

Vamos a crear un archivo `base.html` en `blog/templates/blog/`:

```
blog
└───templates
    └───blog
            base.html
            post_list.html
```

Luego ábrelo y copia todo lo que hay en `post_list.html` al archivo `base.html`, de la siguiente manera:

{% filename %}blog/templates/blog/base.html{% endfilename %}
```html
{% load staticfiles %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
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
                        <p>{{ post.text|linebreaksbr }}</p>
                    </div>
                {% endfor %}
                </div>
            </div>
        </div>
    </body>
</html>
```

Luego, en `base.html` reemplaza por completo tu `<body>` (todo lo que haya entre `<body>` and `</body>`) con esto:

{% filename %}blog/templates/blog/base.html{% endfilename %}
```html
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
```

{% raw %}Quizás notaste que esto reemplaza todo lo de `{% for post in posts %}` por `{% endfor %}` con: {% endraw %}


{% filename %}blog/templates/blog/base.html{% endfilename %}
```html
{% block content %}
{% endblock %}
```
¿Pero porqué? Acabas de crear un `block`! Usamos el template tag `{% block %}` para crear un área en dónde luego insertado un HTML. Ese HTML vendrá desde otra plantilla que extienda esta plantilla (`base.hml`). Te mostraremos como hacer esto en un momento.

Ahora guarda `base.html` y abre tu archivo `blog/templates/blog/post_list.html` de nuevo. 
{% raw %}Elimina todo lo que está por encima de `{% for post in posts %}` y por debajo de `{% endfor %}`. Cuando lo hagas, el archivo se verá así:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{% for post in posts %}
    <div class="post">
        <div class="date">
            {{ post.published_date }}
        </div>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

Queremos utilizar esto como parte de nuestra plantilla para todos los bloques _content_. ¡Es hora de agregar una etiqueta `block` a este archivo!

{% raw %}Quieres que tu etiqueta `block` coincida con la etiqueta en tu archivo `base.html`. También querrás que incluya todo el código que pertenece al bloque _content_. Para hacer eso, pon todo entre `{% block content %}` y `{% endblock content %}`. Algo así:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

Solo nos falta una cosa. Necesitamos conectar estas dos plantillas. ¡De eso se trata extender plantillas! Necesitamos hacer esto agregando una etiqueta al principio del archivo. Así:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

¡Eso es todo! Verifica que tu sitio web aún funcione apropiadamente :)

> Si obtienes un error `TemplateDoesNotExist`, significa que no hay un archivo `blog/base.html` y tienes `runserver` ejecutándose en la consola. Intenta pararlo (presionando Ctrl+C - las teclas Control y C juntas) y reinicialo ejecutando el comando `python manage.py runserver`.
