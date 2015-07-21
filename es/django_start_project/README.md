# Tu primer proyecto en Django!

> Parte de este capitulo esta basado en los tutoriales de Geek Girls Carrots (http://django.carrots.pl/) y
> en el [django-marcador tutorial][1] bajo licencia de Creative Commons Attribution-ShareAlike 4.0 internacional. El tutorial de django-marcador tiene derechos de autor de Markus Zapke-Gündemann et al.

 [1]: http://django-marcador.keimlink.de/

Vamos a crear un simple blog!

El primer paso para crearlo es iniciar un nuevo proyecto en Django, esto significa que podrás ejecutar los scripts proporcionados por Django en el esqueleto del proyecto que nos ha creado o dicho en otras palabras: un montón de directorios y archivos que vamos a utilizar más adelante.

Los nombres de algunos archivos y directorios son muy importantes para Django, no deberías renombrarlos ni moverlos a un lugar diferente, ya que Django mantiene una cierta estructura para ser capaz de encontrarlos.

Al lío! En la consola debes ejecutar (Recuerde de no escribir el "prompt" -> `(myvenv) ~/djangogirls$` <-, solo lo que está después de "$", OK? :D ):

> Recuerda correr todo en el entorno virtual. Si no ves un prefijo `(myvenv)` en tu consola, entonces necesitas activar tu virtualenv. Explicamos cómo hacer eso en el capítulo de **instalación de Django** en el capitulo **Trabajando con virtualenv**.

Ejecutar en Windows:

    (myvenv) ~/djangogirls$ python myvenv\Scripts\django-admin.py startproject mysite .
    

o en Linux o Mac OS:

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> **Nota** Verifica que incluiste el punto (`.`) al final del comando, es importante, este punto indica que donde queremos crear el proyecto es en el directorio en el que estamos.

`django-admin` es un script que creará los archivos y directorios para ti. Ahora debes tener un directorio de la estructura que se parece a esto:

    djangogirls
    ├───manage.py
    └───mysite
            settings.py
            urls.py
            wsgi.py
            __init__.py
    

`manage.py` es un script que ayuda con la administración del sitio. Con ello podremos iniciar un servidor web en nuestro ordenador sin necesidad de instalar nada, entre otras cosas.

El archivo `settings.py` contiene la configuración de tu sitio Web.

¿Recuerdas cuando hablamos de un cartero que debía comprobar donde entregar una carta? `URLs.py` contiene una lista de los patrones utilizados por `urlresolver`.

Ignoremos los otros archivos por ahora, no los cambiaremos. Lo único que debes recordar es no borrarlos por accidente!

## Cambiando la configuración

Vamos a hacer algunos cambios en `mysite/settings.py`. Abre el archivo usando el editor de código que has instalado anteriormente.

Sería bueno tener la hora correcta en nuestra página web. Vaya a http://en.wikipedia.org/wiki/List_of_tz_database_time_zones y copia tu zona horaria correspondiente (TZ). (eg. `Europe/Berlin`)

Encuentra las líneas que contienen `USE_TZ` y `TIME_ZONE` y modificalas para parecerse a esto, sustituyendo `Europe/Berlin` con tu zona horaria correspondiente:

    USE_TZ = False
    TIME_ZONE = 'Europe/Berlin'
    

## Configurar una base de datos

Hay un montón de software de base de datos diferente que puede almacenar datos para tu sitio. Utilizaremos uno por defecto, `sqlite3`.

Este ya está configurado en esta parte del archivo `mysite/settings.py`:

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }
    

Para crear una base de datos para nuestro blog, hagamos lo siguiente en la consola: `python manage.py migrate` (tenemos que estar en el directorio `djangogirls` que contiene el archivo `manage.py`). Si todo va bien, deberías ver algo como esto:

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Apply all migrations: admin, contenttypes, auth, sessions
    Running migrations:
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying sessions.0001_initial... OK
    

Y terminamos! Tiempo para iniciar el servidor web y ver si está funcionando nuestro sitio web!

Tienes que estar en el directorio que contiene el archivo `manage.py` (el directorio `djangogirls`). En la consola, podemos empezar el servidor web mediante la ejecución de `python manage.py runserver`:

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Ahora todo lo que necesitas hacer es verificar que tu sitio web esté ejecutándose, abre tu navegador (Firefox, Chrome, Safari, Internet Explorer o lo que utilices) e introduce la dirección:

    http://127.0.0.1:8000/
    

Como el proceso no está en segundo plano, nuestro terminal de comando estará ocupado por él hasta que lo detengamos: para escribir más comandos abre una nueva ventana de terminal (y no te olvides de activar tu virtualenv en él también), o detener el servidor web presionando CTRL + C (en Windows, tendrás que presione Ctrl+Enter).

¡Felicidades! Has creado tu primer sitio web y ejecutado un servidor web. ¿No es genial?

![¡Funcionó!][2]

 [2]: images/it_worked2.png

¿Listo para el siguiente paso? Es hora de crear algo de contenido!
