# Introducción a HTML

Te estarás preguntando, ¿qué es una plantilla?

Una plantilla es un archivo que podemos reutilizar para presentar información diferente de forma consistente - por ejemplo, podrías utilizar una plantilla para ayudarte a escribir una carta, porque aunque cada carta puede contener un mensaje distinto y dirigirse a una persona diferente, compartirán el mismo formato.

El formato de una plantilla de Django se describe en un lenguaje llamado HTML (el HTML que mencionamos en el primer capítulo **Cómo funciona Internet**).

## ¿Qué es HTML?

HTML es un código simple que es interpretado por tu navegador web - como Chrome, Firefox o Safari - para mostrar una página web al usuario.

HTML significa HyperText Markup Language - en español, Lenguaje de Marcas de HyperTexto. **HyperText** -hipertexto en español- significa que es un tipo de texto que soporta hipervínculos entre páginas. **Markup** significa que hemos tomado un documento y lo hemos marcado con código para decirle a algo (en este caso, un navegador) cómo interpretar la página. El código HTML está construido con **etiquetas**, cada una comenzando con `<` y terminando con `>`. Estas etiquetas representan **elementos** de marcado.

## ¡Tu primera plantilla!

Crear una plantilla significa crear un archivo de plantilla. Todo es un archivo, ¿verdad? Probablemente hayas notado esto ya.

Las plantillas se guardan en el directorio de `blog/templates/blog`. Así que primero crea un directorio llamado `templates` dentro de tu directorio blog. Luego crea otro directorio llamado `blog` dentro de tu directorio de templates:

    blog
    └───templates
        └───blog
    

(Tal vez te estés preguntando por qué necesitamos dos directorios llamados `blog` – como verás más adelante, es una convención de nombres que nos facilitará la vida cuando las cosas se pongan más complicadas.)

Y ahora crea un archivo `post_list.html` (déjalo en blanco por ahora) dentro de la carpeta `blog/templates/blog`.

Mira cómo se ve su sitio web ahora: http://127.0.0.1:8000/

> Si todavía tienes un error `TemplateDoesNotExist`, intenta reiniciar tu servidor. Ve a la consola, para el servidor pulsando Ctrl+C (las teclas Control y C a la vez) y reinicialo ejecuntado el comando `python manage.py runserver`.

![Figura 11.1](images/step1.png)

No error anymore! Congratulations! :) However, your website isn't actually publishing anything except an empty page, because your template is empty too. We need to fix that.

Abre un fichero nuevo en el editor y escribe lo siguiente:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

Ahora, cómo luce tu sitio web? Haz click para ver: http://127.0.0.1:8000/

![Figura 11.2](images/step3.png)

It worked. Nice work there! :)

* La etiqueta más básica, `<html>`, siempre va al inicio de cualquier página web y `</html>` va siempre al final. Como puedes ver, todo el contenido de la página web va desde el principio de la etiqueta `<html >` y hasta la etiqueta de cierre `</html >`
* `<p>` es una etiqueta para los elementos de párrafo; `</p>` cierra cada párrafo

## Cabeza y cuerpo

Cada página HTML también se divide en dos elementos: **head** y **body**.

* **head** es un elemento que contiene información sobre el documento que no se muestra en la pantalla.

* **body** es un elemento que contiene todo lo que se muestra como parte de la página web.

Usamos `<head>` para decirle el navegador acerca de la configuración de la página y `<body>` para decir lo que realmente está en la página.

Por ejemplo, puedes ponerle un título a la página web dentro de la `<head>`, así:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Ola's blog</title>
    </head>
    <body>
        <p>Hi there!</p>
        <p>It works!</p>
    </body>
</html>
```

Guarda el archivo y actualiza tu página.

![Figura 11.3](images/step4.png)

¿Observas cómo el navegador ha comprendido que "Ola's blog" es el título de tu página? Ha interpretado `<title>Ola's blog</title>` y colocó el texto en la barra de título de tu navegador (también se utilizará para marcadores y así sucesivamente).

Probablemente también hayas notado que cada etiqueta de apertura coincide con una *etiqueta de cierre*, con un `/`, y que los elementos son *anidados* (es decir, no puedes cerrar una etiqueta particular hasta que todos los que estaban en su interior se hayan cerrado también).

Es como poner cosas en cajas. Tienes una caja grande, `<html></html>`; en su interior hay `<body></body>`, y que contiene las cajas aún más pequeñas: `<p></p>`.

Tienes que seguir estas reglas de etiquetas de *cierre* y de *anidación* de elementos - si no lo haces, el navegador puede no ser capaz de interpretarlos apropiadamente y tu página se mostrará incorrectamente.

## Personaliza tu plantilla

¡Ahora puedes divertirte un poco y tratar de personalizar tu plantilla! Aquí hay algunas etiquetas útiles para eso:

* `<h1>Un título</h1>` - para tu título más importante
* `<h2>Un subtítulo</h2>` - para el título del siguiente nivel
* `<h3>Un subsubtítulo</h3>` - ... y así hasta `<h6>`
* `<p>Un párrafo de texto</p>`
* `<em>texto</em>` - pone en cursiva tu texto
* `<strong>texto</strong>` - pone en negrita tu texto
* `<br>` va en otra línea (no puedes poner nada dentro de br y no hay etiqueta de cierre)
* `<a href="https://djangogirls.org">link</a>` - crea un vínculo
* `<ul><li>primer elemento</li><li>segundo elemento</li></ul>` - crea una lista, ¡igual que esta!
* `<div></div>` - define una sección de la página

Aca va un ejemplo de una plantilla completa, copialo y pegalo en `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </div>
    </body>
</html>
```

Aquí hemos creado tres secciones `div`.

* El primer elemento `div` contiene el título de nuestro blog - es un encabezado y un enlace
* Otros dos elementos `div` contienen nuestras publicaciones (posts) del blog con su fecha de publicación, `h2` con el título del post que es clickable y dos `p`s (párrafos) de texto, uno para la fecha y otro para el contenido del post.

Nos da este efecto:

![Figura 11.4](images/step6.png)

¡Yaaay! Pero hasta el momento, nuestra plantilla sólo muestra exactamente **la misma información** - considerando que antes hablábamos de plantillas como permitiéndonos mostrar información **diferente** en el **mismo formato**.

Lo que queremos realmente es mostrar posts reales añadidos en nuestra página de administración de Django - y ahí es a donde vamos a continuación.

## Una cosa más: ¡despliega!

Sería bueno ver todo esto disponible en Internet, ¿no? Hagamos otro despliegue en PythonAnywhere:

### Haz commit, y sube tu código a GitHub

En primer lugar, vamos a ver qué archivos han cambiado desde la última puesta en marcha (ejecute estos comandos localmente, no en PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Asegúrate de que estás en el directorio `djangogirls` y vamos a decirle a `git` que incluya todos los cambios en este directorio:

{% filename %}command-line{% endfilename %}

    $ git add .
    

Antes de que subamos todos los archivos, vamos a ver qué es lo que `git` subirá (todos los archivos que `git` cargará deberían aparecer en verde):

{% filename %}command-line{% endfilename %}

    $ git status
    

Ya casi estamos, ahora es tiempo de decirle que guarde este cambio en su historial. Vamos a darle un "mensaje de commit" donde describimos lo que hemos cambiado. Puedes escribir cualquier cosa que te gustaría en esta etapa, pero es útil escribir algo descriptivo para que puedes recordar lo que has hecho en el futuro.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Cambie el HTML para la página."
    

> **Note** Make sure you use double quotes around the commit message.

Una vez hecho esto, subimos (push) los cambios a Github:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Descarga tu nuevo código a PythonAnywhere y actualiza tu aplicación web

* Abre la [página de consolas de PythonAnywhere](https://www.pythonanywhere.com/consoles/) y ve a tu **consola Bash** (o comienza una nueva). Luego, ejecuta:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

Tú necesitarás sustituir `<your-pythonanywhere-domain>` con tu actual nombre de subdominio PythonAnywhere, sin los paréntesis angulares o corchetes. Tu nombre de subdominio es normalmente tu nombre de usuario PythonAnywhere, pero en algunos casos ésto puede ser un poco diferente (tal como si tu nombre de usuario contiene letras mayúsculas). Así si éste comando no funciona, usa el comando `ls`(listar archivos) para encontrar tu actual subdominio/nombre-carpeta, y muévete allí con `cd `.

Ahora mira cómo se descarga tu código. Si quieres comprobar que efectivamente ha llegado bien, puedes ir a la **página "Files"** y ver tu código en PythonAnywhere (puedes ir a otras páginas de PythonAnywhere desde el botón de la esquina superior derecha de la página de la consola).

* Finalmente, ve a la [página "Web"](https://www.pythonanywhere.com/web_app_setup/) y pulsa **Reload** en tu aplicación web.

¡Tu nueva versión ya debería estar publicada! Ve al navegador y refresca tu sitio web. Deberías ver los cambios. :)