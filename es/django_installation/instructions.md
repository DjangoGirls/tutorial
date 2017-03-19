> Parte de esta sección está basada en tutoriales de Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

> Parte de esta sección se basada en el [django-marcador tutorial](http://django-marcador.keimlink.de/) bajo licencia Creative Commons Attribution-ShareAlike 4.0 internacional. El tutorial de django-marcador tiene derechos de autor de Markus Zapke-Gündemann et al.


## Entorno virtual

Antes de instalar Django, instalaremos una herramienta extremadamente útil que ayudará a mantener tu entorno de desarrollo ordenado en tu computadora. Es posible saltarse este paso, pero es altamente recomendable. ¡Empezar con la mejor configuración posible te ahorrará muchos problemas en el futuro!

Así que, vamos a crear un **entorno virtual** (también llamado un *virtualenv*). Virtualenv aísla tu configuración de Python/Django por cada proyecto. Esto quiere decir que cualquier cambio que hagas en un sitio web no afectará a ningún otro que estés desarrollando. Genial, ¿no?

Todo lo que necesitas hacer es encontrar un directorio en el que quieras crear el `virtualenv`; tu directorio home, por ejemplo. En Windows puede verse como `C:\Users\Name` (donde `Name` es el nombre de tu usuario).

> __NOTA:__ En Windows, asegúrate que este directorio no contenga acentos ni caracteres especiales; si tu nombre contiene acentos, utiliza un directorio diferente, por ejemplo `C:\djangogirls`.

Para este tutorial usaremos un nuevo directorio `djangogirls` en tu directorio home:

{% filename %}Terminal{% endfilename %}
```
$ mkdir djangogirls
$ cd djangogirls
```

Haremos un virtualenv llamado `myvenv`. El comando general estará en el formato:

{% filename %}Terminal{% endfilename %}
```
$ python3 -m venv myvenv
```

<!--sec data-title="Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Para crear un nuevo `virtualenv`, debes abrir la consola (te lo indicamos unos cuantos capítulos antes, ¿recuerdas?) y ejecuta `C:\Python35\python -m venv myvenv`. Se verá así:

{% filename %}Terminal{% endfilename %}
```
C:\Users\Name\djangogirls> C:\Python35\python -m venv myvenv
```

en donde `C:\Python35\python` es el directorio en el que instalaste Python previamente y `myvenv` es el nombre de tu `virtualenv`. Puedes utilizar cualquier otro nombre, pero asegúrate de usar minúsculas y no usar espacios, acentos o caracteres especiales. También es una buena idea mantener el nombre corto. ¡Vas a referirte a él mucho!

<!--endsec-->

<!--sec data-title="Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Crear un `virtualenv` en Linux y OS X es tan simple como ejecutar `python3 -m venv myvenv`.
Se verá así:

{% filename %}Terminal{% endfilename %}
```
$ python3 -m venv myvenv
```

`myvenv` es el nombre de tu `virtualenv`. Puedes usar cualquier otro nombre, pero sólo utiliza minúsculas y no incluyas espacios. También es una buena idea mantener el nombre corto. ¡Vas a referirte muchas veces a él!

> __NOTA:__ En algunas versiones de Debian/Ubuntu quizás recibas el siguiente error:

>{% filename %}Terminal{% endfilename %}
>```
>The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>    apt-get install python3-venv
>You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>```
>
> En este caso, siguie las instrucciones mencionadas arriba e instala el paquete `python3-venv` así:
>{% filename %}Terminal{% endfilename %}
>```
>$ sudo apt-get install python3-venv
>```  

> __NOTA:__ En algunas versiones de Debian/Ubuntu inicializar el entorno virtual puede producir el siguiente error:

>{% filename %}Terminal{% endfilename %}
>```
>Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>```

> Para solucionar esto, usa el comando `virtualenv` en cambio.

>{% filename %}Terminal{% endfilename %}
>```
>$ sudo apt-get install python-virtualenv
>$ virtualenv --python=python3.5 myvenv
>```

> __NOTA:__ Si obtienes un error como este

>{% filename %}Terminal{% endfilename %}
>```
>E: Unable to locate package python3-venv
>```

> intenta ejecutar el siguiente comando en cambio:
>
>{% filename %}Terminal{% endfilename %}
>```
>sudo apt install python3.5-venv
>```

<!--endsec-->

## Trabajar con virtualenv

El comando anterior creará un directorio llamado `myvenv` (o cualquier nombre que hayas elegido) que contiene nuestro entorno virtual (básicamente un montón de archivos y carpetas).

<!--sec data-title="Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Inicia el entorno virtual ejecutando:

{% filename %}Terminal{% endfilename %}
```
C:\Users\Name\djangogirls> myvenv\Scripts\activate
```

> __NOTA:__ en Windows 10 quizás obtengas un error en la consola Window PowerShell diciendo `execution of scripts is disabled on this system`. En ese caso, abre otra ventana Windows PowerShell con la opción "Run as Administrator". Luego intenta escribir lo siguiente antes de iniciar tu entorno virtual:
>
>{% filename %}Terminal{% endfilename %}
>```
>C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>     Execution Policy Change
>     The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>```

<!--endsec-->


<!--sec data-title="Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Inicia el entorno virtual ejecutando:

{% filename %}Terminal{% endfilename %}
```
$ source myvenv/bin/activate
```

¡Recuerda reemplazar `myvenv` con tu nombre de `virtualenv` que hayas elegido!

> __NOTA:__ a veces `source` podría no estar disponible. En ese caso trata hacerlo de esta forma:
>
>{% filename %}Terminal{% endfilename %}
>```
>$ . myvenv/bin/activate
>```

<!--endsec-->

Sabrás que tienes `virtualenv` iniciado cuando veas que la línea de comando tiene este prefijo `(myvenv)`.

Cuando trabajes en un entorno virtual, `python` automáticamente se referirá a la versión correcta, de modo que puedes utilizar `python` en vez de `python3`.

OK, tenemos todas las dependencias importantes en su lugar. ¡Finalmente podemos instalar Django!

## Instalar Django

Ahora que tienes tu `virtualenv` iniciado, puedes instalar Django.

Antes de hacer eso, deberíamos asegurarnos de que tenemos la última version de `pip`, el programa que usamos para instalar Django:

{% filename %}Terminal{% endfilename %}
```
(myvenv) ~$ pip install --upgrade pip
```

Luego ejecuta `pip install django~=1.10.0` (nota que usamos la tilde seguido de un signo igual: `~=`) para instalar Django.

{% filename %}Terminal{% endfilename %}
```
(myvenv) ~$ pip install django~=1.10.0
Collecting django~=1.10.0
  Downloading Django-1.10.4-py2.py3-none-any.whl (6.8MB)
Installing collected packages: django
Successfully installed django-1.10.4
```

<!--sec data-title="Windows" data-id="django_err_windows"
data-collapse=true ces-->

> Si obtienes un error al ejecutar pip en Windows comprueba si la ruta de tu proyecto contiene espacios, acentos o caracteres especiales (por ejemplo, `C:\Users\User Name\djangogirls`). Si lo tiene, por favor considera moverla a otro lugar sin espacios, acentos o caracteres especiales (sugerencia: `C:\djangogirls`). Crea un nuevo entorno virtual en ese directorio, luego elimina el viejo y vuelve a probar el comando anterior (mover el directorio del virtualenv no funcionará debido a que virtualenv usa rutas absolutas)

<!--endsec-->

<!--sec data-title="Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Tu línea de comandos quizás se congele luego de que intentas instalar Django. Si esto sucede, intenta este comando en cambio:
>
>{% filename %}Terminal{% endfilename %}
>```
>C:\Users\Name\djangogirls> python -m pip install django~=1.10.0
>```

<!--endsec-->

<!--sec data-title="Linux" data-id="django_err_linux"
data-collapse=true ces-->


> Si obtienes un error al ejecutar pip en Ubuntu 12.04 ejecuta `python -m pip install -U ---force-resintall pip` para arreglar la instalación de pip en el virtualenv.

<!--endsec-->

¡Eso es todo! Ahora estás lista (por fin) para crear una aplicación Django!
