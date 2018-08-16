# ¡Despliega!

> **Nota** El siguiente capítulo puede ser, a veces, un poco difícil de seguir. Se persistente y acábalo. El despliegue es una parte importante del proceso en el desarrollo web. Este capítulo está situado en el medio del tutorial para que tu guía pueda ayudarte a poner tu sitio web en línea, lo que puede ser un proceso algo más complicado. Esto significa que podrás acabar el tutorial por tu cuenta si se te acaba el tiempo.

Hasta ahora, tu sitio sólo está disponible en tu computadora. ¡Ahora aprenderás como desplegarlo! El lanzamiento es el proceso de publicar tu aplicación en internet para que la gente pueda acceder y ver tu aplicación. :)

Como ya has aprendido, un sitio web tiene que estar en un servidor. Existen muchos proveedores de servidores disponibles en internet, nosotros vamos a usar [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere es gratis para aplicaciones pequeñas que no tienen muchos visitantes, y eso será definitivamente suficiente para ti por ahora.

El otro servicio externo que vamos a utilizar es [GitHub](https://www.github.com), un servicio de alojamiento de código. Hay otras opciones por ahí, pero hoy en día casi todas las programadoras y programadores tienen una cuenta de GitHub, ¡y ahora tú también la vas a tener!

Estos tres lugares serán importantes para ti. Tu computadora local será el lugar donde tú haces desarrollo y pruebas. Cuando estés contento con los cambios, colocarás una copia de tu programa en GitHub. Tu sitio Web estará en PythonAnywhere y lo actualizarás al obtener una nueva copia de tu código de GitHub.

# Git

> **Nota** Si ya has realizado los pasos de instalación, no los tienes que repetir, puedes avanzar a la siguiente sección y empezar a crear tu repositorio en Git.

{% include "deploy/install_git.md" %}

## Iniciar nuestro repositorio Git

Git rastrea los cambios realizados a un grupo determinado de archivos en lo que llamamos un repositorio de código (abreviado "repo"). Iniciemos uno para nuestro proyecto. Abre la consola y ejecuta los siguientes comandos en el directorio de `djangogirls`:

> **Nota** Comprueba el directorio de trabajo actual con el comando `pwd` (OSX/Linux) o `cd` (Windows) antes de inicializar el repositorio. Deberías estar en la carpeta `djangogirls`.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Tu nombre"
    $ git config --global user.email tu@ejemplo.com
    

Inicializar el repositorio de git es algo que sólo tenemos que hacer una vez por proyecto ( y no tendrás que volver a ingresar tu usuario y correo electrónico nunca más).

Git llevará un registro de los cambios realizados en todos los archivos y carpetas en este directorio, pero hay algunos archivos que queremos que ignore. Esto lo hacemos creando un archivo llamado `.gitignore` en el directorio base. Abre tu editor y crea un nuevo archivo con el siguiente contenido:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    .DS_Store
    

Y guárdalo como `.gitignore` en la carpeta "djangogirls".

> **Nota** ¡El punto al principio del nombre del archivo es importante! Si estas teniendo dificultades creándolo (a los Mac no les gusta que hagas ficheros que comiencen con un punto usando por ejemplo el buscador (Finder)), entonces usa la opción "Save As" de tu editor, esto funcionará.
> 
> **Nota** Uno de los archivos especificados en tu carpeta `.gitignore` es `db.sqlite3`. Este archivo es tu base de datos local, donde todas tus publicaciones son almacenadas. No querrás añadir esto a tu repositorio por que tu pagina en PythonAnywhere va a usar una base de datos distinta. Esa base de datos podría ser SQLite, como tu maquina de desarrollo, pero usualmente usarás una llamada MySQL que puede manejar muchos mas visitantes que SQLite. De todos modos, al ignorar tu base de datos SQLite en la copia de GitHub todas las publicaciones que has creado hasta el momento solo van a estar disponibles localmente y se van a quedar así, pero vas a tener que añadirlas de nuevo en producción. Deberías imaginar que tu base de datos local es un buen campo de pruebas donde puedes probar diferentes cosas sin miedo a borrar tus publicaciones reales de tu blog.

Es una buena idea utilizar el comando `git status` antes de `git add` o en cualquier momento en que no estés seguro de lo que ha cambiado. Esto te ayudará a prevenir cualquier sorpresa, como archivos incorrectos siendo añadidos o consignados (commit). El comando `git status` muestra información sobre cualquier archivo no seguido("untracked"), modificado ("modified"), preparado ("staged"), el estado de la rama y mucho más. La salida debería ser similar a lo siguiente:

{% filename %}command-line{% endfilename %}

    $ git status
    On branch master
    
    Initial commit
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            .gitignore
            blog/
            manage.py
            mysite/
            requirements.txt
    
    nothing added to commit but untracked files present (use "git add" to track)
    

Y finalmente guardamos nuestros cambios. Ve a tu consola y ejecuta estos comandos:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "Mi aplicación Django Girls, primer commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Colocando tu código en Github

Ve a [GitHub.com](https://www.github.com) y registrate para una nueva cuenta gratuita. (Si ya hiciste esto en la preparación del taller, ¡esta genial!)

Entonces, crea un nuevo repositorio dándole el nombre "my-first-blog". Deja el cuadro de chequeo "initialize with a README" sin validar, deja la opción de .gitignore vacía (ya lo hemos hecho manualmente) y deja la licencia como None.

![](images/new_github_repo.png)

> **Note** El nombre `my-first-blog` es importante - tu puedes escoger algo mas, pero va a ocurrir muchas veces en las instrucciones, y vas a tener que sustituirlo cada vez. Posiblemente sea más fácil quedarte con el nombre `my-first-blog`.

En la siguiente pantalla, se te mostrarán tu enlace de clonado. Escoje la versión "HTTPS", cópialo y pégalo en tu terminal:

![](images/github_get_repo_url_screenshot.png)

Ahora necesitas enlazar el repositorio de Git en tu computador al repositorio de github.

Escribe el siguiente comando en tu consola (Reemplaza `<your-github-username>` con el nombre de usuario que ingresaste cuando creaste tu cuenta de Github, pero sin < >):

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

Ingresa tu nombre de usuario y contraseña de GitHub y deberías ver algo como:

{% filename %}command-line{% endfilename %}

    Username for 'https://github.com': ola
    Password for 'https://ola@github.com':
    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/ola/my-first-blog.git
    
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

Tu código ahora está en GitHub. ¡Ve y verificalo! Encontrarás que algunas compañias como - [Django](https://github.com/django/django)[Django Girst Tutorial](https://github.com/DjangoGirls/tutorial), y muchas otros proyectos grandes de software libre están alojados en GitHub. :)

# Configurar nuestro blog en PythonAnywhere

## Regístrese para crear una cuenta en PythonAnywhere

> **Nota** Puede que ya hayas creado una cuenta en PythonAnywhere durante los paso de instalación. Si es así, no necesitas hacerlo de nuevo.

{% include "/deploy/signup_pythonanywhere.md" %}

## Configurar nuestra página en PythonAnywhere

Vuelve al [panel principal de PythonAnywhere](https://www.pythonanywhere.com/) al hacer click en el logo, y escoge la opción iniciar la consola "Bash" – esa es la versión de una línea de comando de PythonAnywhere, tal como la de tu computador.

![The 'New Console' section on the PythonAnywhere web interface, with a button for 'bash'](images/pythonanywhere_bash_console.png)

> **Nota** PythonAnywhere está basado en Linux, entonces si estás en Windows, la consola tendrá una apariencia diferente a la de tu computador.

Desplegar una aplicación web en PythonAnywhere involucra jalar tu codigo de GitHub y entonces configurar PythonAnywhere para reconocerlo y empezar a servirlo como una aplicación web. Hay maneras manuales de hacerlo, pero PythonAnywhere provee una herramienta de asistencia que lo hará todo por tí. Instalemos la herramienta primero:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip3.6 install --user pythonanywhere
    

Eso debería imprimir en pantalla algunas cadenas de texto como `Collecting pythonanywhere`, and eventually end with a line saying `Successfully installed (...) pythonanywhere- (...)`.

Ahora ejecutamos el asistente para configurar automáticamente nuestra aplicación desde GitHub. Escribe lo siguiente en la consola de PythonAnywhere (no te olvides de usar tu usuario de GitHub en lugar de `<your-github-username>`):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git
    

A medida que ves ejecutar, podrás ver lo que hace:

- Descarga tu código de GitHub
- Crea un virtualenv en PythonAnywhere, tal como el de tu PC
- Actualiza tus configuraciones con algunas configuraciones de despliegue
- Configura la base de datos en PythonAnywhere usando el comando `manage.py migrate`
- Configura tus archivos estáticos (aprenderemos acerca de estos luego)
- Y configura PythonAnywhere para publicar tu aplicación web por medio de su API

En PythonAnywhere todos esos pasos están automatizados, pero son los mismos pasos que tendrías que haber seguido en cualquier otro proveedor de servidor. Lo principal a notar ahora es que tu base de datos en PythonAnywhere está, en realidad, totalmente separada de la base de datos en tu propio PC—eso significa que puedes tener distintas publicaciones y cuentas de administración.

Como resultado, tal como hicimos en tu computador, necesitamos inicializar la cuenta de administrador con `createsuperuser`. PythonAnywhere ha activado automáticamente tu virtualenv, entonces todo lo que debes hacer es ejecutar:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

Inserta las credenciales para tu usuario admin. Mejor si usas las mismas que usas en tu computador, para evitar confusiones; a menos que quieras que la contraseña en PythonAnywhere sea más segura.

Ahora, si lo deseas, tambien puedes mirar tu código en PythonAnywhere usando `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  forms.py  migrations  models.py  static
    templates  tests.py  urls.py  views.py
    

You can also go to the "Files" tab and navigate around using PythonAnywhere's built-in file browser.

## You are now live!

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" tab to get a link to it. You can share this with anyone you want :)

> **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/2.0/howto/deployment/checklist/) for some tips on securing your site.

## Debugging tips

If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:

- Forgetting to create your PythonAnywhere API token.
- Making a mistake in your GitHub URL
- If you see an error saying *"Could not find your settings.py"*, it's probably because you didn't manage to add all your files to Git, and/or you didn't push them up to GitHub successfully. Have another look at the Git section above

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.

There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).

And remember, your coach is here to help!

# Check out your site!

The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet, just like that!