# Deploy!

> **Nota** El siguiente capítulo puede ser un poco difícil de seguir a veces. Se persistente y acábalo. El despliegue es una parte importante del proceso en el desarrollo web. Este capítulo está situado a la mitad del tutorial, de esta manera tu mentor puede ayudarte en el proceso de poner tu sitio web en línea. Esto significa que podrás acabar el tutorial por tu cuenta si se te acaba el tiempo.

Hasta ahora tu sitio web estaba disponible sólo en tu ordenador, ahora aprenderás como desplegarlo! El despliegue es el proceso de publicar tu aplicación en internet para que la gente pueda acceder y ver tu aplicación :).

Como ya has aprendido, un sitio web tiene que estar en un servidor. Hay un montón de proveedores, pero usaremos el que tiene el proceso de despliegue más sencillo: [Heroku][1]. Heroku es gratis para pequeñas aplicaciones que no tienen demasiadas visitas, será más que suficiente por ahora.

 [1]: http://heroku.com/

Seguiremos este tutorial: https://devcenter.heroku.com/articles/getting-started-with-django, pero lo hemos copiado a continuación para que sea más fácil para ti.

## El fichero `requirements.txt`

Necesitamos crear un fichero de requisitos `requirements.txt` para decirle a Heroku que paquetes Python necesitan ser instalados en nuestro servidor.

Pero primero Heroku necesita que instalemos unos cuantos paquetes. Ves a tu consola con `virtualenv` activado y escribe esto:

    (myvenv) $ pip install dj-database-url waitress whitenoise
    

Cuando haya acabado la instalación, ves al directorio `djangogirls` y ejecuta el siguiente comando:

    (myvenv) $ pip freeze > requirements.txt
    

Esto creará un fichero llamado `requirements.txt` con la lista de los paquetes que tienes instalados (i.e. librerías Python que estés utilizando, por ejemplo Django :)).

> **Nota**: `pip freeze` devuelve una lista de todas las librerías Python instaladas en tu virtualenv y `>` toma la salida de `pip freeze` y la pone en un fichero. Prueba a ejecutar `pip freeze` sin el `> requirements.txt` para ver que pasa!

Abre este archivo y añade la siguiente línea al final:

    psycopg2==2.5.3
    

Esta línea es necesaria para que tu aplicación funcione en Heroku.

## Procfile

Otra cosa que necesitamos crear es un Procfile. Eso ayudará a Heroku a saber que comandos debe ejecutar para poner en marcha nuestro sitio web. Abre tu editor de código, crea un fichero llamado `Procfile` en el directorio `djangogirls` y añade esta línea:

    web: waitress-serve --port=$PORT mysite.wsgi:application
    

Esta línea quiere decir que vamos a desplegar una aplicación `web` y para hacerlo ejecutaremos el comando `waitress-serve --port=$PORT mysite.wsgi:application` (`waitress-serve` es un programa que es como una versión más potente que el comando de Django `runserver`).

Ahora salva los cambios. Hecho!

## El fichero `runtime.txt`

Tenemos que decirle a Heroku que versión de Python queremos utilizar. Esto se hace creando un fichero `runtime.txt` en el directorio `djangogirls` usando el comando de tu editor "new file" y poniendo el siguiente texto (y nada más!) en él:

    python-3.4.2
    

## mysite/local_settings.py

Hay diferencias entre la configuración que utilizamos en local (en nuestro ordenador) y la configuración para nuestro servidor. Heroku utiliza una base de datos y tu ordenador utiliza otra diferente. Por eso necesitamos crear ficheros separados para la configuración de nuestro entorno local.

Crea el fichero `mysite/local_settings.py`. Debería contener la configuración de la `BASE DE DATOS` de tu fichero `mysite/settings.py`. Simplemente como esto:

    import os
    BASE_DIR = os.path.dirname(os.path.dirname(__file__))
    
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }
    
    DEBUG = True
    

Ahora guarda los cambios! :)

## mysite/settings.py

Otra cosa que tenemos que hacer es modificar el fichero `settings.py` de nuestro sitio web. Abre `mysite/settings.py` en tu editor y añade las siguientes líneas al final del fichero:

    import dj_database_url
    DATABASES['default'] =  dj_database_url.config()
    
    SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
    
    ALLOWED_HOSTS = ['*']
    
    STATIC_ROOT = 'staticfiles'
    
    DEBUG = False
    

Al final del fichero `mysite/settings.py`, copia y pega esto:

    try:
        from .local_settings import *
    except ImportError:
        pass
    

Esto importará tu configuración local si el fichero existe.

Ahora guarda los cambios.

## mysite/wsgi.py

Abre el fichero `mysite/wsgi.py` y añade estas líneas al final:

    from whitenoise.django import DjangoWhiteNoise
    application = DjangoWhiteNoise(application)
    

Genial!

## Cuenta Heroku

Necesitas instalar Heroku toolbelt, puedes encontrarlo aquí (puedes saltarte la instalación si ya lo has instalado durante la configuración): https://toolbelt.heroku.com/

> Cuando estés ejecutando la instalación de Heroku toolbel en Windows asegúrate de escoger la "Instalación personalizada" cuando te pregunte por los componentes que quieres instalar. En la lista de componentes que te aparecerá, selecciona adicionalmente la casilla de "Git and SSH".
> 
> En Windows también debes ejecutar el siguiente comando para añadir Git y SSH a tu ruta `PATH`: `setx PATH "%PATH%;C:\Program Files\Git\bin"`. Reinicia la consola de línea de comandos después para que los cambios se hagan efectivos.

Por favor, crea también una cuenta gratis Heroku en: https://id.heroku.com/signup/www-home-top

Ahora autentícate en tu cuenta de Heroku en tu ordenador ejecutando el siguiente comando:

    $ heroku login
    

En el caso de no tener una clave SSH, este comando creará una automáticamente. Las claves SSH son necesarias para subir el código a Heroku.

## Git

Git es un sistema de control de versiones que usan muchos programadores-software que guarda el registro de cambios en el tiempo de un fichero o un conjunto de ficheros de manera que puedes volver a una versión anterior en el futuro. Heroku utiliza un repositorio git para administrar los ficheros de tus proyectos, así que también tenemos que utilizarlo.

Crea un fichero llamado `.gitignore` en tu directorio `djangogirls` con el siguiente contenido:

    myvenv
    __pycache__
    staticfiles
    local_settings.py
    db.sqlite3
    

y guarda los cambios. El punto al principio del nombre del fichero es importante! Como puedes ver, ahora le estamos diciendo a Heroku que ignore el fichero `local_settings.py` y no lo descargue, para que esté disponible solamente en tu ordenador (en local).

A continuación crearemos un nuevo repositorio git y guardaremos nuestros cambios. Ve a la consola y ejecuta los siguientes comandos:

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config user.name "Your Name"
    $ git config user.email you@example.com
    

Solo necesitamos inicializar el repositorio git una única vez por proyecto.

Y finalmente guardamos nuestros cambios. Ve a la consola y ejecuta estos comandos:

    $ git add -A .
    $ git commit -m "My Django Girls app"
    [master (root-commit) 2943412] My Django Girls
     7 files changed, 230 insertions(+)
     create mode 100644 .gitignore
     create mode 100644 Procfile
     create mode 100644 mysite/__init__.py
     create mode 100644 mysite/settings.py
     create mode 100644 mysite/urls.py
     create mode 100644 mysite/wsgi.py
     create mode 100644 manage.py
     create mode 100644 requirements.txt
     create mode 100644 runtime.txt
    

## Escoge un nombre de aplicación

Tu blog estará disponible en la Web en `[el nombre de tu blog].herokuapp.com`, así que necesitas escoger un nombre que nadie haya cogido anteriormente. Este nombre no tiene porque estar relacionado con la aplicación `blog` de Django ni con `mysite` ni con nada de lo que hemos creado anteriormente. El nombre puede ser el que tu quieras, pero Heroku es un poco estricto en cuanto a los caracteres que puedes utilizar: solo puedes usar caracteres simples en minúscula (ni mayúsculas ni acentos) números y guiones (`-`).

Una vez hayas pensado en un nombre (quizás algo con tu nombre o tu alias), ejecuta este comando, remplazando `djangogirlsblog` con el nombre de tu aplicación:

    $ heroku create djangogirlsblog
    

> **Nota**: Recuerda que tienes que reemplazar `djangogirlsblog` con el nombre de tu aplicación en Heroku.

Si no se te ocurre ningún nombre, puedes ejecutar

    $ heroku create
    

y Heroku escogerá un nombre para ti (probablemente algo como `enigmatic-cove-2527`).

Si en algún momento quisieras cambiar el nombre de tu aplicación Heroku, puedes hacerlo ejecutando el siguiente comando (reemplazando `tu-nuevo-nombre` por el nuevo nombre que quieras utilizar):

    $ heroku apps:rename tu-nuevo-nombre
    

> **Nota**: Recuerda que después de haber cambiado el nombre de tu aplicación, tienes que acceder `el nuevo nombre].herokuapp.com` para ver tu sitio web.

## Despliegue en Heroku!

Hemos hecho un montón de configuración e instalación, verdad? Pero sólo tienes que hacer esto una única vez! Ahora ya puedes hacer el depliegue!

Cuando ejecutaste `heroku create`, automáticamente se añadió el Heroku remoto para nuestra aplicación a nuestro repositorio. Ahora podemos hacer un simple <0>git push</0> para desplegar nuestra aplicación:

    $ git push heroku master
    

> **Nota**: Esto probablemente producirá una salida *muy larga* la primera vez, porque Heroku compila e instala psycopg. Sabrás que todo ha ido bien si ves algo como `https://elnombre detuaplicacion.herokuapp.com/ deployed to Heroku` hacia el final de la salida.

## Accede a tu aplicación

Ya has desplegado tu código en Heroku y has especificado el tipo de proceso en un `Procfile` (especificamos un proces de tipo `web` anteriormente). Ahora ya podemos decirle a Heroku que inicie este `proceso web`.

Para hacer esto, ejecuta el siguiente comando:

    $ heroku ps:scale web=1
    

Esto le dice a Heroku que ejecute sólo una instancia de nuestro proceso `web`. Como la aplicación de nuestro blog es bastante sencilla, no necesitamos demasiado así que es suficiente ejecutar un solo proceso. Es posible decirle a Heroku que ejecute más procesos (por cierto, Heroku llama a estos procesos "Dynos" así que no te sorprendas si ves este término) pero entonces ya no será gratis.

Ahora podemos acceder a la aplicación en nuestro navegador con `heroku open`.

    $ heroku open
    

> **Nota**: Verás una página de error! Hablaremos de esto en seguida

Esto abrirá una url como [https://djangogirlsblog.herokuapp.com/]() en tu navegador y probablemente verás una página de error. Como de momento sólo hemos creado la vista de administración para la aplicación, añade `admin/` a la url (i.e. [https://djangogirlsblog.herokuapp.com/admin/]()) para poder ver una versión de tu aplicación web funcionando.

El error que veías era debido a que cuando desplegamos en Heroku creamos una nueva base de dados y ésta está vacía. Necesitamos ejecutar el comando ~~~ migrate~~~ como hicimos cuando empezamos nuestro proyecto para configurar nuestra base de datos correctamente:

    $ heroku run python manage.py migrate
    
    $ heroku run python manage.py createsuperuser
    

Ahora deberías poder acceder a tu sitio web desde el navegador! Felicidades :)!