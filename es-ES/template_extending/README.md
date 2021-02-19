# Extendiendo plantillas

Otra cosa buena que tiene Django es la **extensión de plantillas**. ¿Qué significa? Significa que puedes reusar partes del HTML para diferentes páginas del sitio web.

Las plantillas son útiles cuando quieres utilizar la misma información o el mismo diseño en más de un lugar. No tienes que repetirte a ti misma en cada archivo. Y si quieres cambiar algo, no tienes que hacerlo en cada plantilla, sólo en una!

## Crea una plantilla base

Una plantilla base es la plantilla más básica que extiendes en cada página de tu sitio web.

Vamos a crear un archivo `base.html` en `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Ahora, ábrelo en el editor de código y copia todo el contenido de `post_list.html` en `base.html`, así:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <header class="page-header">
          <div class="container">
              <h1><a href="/">Django Girls Blog</a></h1>
          </div>
        </header>

        <main class="container">
            <div class="row">
                <div class="col">
                {% for post in posts %}
                    <article class="post">
                        <time class="date">
                            {{ post.published_date }}
                        </time>
                        <h2><a href="">{{ post.title }}</a></h2>
                        <p>{{ post.text|linebreaksbr }}</p>
                    </article>
                {% endfor %}
                </div>
            </div>
        </main>
    </body>
</html>
```

Luego, en `base.html` reemplaza por completo tu `<body>` (todo lo que haya entre `<body>` and `</body>`) con esto:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<body>
    <header class="page-header">
      <div class="container">
          <h1><a href="/">Django Girls Blog</a></h1>
      </div>
    </header>
    <main class="container">
        <div class="row">
            <div class="col">
            {% block content %}
            {% endblock %}
            </div>
        </div>
    </main>
</body>
```

{% raw %}Seguro que ya te has dado cuenta de que lo que hemos hecho ha sido cambiar todo lo que había entre `{% for post in posts %}` y `{% endfor %}` por {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Pero ¿por qué? ¡Acabas de crear un bloque! Hemos usado la etiqueta de plantilla `{% block %}` para crear un área en la que se insertará HTML. Ese HTML vendrá de otra plantilla que extiende esta (`base.html`). Enseguida te enseñamos cómo se hace.

Ahora guarda `base.html` y abre `blog/templates/blog/post_list.html` de nuevo en el editor. {% raw %}Quita todo lo que hay encima de `{% for post in posts %}` y por debajo de `{% endfor %}`. Cuando termines, el archivo tendrá este aspecto:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <article class="post">
        <time class="date">
            {{ post.published_date }}
        </time>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endfor %}
```

Queremos utilizar esto como parte de nuestra plantilla en los bloques de contenido. ¡Es hora de añadir etiquetas de bloque en este archivo!

{% raw %}Tu etiqueta de bloque debe ser la misma que la etiqueta del archivo `base.html`. También querrás que incluya todo el código que va en los bloques de contenido. Para ello, pon todo entre `{% block content %}` y `{% endblock %}`. Algo como esto:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% block content %}
    {% for post in posts %}
        <article class="post">
            <time class="date">
                {{ post.published_date }}
            </time>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </article>
    {% endfor %}
{% endblock %}
```

Solo falta una cosa. Tenemos que conectar estas dos plantillas. ¿Esto es lo que significa extender plantillas! Para eso tenemos que añadir una etiqueta "extends" al comienzo del archivo. Así:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <article class="post">
            <time class="date">
                {{ post.published_date }}
            </time>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </article>
    {% endfor %}
{% endblock %}
```

¡Y ya está! Guarda el fichero y comprueba que el sitio web sigue funcionando como antes. :)

> Si te sale el error `TemplateDoesNotExist`, que significa que no hay ningún archivo `blog/base.html` y tienes `runserver` corriendo en la consola. Intenta pararlo, pulsando Ctrl+C (teclas Control y C a la vez) en la consola y reiniciarlo con el comando `python manage.py runserver`.