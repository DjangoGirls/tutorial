# Introducción a HTML

Te estarás preguntando, ¿qué es una plantilla?

Una plantilla es un archivo que podemos reutilizar para presentar información diferente de forma consistente - por ejemplo, se podría utilizar una plantilla para ayudarte a escribir una carta, porque aunque cada carta puede contener un mensaje distinto y dirigirse a una persona diferente, compartirán el mismo formato.

El formato de una plantilla de Django se describe en un lenguaje llamado HTML (que es el código HTML que mencionamos en el primer capítulo **Cómo funciona Internet**).

## ¿Qué es HTML?

HTML es un simple código que es interpretado por tu navegador web - como Chrome, Firefox o Safari - para mostrar una página web al usuario.

HTML significa HyperText Markup Language - en español, Lenguaje de Marcas de HyperTexto. **HyperText** significa que es un tipo de texto que soporta hipervínculos entre páginas. **Markup** significa que hemos tomado un documento y lo hemos marcado con código para decirle a algo (en este caso, un navegador) cómo interpretar la página. El código HTML está construido con **etiquetas**, cada una comenzando con `<` y terminando con `>`. Estas etiquetas de marcado son **elementos**.

## ¡Tu primera plantilla!

Crear una plantilla significa crear un archivo de plantilla. Todo es un archivo, ¿verdad? Probablemente hayas notado esto ya.

Las plantillas se guardan en el directorio de `blog/templates/blog`. Así que primero crea un directorio llamado `templates` dentro de tu directorio blog. Luego crea otro directorio llamado `blog` dentro de tu directorio de templates:

    blog
    └───templates
        └───blog
    

(Tal vez te preguntes por qué necesitamos dos directorios llamados `blog` - como descubrirás más adelante, esto es simplemente una útil convención de nomenclatura que hace la vida más fácil cuando las cosas empiezan a complicarse más.)

Y ahora crea un archivo `post_list.html` (déjalo en blanco por ahora) dentro de la carpeta `blog/templates/blog`.

Mira cómo se ve su sitio web ahora: http://127.0.0.1:8000/

> Si todavía tienes un error `TemplateDoesNotExists`, intenta reiniciar el servidor. Ve a la línea de comandos, detén el servidor pulsando Ctrl + C (teclas Control y C juntas) y comienza de nuevo mediante la ejecución del comando `python manage.py runserver`.

![Figura 11.1][1]

 [1]: images/step1.png

¡Ningún error más! Felicidades :) Sin embargo, por ahora, tu sitio web no está publicando nada excepto una página en blanco, porque la plantilla también está vacía. Tenemos que arreglarlo.

Añade lo siguiente a tu archivo de plantilla:

``` html
    <html>
        <p>Hi there!</p>
        <p>It works!</p>
    </html>
```

¿Cómo luce ahora tu sitio web? Haz click para ver: http://127.0.0.1:8000/

![Figura 11.2][2]

 [2]: images/step3.png

¡Funcionó! Buen trabajo :)

*   La etiqueta más básica, `<html >`, es siempre el principio de cualquier página web y `</html >` es siempre el final. Como puedes ver, todo el contenido de la página web va desde el principio de la etiqueta `<html >` y hasta la etiqueta de cierre `</html >`
*   `<p>` es una etiqueta para los elementos de párrafo; `</p>` cierra cada párrafo

## Cabeza & cuerpo

Cada página HTML también se divide en dos elementos: **head** y **body**.

*   **head** es un elemento que contiene información sobre el documento que no se muestra en la pantalla.

*   **body** es un elemento que contiene todo lo que se muestra como parte de la página web.

Usamos `<head>` para decirle al navegador acerca de la configuración de la página y `<body>` para decir lo que realmente está en la página.

Por ejemplo, puedes ponerle un título a la página web dentro de la `<head>`, así:

``` html
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

![Figura 11.3][3]

 [3]: images/step4.png

¿Observas cómo el navegador ha comprendido que "Ola's blog" es el título de tu página? Ha interpretado `<title>Ola's blog</title>` y colocó el texto en la barra de título de tu navegador (también se utilizará para marcadores y así sucesivamente).

Probablemente también hayas notado que cada etiqueta de apertura coincide con una *etiqueta de cierre*, con un `/`, y que los elementos son *anidados* (es decir, no puedes cerrar una etiqueta particular hasta que todos los que estaban en su interior se hayan cerrado también).

Es como poner cosas en cajas. Tienes una caja grande, `<html></html>`; en su interior hay `<body></body>`, y que contiene las cajas aún más pequeñas: `<p></p>`.

Tienes que seguir estas reglas de etiquetas de *cierre* y de *anidación* de elementos - si no lo haces, el navegador puede no ser capaz de interpretarlos correctamente y tu página se mostrará incorrectamente.

## Personaliza tu plantilla

¡Ahora puedes divertirte un poco y tratar de personalizar tu plantilla! Aquí hay algunas etiquetas útiles para eso:

*   `<h1>Un título</h1>` - para tu título más importante
*   `<h2>Un subtítulo</h2>` - para el título del siguiente nivel
*   `<h3>Un subsubtítulo</h3>` - ... y así hasta `<h6>`
*   `<em>texto</em>` - pone en cursiva tu texto
*   `<strong>texto</strong>` - pone en negrita tu texto
*   `<br />` - un salto de línea (no puedes colocar nada dentro de br)
*   `<a href="http://djangogirls.org">link</a>` - crea un vínculo
*   `<ul><li>primer elemento</li><li>segundo elemento</li></ul>` - crea una lista, ¡igual que esta!
*   `<div></div>` - define una sección de la página

Aquí hay un ejemplo de una plantilla completa:

``` html
    <html>
        <head>
            <title>Django Girls blog</title>
        </head>
        <body>
            <div>
                <h1><a href="">Django Girls Blog</a></h1>
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

*   El primer elemento `div` contiene el título de nuestro blog - es un encabezado y un enlace
*   Otros dos elementos `div` contienen nuestros posts con la fecha de publicación, `h2` con un título que es clickeable y dos `p` (párrafo) de texto, uno para la fecha y uno para nuestro post.

Nos da este efecto:

![Figura 11.4][4]

 [4]: images/step6.png

¡Yaaay! Pero hasta el momento, nuestra plantilla sólo muestra exactamente **la misma información** - considerando que antes hablábamos de plantillas que nos permitirían mostrar información **diferente** en el **mismo formato**.

Lo que queremos realmente es mostrar posts reales añadidos en nuestra página de administración de Django - y ahí es a donde vamos a continuación.

## Una cosa más: ¡despliega!

Sería bueno ver todo esto disponible en Internet, ¿no? Hagamos otro despliegue en PythonAnywhere:

### Haz un commit y sube tu código a GitHub

En primer lugar, veamos qué archivos han cambiado desde que hicimos el despliegue por última vez:

    $ git status
    

Asegúrate de que estás en el directorio `djangogirls` y vamos a decirle a `git` que incluya todos los cambios dentro de este directorio:

    $ git add --all .
    

> **Nota** `-A` (abreviatura de "all") significa que `git` también reconocerá si has eliminado archivos (por defecto, sólo reconoce archivos nuevos/modificados). También recuerda (del capítulo 3) que `.` significa el directorio actual.

Antes de que subamos todos los archivos, vamos a ver qué es lo que `git` subirá (todos los archivos que `git` cargará deberían aparecer en verde):

    $ git status
    

Ya casi estamos, ahora es tiempo de decirle que guarde este cambio en su historial. Vamos a darle un "mensaje de commit" donde describimos lo que hemos cambiado. Puedes escribir cualquier cosa que te gustaría en esta etapa, pero es útil escribir algo descriptivo para que puedes recordar lo que has hecho en el futuro.

    $ git commit -m "Cambie el HTML para la página."
    

> **Nota** Asegúrate de usar comillas dobles alrededor del mensaje de commit.

Una vez que hicimos esto, subimos (push) nuestros cambios a PythonAnywhere:

    git push
    

### Descarga tu nuevo código a PythonAnywhere y actualiza tu aplicación web

*   Abre la [página de consolas de PythonAnywhere][5] y ve a tu **consola Bash** (o comienza una nueva). Luego, ejecuta:
    
```
$ cd ~/my-first-blog
$ source myvenv/bin/activate
(myvenv)$ git pull
[...]
(myvenv)$ python manage.py collectstatic
[...]
```

 [5]: https://www.pythonanywhere.com/consoles/

Y mira cómo tu código se descarga. Si quieres comprobar que ya ha terminado, puedes ir a la pestaña **Files** y ver tu código en PythonAnywhere.

*   Finalmente, dirígete a la pestaña [Web][6] y selecciona **Reload** en tu aplicación web.

 [6]: https://www.pythonanywhere.com/web_app_setup/

¡Tu actualización debería estar en línea! Actualiza tu sitio web en el navegador. Ahora deberías poder ver tus cambios :)
