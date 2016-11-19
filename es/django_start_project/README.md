# ¡Tu primer proyecto en Django!

> Parte de este capitulo esta basado en los tutoriales de Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Parte de este capítulo se basa en el [django-marcador tutorial][1] bajo licencia de Creative Commons Attribution-ShareAlike 4.0 internacional. El tutorial de django-marcador tiene derechos de autor de Markus Zapke-Gündemann et al.

 [1]: http://django-marcador.keimlink.de/

¡Vamos a crear un simple blog!

El primer paso para crearlo es iniciar un nuevo proyecto en Django. Básicamente, esto significa que podrás correr algunos scripts proporcionados por Django que crearán el esqueleto de un proyecto para nosotros: un montón de directorios y archivos que vamos a utilizar más adelante.

Los nombres de algunos archivos y directorios son muy importantes para Django. No deberías renombrar los archivos que estamos a punto de crear. Moverlos a un lugar diferente tampoco es una buena idea. Django tiene que mantener una cierta estructura para ser capaz de encontrar cosas importantes.

> Recuerda correr todo en el virtualenv. Si no ves un prefijo `(myvenv)` en tu consola necesitas activar tu virtualenv. Explicamos cómo hacer eso en el capítulo de **Instalación de Django** en la sección **Trabajando con virtualenv**. Puedes hacerlo escribiendo el siguiente comando: `myvenv\Scripts\activate` en Windows o `source myvenv/bin/activate` en Mac OS / Linux.
> 
> **Nota** Verifica dos veces que hayas incluido el punto (`.`) al final del comando, es importante porque le dice al script que instale Django en el directorio actual.

En la consola debes ejecutar (recuerda no escribir `(myvenv) ~/djangogirls$`, ¿ok?):

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

En Windows:

    (myvenv) C:\Users\Name\djangogirls> django-admin.py startproject mysite .
    
> **Nota** Verifica dos veces que hayas incluido el punto (`.`) al final del comando, es importante porque le dice al script que instale Django en el directorio actual.

`django-admin.py` es un script que creará los archivos y directorios para ti. Ahora deberías tener una estructura de directorios parecida a esto:

    djangogirls
    ├───manage.py
    └───mysite
            settings.py
            urls.py
            wsgi.py
            __init__.py
    

`manage.py` es un script que ayuda con la administración del sitio. Con ello podremos iniciar un servidor web en nuestro ordenador sin necesidad de instalar nada más, entre otras cosas.

El archivo `settings.py` contiene la configuración de tu sitio web.

¿Recuerdas cuando hablamos de un cartero que debía comprobar donde entregar una carta? El archivo `urls.py` contiene una lista de los patrones utilizados por `urlresolver`.

Ignoremos los otros archivos por ahora - no los cambiaremos. ¡Lo único que debes recordar es no borrarlos por accidente!

## Cambiando la configuración

Vamos a hacer algunos cambios en `mysite/settings.py`. Abre el archivo usando el editor de código que has instalado anteriormente.

Sería bueno tener el horario correcto en nuestro sitio web. Ve a la [lista de husos horarios de Wikipedia][2] y copia tu zona horaria (TZ). (por ejemplo, `Europe/Berlin` )

 [2]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

En settings.py, encuentra la línea que contiene `TIME_ZONE` y modifícala para elegir tu propia zona horaria:

``` python
    TIME_ZONE = 'Europe/Berlin'
```

Modificando "Europe/Berlin" como corresponda

También necesitaremos agregar una ruta para los archivos estáticos (aprenderemos todo sobre los archivos estáticos y CSS más tarde en este tutorial). Ve hacia abajo hasta el *final* del archivo, y justo por debajo de la entrada `STATIC_URL`, agrega una nueva llamada `STATIC_ROOT`:

``` python
    STATIC_URL = '/static/'
    STATIC_ROOT = os.path.join(BASE_DIR, 'static') 
```

## Configurar una base de datos

Hay una gran variedad de opciones de bases de datos para almacenar los datos de tu sitio. Utilizaremos el que viene por defecto, `sqlite3`.

Esto ya está configurado en esta parte de tu archivo `mysite/settings.py`:

``` python
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }
```

Para crear una base de datos para nuestro blog, ejecutemos lo siguiente en la consola: `python manage.py migrate` (necesitamos estar en el directorio de `djangogirls` que contiene el archivo `manage.py`). Si eso va bien, deberías ver algo así:

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Apply all migrations: admin, contenttypes, auth, sessions
    Running migrations:
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying sessions.0001_initial... OK
    

¡Y listo! ¡Es hora de iniciar el servidor web y ver si nuestro sitio web está funcionando!

Debes estar en el directorio que contiene el archivo `manage.py` (en la carpeta `djangogirls`). En la consola, podemos iniciar el servidor web ejecutando `python manage.py runserver`:

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Ahora todo lo que debes hacer es verificar que tu sitio esté corriendo - abre tu navegador (Firefox, Chrome, Safari, Internet Explorer o el que utilices) e ingresa la dirección:

    http://127.0.0.1:8000/
    

El servidor web se apropiará de tu consola hasta que lo termines manualmente: para tipear más comandos o abres una nueva terminal (y no te olvides de activar tu virtualenv allí también), o frena el servidor web yendo a la consola en la que está corriendo y presionando Ctrl+C - las teclas Control y C juntas (en Windows, deberás presionar Ctrl + Break).

¡Felicitaciones! ¡Has creado tu primer sitio web y lo has ejecutado usando un servidor web! ¿No es genial?

![¡Funcionó!][3]

 [3]: images/it_worked2.png

¿Lista para el próximo paso? ¡Es momento de crear algo de contenido!
