# Introducción a HTML

Qué es una plantilla, te estarás preguntando?

Una plantilla es un archivo que podemos utilizar nuevamente para presentar información en un formato homogéneo - por ejemplo, se podría utilizar una plantilla para ayudarte a escribir una carta, porque aunque cada carta puede contener un mensaje distinto y dirigirse a una persona diferente, compartirán el mismo formato.

El formato de una plantilla de Django se describe en un lenguaje llamado HTML (que es el código HTML que mencionamos en el primer capítulo **Como funciona Internet**).

## ¿Qué es HTML?

HTML es un simple código que es interpretado por el navegador web - como Chrome, Firefox o Safari - para mostrar una página web al usuario.

HTML por separado es "Lenguaje Marcado de HiperTexto". **HiperTexto** significa que es un tipo de texto que soporta hipervínculos entre páginas. **Marcado** significa que hemos tomado un documento y lo marca con código para decirte cómo interpretar la página (en este caso, un navegador). El código HTML está construido con las **etiquetas**, cada uno a partir de `<` y terminando con `>`. Estas etiquetas de marcado son **elementos**.

## Tu primera plantilla!

Crear una plantilla significa crear un archivo de plantilla. Todo es un archivo, ¿verdad? Probablemente hayas notado esto ya.

Las plantillas se guardan en el directorio de `blog/templates/blog`. Así que primero crear un directorio llamado `templates` dentro de tu directorio de blog. Luego cree otro directorio llamado `blog` dentro de su directorio de templates:

    blog
    └───templates
        └───blog
    

(Tal vez te preguntes por qué necesitamos dos directorios llamados `blog` - como usted descubrirá más adelante, esto es simplemente una útil convención de nomenclatura que hace la vida más fácil cuando las cosas empiezan a complicarse más.)

Y ahora a crear un archivo `post_list.html` (Déjalo en blanco por ahora) dentro del directorio de `blog/templates/blog`.

Cómo se ve su sitio web ahora: http://127.0.0.1:8000 /

> Si todavía tienes un error `TemplateDoesNotExists`, intenta reiniciar el servidor. Ve a la línea de comandos, detén el servidor pulsando Ctrl + C (teclas Control y C juntas) y comienza de nuevo mediante la ejecución del comando `python manage.py runserver`.

![Figura 11.1][1]

 [1]: images/step1.png

Ningún error ya! Felicidades :) Sin embargo, tu sitio de Internet en realidad no publica nada, excepto una página en blanco, porque la plantilla también está vacía. Tenemos que arreglarlo.

Añade lo siguiente a su archivo de plantilla:

    <html>
        <p>Hi there!</p>
        <p>It works!</p>
    </html>
    

¿Cómo luce ahora tu sitio de Internet? Haga clic para ver: http://127.0.0.1:8000 /

![Figura 11.2][2]

 [2]: images/step3.png

¡Funcionó! Buen trabajo :)

*   La etiqueta más básica, `<html >`, es siempre el principio de cualquier página web y `</html >` es siempre el final. Como puedes ver, todo el contenido de la página web va al principio de la etiqueta `<html >` y entre la etiqueta de cierre `</html >`
*   `< p >` es una etiqueta para los elementos de párrafo; `< /p >` cierra cada párrafo

## Cabeza & Cuerpo

Cada página HTML también se divide en dos elementos: **head** y **body**.

*   **head** es un elemento que contiene información sobre el documento que no aparece en la pantalla.

*   **body** es un elemento que contiene todo lo que se muestra como parte de la página web.

Usamos `<head>` para decirle el navegador acerca de la configuración de la página y `<body>` para decir lo que realmente está en la página.

Por ejemplo, puedes ponerle un título a la página web dentro de la `<head>`, así:

    <html>
        <head>
            <title>Ola's blog</title>
        </head>
        <body>
            <p>Hi there!</p>
            <p>It works!</p>
        </body>
    </html>
    

Guarda el archivo y actualiza tu página.

![Figura 11.3][3]

 [3]: images/step4.png

¿Observa cómo el navegador ha comprendido que "Ola's Blog" es el título de su página? Ha interpretado `<title>Ola's blog</title>` y coloca el texto en la barra de título del navegador (también se utilizará para marcadores y así sucesivamente).

Probablemente también hayas notado que cada etiqueta de apertura es comparable con una *etiqueta de cierre*, con un `/`, y que elementos *anidados* (es decir, no puede cerrar una etiqueta particular hasta que todos los que estaban en su interior se hayan cerrado también).

Es como poner las cosas en cajas. Tienes una caja grande, `<html></html>`; en su interior hay `<body></body>`, y que contiene las cajas aún más pequeñas: `<p></p>`.

Tienes que seguir estas reglas de etiquetas *de cierre* y de *anidar* elementos - si no lo haces, el navegador puede no ser capaz de interpretarlos correctamente y tu página se mostrará incorrectamente.

## Personaliza tu plantilla

Ahora puedes divertirte un poco y tratar de personalizar tu plantilla! Aquí están algunas etiquetas útiles para eso:

*   `<h1>Un Titulo</h1>` - para tu titulo más importante
*   `<h2>Un sub-titulo</h2>` para el siguiente nivel
*   `<h3>Un sub-sub-titulo</h3>` ... y así hasta `<h6>`
*   `<em>texto</em>` Pone en cursiva tu texto
*   `<strong>texto</strong>` Pone en negrita tu texto
*   `<br />` Un salto de línea (No puedes colocar nada dentro de br)
*   `<a href="http://djangogirls.org">link</a>` crea un link
*   `<ul><li>primer elemento</li><li>segundo elemento</li></ul>` crea una lista, igual que esta!
*   `<div></div>` defina una sección de la página

Aquí hay un ejemplo de una plantilla completa:

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
    

Hemos creado tres secciones `div` aquí.

*   El primer elemento `div` contiene el título de nuestro post - es un encabezado y un enlace
*   Otros dos elementos `div` contengan nuestro blog con fecha publicada, `h2` con un título puesto que es clicable y dos s `p` (párrafo) de texto, uno para la fecha y uno de nuestro blogpost.

Nos da este efecto:

![Figura 11.4][4]

 [4]: images/step6.png

Yaaay! Pero hasta el momento, nuestra plantilla sólo muestra exactamente **la misma información** - considerando que antes hablábamos de plantillas como permitiéndonos Mostrar información **diferente** en el **mismo formato**.

Lo que queremos realmente es mostrar mensajes reales añadidos en nuestra administración de Django - y eso es a donde vamos.

## Una cosa más

¿Sería bueno ver si tu sitio de Internet esta trabajando todavía en Heroku, cierto? Vamos a intentar implementar otra vez.

En primer lugar, veamos qué archivos han cambiado desde que hicimos deploy:

    $ git status
    

Vamos a decirle a `git` para incluir todos los cambios desde el directorio actual:

    $ git add -A .
    

> **Nota** `-A` (abreviatura de "all") significa que `git` también reconocerá si se han eliminado los archivos (de forma predeterminada, sólo reconoce archivos nuevos/modificados). También recuerda (capítulo 3) que `.` significa el directorio actual.

Antes de que subamos todos los archivos, vamos a ver qué `git` va subiendo (todos los archivos que `git` cargará ahora deberían aparecer en verde):

    $ git status
    

Ya casi estamos, ahora es tiempo de decirle que guarde estos cambios en su historial. Vamos a dar un "mensaje de comentar" donde se describe lo que hemos cambiado. Puedes escribir cualquier cosa que te gustaría en esta etapa, pero es útil escribir algo descriptivo para que puedes recordar lo que has hecho en el futuro.

    $ git commit -m "Cambiando el html para la página."
    

> **Nota** Asegúrate de usar comillas dobles alrededor del mensaje de confirmación.

Una vez que hemos hecho eso, por fin podemos subir (push) nuestros cambios en el sitio web en heroku:

    git push heroku master
    

Y eso es todo! Una vez terminado Heroku, tu puedes seguir adelante y actualizar tu sitio web en el navegador. Los cambios deberian ser visibles!