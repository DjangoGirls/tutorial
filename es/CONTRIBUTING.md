# ¿Cómo contribuir?

The Django Girls Tutorial está licenciado bajo la licencia internacional*Creative Commons Attribution-ShareAlike 4.0*. Cualquiera puede añadir, editar y corregir el tutorial.

# Editar lo basico

El código fuente del tutorial se encuentra [en Github](http://github.com/DjangoGirls/tutorial). Para aceptar y revisar cambios se usa el la guía [Fork & Pull workflow](https://help.github.com/articles/using-pull-requests) de Github.

El tutorial utiliza el servicio de [GitBook](https://www.gitbook.io/) para la publicación de su documentación. Visita el siguiente enlace para [ver más información acerca de cómo funciona Gitbook](http://help.gitbook.io/).

El tutorial esta escrito en [el lenguaje de marcado Markdown](https://help.github.com/articles/markdown-basics).

Puedes encontrar todas las discusiones sobre el contenido del tutorial en el [issue tracker](https://github.com/DjangoGirls/tutorial/issues) de Github.

# Primeros pasos y requisitos previos

Para contribuir en el tutorial es necesario que cuente con lo siguiente:

  * Una [cuenta de Github](https://github.com)
  * En el caso de hacer una edición compleja, estar familiarizado con [los conceptos básicos de línea de comandos de Git](https://help.github.com/articles/set-up-git) o familiarizado con una aplicación ([Windows](https://windows.github.com/), [Mac](https://mac.github.com/)) que te permita enviar los cambios realizados en tu computadora a Github.

## Hazle Fork al repositorio

Primero hazle Fork al repositorio de [DjangoGirls/tutorial](https://github.com/DjangoGirls/tutorial) hacia tu cuenta personal de Github:

![Fork button](contributing/images/fork.png)

# Editando el contenido de un capitulo

## Pequeños cambios

Para pequeños cambios como correcciones puedes usar el editor online de Github:

  * Abre el fork que hiciste a tu cuenta de Github
  * ve al archivo *README.md* en cualquiera de los capitulos,
  * Presiona el icono de *editar* (lápiz)

así puede editar el capitulo directamente desde github.com.

![Edit button](contributing/images/edit.png)

La sintaxis de Markdown es usada para editar las paginas individuales del tutorial.

![Github editor](contributing/images/github_editor.png)

Guarda tus cambios y crea una pull request como se explicara más adelante.

## Contenidos nuevos y cambios complejos

Para añadir nuevos capitulos, escribir pequeños fragmentos de texto o añadir imagenes, necesitaras hacer una copia del tutorial en tu computadora local.

O bien utilizar la aplicación Github para su sistema operativo (antes mencionado) o la linea de comando de `git` para obtener el repositorio de manera local. Obtendrá la dirección del repositorio de la pagina principal de su propio Fork del repositorio en Github:

    git clone git@github.com:tu_usuario_de_github/tutorial.git
    

descarga la aplicación del [editor de Gitbook](http://help.gitbook.io/editor/README.html) para tu computadora.

A continuación, puedes abrir el tutorial en el Editor de Gitbook (*File* > *Open book*).

![Gitbook](contributing/images/gitbook.png)

Haz todos los cambios que quieras en el tutorial usando el editor y luego guardalos(*Book*>*Save All*).

Luego haz un commit para los cambios usando `git` y envía los cambios hacia tu repositorio remoto de Github.

Ejemplo:

    $ git status
    On branch contributing
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
        contributing_and_editing_this_book/images/gitbook.png
    
    $ git add contributing_and_editing_this_book/images/gitbook.png
    
    $ git commit -m "Added gitbook editor screenshot"
    [contributing fe36152] Added gitbook screenshot
     1 file changed, 0 insertions(+), 0 deletions(-)
     create mode 100644 contributing_and_editing_this_book/images/gitbook.png
    
    $ git push
    Counting objects: 11, done.
    Delta compression using up to 8 threads.
    Compressing objects: 100% (5/5), done.
    Writing objects: 100% (5/5), 266.37 KiB | 0 bytes/s, done.
    Total 5 (delta 1), reused 0 (delta 0)
    To git@github.com:miohtama/tutorial.git
       b37ca59..fe36152  contributing -> contributing
    

# Hacer un pull request

Después de finalizar los cambios necesitaras crear [una pull request](https://help.github.com/articles/using-pull-requests) en Github. DjangoGirls será informado acerca de la pull request, revisara tus cambios, sugerirá cualquier corrección sí la necesita y luego hara un *pull* a tus cambios hacia la versión original.

En tu propio repositorio de Github presiona el botón *Compare & pull request*

![Gitbook](contributing/images/pull_request.png)

Rellena la información de *por que* fueron hechos estos cambios. el inspector analizará los detalles de los cambios actuales, de esta forma no necesitas repetir el contenido de los cambios.

Luego presiona *Create pull request*.

Github le notificara a través de e-mails el seguimiento del proceso.

# Más información y ayuda

Para cualquier duda póngase en [contacto con DjangoGirls](http://djangogirls.org/).