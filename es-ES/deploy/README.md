# ¡Lanza!

> **Nota** El siguiente capítulo puede ser, a veces, un poco difícil de seguir. Se persistente y acábalo. El despliegue es una parte importante del proceso en el desarrollo web. Este capítulo está situado en el medio del tutorial para que tu guía pueda ayudarte a poner tu sitio web en línea, lo que puede ser un proceso algo más complicado. Esto significa que podrás acabar el tutorial por tu cuenta si se te acaba el tiempo.

Hasta ahora, tu sitio sólo está disponible en tu computadora. ¡Ahora aprenderás como desplegarlo! El lanzamiento es el proceso de publicar tu aplicación en internet para que la gente pueda acceder y ver tu aplicación. :)

Como ya has aprendido, un sitio web tiene que estar en un servidor. There are a lot of server providers available on the internet, we're going to use [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere is free for small applications that don't have too many visitors so it'll definitely be enough for you now.

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
    
    nothing added to commit but untracked files present (use "git add" to track)
    

Y finalmente guardamos nuestros cambios. Ve a tu consola y ejecuta estos comandos:

{% filename %}command-line{% endfilename %}

    $ git add -all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
     ```
    
    
    ## Publicar ("Push") tu código en GitHub
    
    Ve a [GitHub.com](https://www.github.com) y crea una cuenta. (Si ya lo hiciste, excelente!). Deja desmarcada la opción "Initialize with a README", deja la opción .gitignore en blanco (ya lo hicimos a mano) y deja la licencia como "None".
    
    <img src="images/new_github_repo.png" />
    
    >**Nota** El nombre `my-first-blog` es importante, podrias escoger uno diferente pero, lo vamos a utilizar muchas veces en las instrucciones a continuación y, lo tendrías que cambiar cada vez. Probablemente te sea mas sencillo utilizar el nombre `my-first-blog`.
    
    En la siguiente pantalla, veras la URL para clonar tu repositorio. Escoge la version "HTTPS", cópialo, y, lo pegaremos en nuestra terminal en un momento:
    
    <img src="images/github_get_repo_url_screenshot.png" />
    
    Ahora tenemos que conectar el repositorio de Git en nuestro computador con el de GitHub.
    
    Escribe lo siguiente en tu terminal(sustituye `<your-github-username>` con el nombre de usuario que elegiste al crear tu cuenta de GitHub, pero sin los signos de mayor y menor):
    
    {% filename %}command-line{% endfilename %}
    

$ git remote add origin https://github.com/<your-github-username>/my-first-blog.git $ git push -u origin master

    <br />Digita tu nombre de usuario y contraseña de GitHub y deberías ver algo así:
    
    {% filename %}command-line{% endfilename %}
    

Username for 'https://github.com': hjwp Password for 'https://hjwp@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/hjwp/my-first-blog.git

- [new branch] master -> master Branch master set up to track remote branch master from origin.

    <br />&lt;!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension --&gt;
    
    Ahora tu codigo esta en GitHub. ¡Ve y míralo!  Verás que esta en buena compañía – [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), y muchos otros proyectos "open-source" también almacenan su código en GitHub. :)
    
    
    #Configurando tu blog en PythonAnywhere
    
    &gt;**Nota** Puede que ya hayas creado una cuenta en PythonAnywhere, de ser así, no tienes que volver a hacerlo.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ## Bajando nuestro código en PythonAnywhere
    
    Cuando te hayas subscrito a PythonAnywhere, te mostrarán tu dashboard o página "Consoles". Elige la opción para iniciar una consola "Bash". Esta es la versión PythonAnywhere de una consola, como la que tienes en tu Pc.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="pointing at Other: Bash in Start a new Console" /&gt;
    
    &gt; **Nota** PythonAnywhere esta basado en Linux entonces, si estas en Windows, la consola se vera diferente a la de tu computador.
    
    Vamos a descargar nuestro código de GitHub a PythonAnywhere mediante la creación de un "clone" de nuestro repositorio. Escribe lo siguiente en la consola de PythonAnywhere (no olvides usar tu nombre de usuario de GitHub en lugar de `&lt;your-github-username&gt;`):
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ git clone https://github.com/<your-github-username>/my-first-blog.git

    <br />Esto bajará una copia de tu código a PythonAnywhere. Revísalo escribiendo `tree my-first-blog`:
    
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

Text for Translation $ tree my-first-blog my-first-blog/ ├── blog │ ├── **init**.py │ ├── admin.py │ ├── migrations │ │ ├── 0001_initial.py │ │ └── **init**.py │ ├── models.py │ ├── tests.py │ └── views.py ├── manage.py └── mysite ├── **init**.py ├── settings.py ├── urls.py └── wsgi.py

    <br /><br />### Creando un virtualenv en PythonAnywhere. En la consola Bash, escribe:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$cs my-first-blog

$ virtualenv --python=python3.6 myvenv Running virtualenv with interpreter /usr/bin/python3.6 [...] Installing setuptools, pip...done.

$ source myvenv/bin/activate

(myvenv) $ pip install django~=1.11.0 Collecting django [...] Successfully installed django-1.11.3

    <br /><br />&gt;**Nota** La parte de `pip install` puede demorar un poco.  Paciencia, paciencia!  Pero si toma más de cinco minutos, algo anda mal.  Pregúntale a tu tutor.
    
    &lt;!--TODO: piensa en usar requirements.txt en vez de pip install.--&gt;
    
    ### Creando la base de datos en PythonAnywhere
    
    Aca hay otra diferencia entre to computador y el servidor: él usa una base de datos diferente. Entonces las cuentas de usuario y posts pueden ser diferentes en el servidor y en tu computador.
    
    Justo como lo hicimos en tu computador, volvemos a hacer el paso para iniciar la base de datos en el servidor, con 'migrate' y 'createsuperuser':
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(mvenv) $ python manage.py migrate Operations to perform: [...] Applying sessions.0001_initial... OK (mvenv) $ python manage.py createsuperuser

    <br />## Publicando nuestro blog como una aplicación web
    
    Ahora nuestro código esta en PythonAnywhere, nuestro virtualenv esta listo y, la base de datos esta prendida. Estamos listos para publicarlo como una aplicación web!
    
    Da click en el logo de PythonAnywhere para volver al panel principal, luego haz click en la pestaña **Web**. Finalmente, presiona **Add a new web app**.
    
    Después de confirmar tu nombre de dominio, escoge **manual configuration**(N.B.-*no* la opción "Django") en el dialogo. Luego escoge **Python3.6** y, da click en "Next" para finalizar.
    
    &gt;**Nota** Asegúrate de escoger la opción de "Manual configuration", no la de "Django". Molamos demasiado para el setup por defecto de Django en PythonAnywhere. ;-)
    
    ### Configurando el virtualenv
    
    Serás redirigido a la pantalla de configuración de tu aplicación web en PythonAnywhere, que es donde deberás ir cada que quieras hacer cambios a la aplicación en el servidor.
    
    &lt;img src="images/pythonanywhere_web_tab_virtualenv.png" /&gt;
    
    En la sección de "Virtualenv", da click en el texto rojo que dice "Enter the path to a virtualenv", e ingresa `/home/&lt;your-PythonAnywhere-username&gt;/my-first-blog/myvenv/`. Da click en el recuadro azul seleccionado para guardar el path (ruta) antes de continuar.
    
    &gt;**Nota** Cambia tu nombre de usuario de PythonAnywhere según corresponda. Si cometes un error, PythonAnywhere te mostrará una pequeña advertencia.
    
    
    ### Configurando el archivo WSGI
    
    Django trabaja usando el "protocolo WSGI", un estándar para servir sitios web usando Python, que PythonAnywhere soporta. El modo en que configuramos PythonAnywhere para reconocer nuestro blog de Django fue editando el archivo de configuración WSGI.
    
    Da click en el link "WSGI configuration file" (en la sección "Code" cerca del comienzo de la pagina - Se llamara algo como `/var/www/&lt;your-PythonAnywhere-username&gt;_PythonAnywhere_com_wsgi_py`), y serás redirigido a un editor.
    
    Borra todo el contenido y remplázalo con lo siguiente:
    
    {% filename %}&lt;your-username&gt;_pythonanywhere_com_wsgi.py{% endfilename %}
    ```python
    import os
    import sys
    
    path = os.path.expanduser('~/my-first-blog')
    if path not in sys.path:
        sys.path.append(path)
    
    os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'
    
    from django.core.wsgi import get_wsgi_application
    from django.contrib.staticfiles.handlers import StaticFilesHandler
    application = StaticFilesHandler(get_wsgi_application())
    

El trabajo de este fichero es decirle a PythonAnywhere donde se encuentra nuestra aplicación web y como se llama el archivo con la configuración de Django.

El `StaticFilesHandler` se encarga de nuestro CSS. Esto es realizado de manera automática durante el desarrollo local por el comando `runserver`. Aprenderemos un poco más sobre los archivos estáticos más adelante, cuando editemos el CSS de nuestro sitio.

Dale a **Save** y vuelve a la pestaña **Web**.

¡Todo listo! Dale al botón verde grande que dice **Reload** y podrás ver tu aplicación. Verás un enlace a ella en la parte de arriba de la página.

## Consejos de depuración

Si ves un error cuando intentas visitar tu página, el primer lugar donde buscar información de depuración es el **registro de errores**. Encontrarás un enlace a él en la [pestaña Web](https://www.pythonanywhere.com/web_app_setup/) de PythonAnywhere. Mira si hay algún mensaje de error ahí. Los más recientes están al final. Los problemas más comunes incluyen:

- Olvidar uno de los pasos que hicimos en la consola: crear el virtualenv, activarlo, instalarle Django, migrar la base de datos.

- Cometer un error en la ruta ("path") del virtualenv en la pestaña "Web" - usualmente ahi habrá un pequeño mensaje de error rojo, si es que hay un problema.

- Cometer un error en la configuración del archivo WSGI - estas seguro que introdujiste bien la ruta "path" de tu carpeta my-first-blog?

- ¿Elegiste la misma versión de Python para el virtualenv y para la aplicación web? Ambas deberían ser 3.6.

Hay algunos [consejos generales de depuración en el wiki de Pythonanywhere](https://www.pythonanywhere.com/wiki/DebuggingImportError).

Y recuerda, ¡tu tutora está ahí para ayudarte!

# ¡Estás en vivo!

La página predeterminada para tu sitio web debería decir "Bienvenido a Django", al igual que lo hace en tu computadora. Intenta agregar `/admin/` al final de la URL y te redirigirá al panel de administración. Ingresa con tu nombre de usuario y contraseña y verás que puedes añadir nuevas entradas en el servidor.

Una vez hayas creado algunos posts, puedes regresar a tu setup local (no PythonAnywhere). De aquí en adelante deberías trabajar en tu setup local para hacer cambios. Este es un flujo de trabajo común en desarrollo web - haz cambios localmente, empuja esos cambios a github y, lleva tus cambios a tu servidor web. Esto te permite trabajar y experimentar sin dañar tu sitio web. Asombroso, no te parece?

¡Date una *GRAN* palmada en la espalda! Los despliegues en el servidor son una de las partes más complejas del desarrollo web y muchas veces a la gente le cuesta varios días tenerlo funcionando. Pero tú tienes tu sitio en vivo, en Internet de verdad, ¡así como suena!