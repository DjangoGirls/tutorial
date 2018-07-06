# Extendiendo plantillas

Otra cosa buena que Django tiene para tí es la **extensión de plantillas**. ¿Qué significa esto? Significa que puedes usar las mismas partes de tu HTML para diferentes páginas de tu sitio web.

Las plantillas te ayudan cuando deseas utilizar el misma información o diseño en más de un lugar. No tienes que repetirte a ti misma en cada archivo. Y si quieres cambiar algo, no tienes que hacerlo en cada plantilla, sólo en una!

## Crea una plantilla base

Una plantilla base es la plantilla más básica que extiendes en cada página de tu sitio web.

Vamos a crear un archivo `base.html` en `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Luego ábrelo y copia todo lo que hay en `post_list.html` al archivo `base.html`, de la siguiente manera:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
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

{% raw %} Puede que hayas notado que esto reemplazó todo desde `{% for post in posts %}` hasta `{% endfor %}` con {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Pero ¿por qué? ¡Acabas de crear un bloque! Utilizaste la etiqueta de plantilla `{% block %}` para crear un área que tendrá HTML insertado en él. El HTML vendrá de otras plantillas que extienden esta plantilla (`base.html`). Te mostraremos como hacer esto en un momento.

Ahora guarda `base.html`, y abre tu `blog/templates/blog/post_list.html` nuevamente. {% raw %}Vas a quitar todo arriba de `{% for post in posts %}` y abajo de `{% endfor %}`. Cuando termines el archivo se verá así:{% endraw %}

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

Queremos utilizar esto como parte de nuestra plantilla para todos los bloques de contenido. Hora de añadir etiquetas de bloque a este archivo!

{% raw %} Tu etiqueta de bloque debe coincidir con tu archivo `base.html`. También querrás incluir todo el código que va en tus bloques de contenido. Para ello, pon todo entre `{% block content %}` y `{% endblock %}`. Algo como esto:{% endraw %}

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

Solo falta una cosa. Tenemos que conectar estas dos plantillas. Esto es lo que significa extender plantillas! Haremos esto añadiendo una etiqueda "extends" al comienzo del archivo. Así:

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

Eso es todo! Verifica que tu sitio web aún funcione apropiadamente. :)

> Si te sale el error `TemplateDoesNotExist`, significa que no hay ningún archivo `blog/base.html` y tienes `runserver` corriendo en la consola. Ve a la línea de comandos, detén el servidor pulsando Ctrl + C (teclas Control y C juntas) y reinicialo con el comando `python manage.py runserver`.