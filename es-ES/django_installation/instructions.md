> Parte de esta sección está basada en tutoriales por Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Parte de este capítulo está basada en el [django-marcador tutorial](http://django-marcador.keimlink.de/) bajo la licencia Creative Commons Attribution-ShareAlike 4.0 internacional. El tutorial de django-marcador tiene derechos de autor de Markus Zapke-Gündemann et al.

## Entorno virtual

Antes de instalar Django, instalaremos una herramienta extremadamente útil que ayudará a mantener tu entorno de desarrollo ordenado en tu computadora. Es posible saltarse este paso, pero es altamente recomendable. ¡Empezar con la mejor configuración posible te ahorrará muchos problemas en el futuro!

Así que, vamos a crear un **entorno virtual** (también llamado un *virtualenv*). Virtualenv aísla tu configuración de Python/Django por cada proyecto. Esto quiere decir que cualquier cambio que hagas en un sitio web no afectará a ningún otro que estés desarrollando. Genial, ¿no?

Todo lo que necesitas hacer es encontrar un directorio en el que quieras crear el `virtualenv`; tu directorio home, por ejemplo. En Windows, puede verse como `C:\Users\Name` (donde `Name` es el nombre de tu usuario).

> **NOTA:** En Windows, asegúrate de que este directorio no contiene caracteres especiales o acentuados; si tu nombre de usuario contiene caracteres acentuados, usa un directorio distinto, por ejemplo `C:\djangogirls`.

Para este tutorial usaremos un nuevo directorio `djangogirls` en tu directorio home:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Haremos un virtualenv llamado `myvenv`. El comando general estará en el formato:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Para crear un nuevo `virtualenv`, necesitas abrir una terminal "command prompt" y ejecutar `python -m venv myvenv`. Se verá así:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Donde `myvenv` es el nombre de tu `virtualenv`. Puedes utilizar cualquier otro nombre, pero asegúrate de usar minúsculas y no usar espacios, acentos o caracteres especiales. También es una buena idea mantener el nombre corto. ¡Vas utilizarlo muchas vecesl!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Podemos crear un `virtualenv` en Linux y OS X, es tan sencillo como ejecutar `python3 -m venv myvenv`. Se verá así:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` es el nombre de tu `virtualenv`. Puedes usar cualquier otro nombre, pero sólo utiliza minúsculas y no incluyas espacios. También es una buena idea mantener el nombre corto. ¡Vas a referirte muchas veces a él!

> **NOTA:** En algunas versiones de Debian/Ubuntu, puede que obtengas el siguiente error:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  En sistemas Debian/Ubuntu, tendrás que instalar el paquete python3-venv usando el siguiente comando.
>        apt-get install python3-venv
>     Puede que tengas que usar sudo con este comando.  Después de instalar el paquete python3-venv, vuelve a crear tu entorno virtual.
>     
> 
> En este caso, sigue las instrucciones anteriores e instala el paquete `python3-venv`: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **NOTA:** En algunas versiones de Debian/Ubuntu inicializar el entorno virtual de esta manera da el siguiente error:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Para evitar esto, utiliza directamente el comando `virtualenv`.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python{{ book.py_version }} myvenv
>     
> 
> **NOTA:** Si obtienes un error como
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> entonces ejecuta:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python{{ book.py_version }}-venv
>     

<!--endsec-->

## Trabajar con virtualenv

El comando anterior creará un directorio llamado `myvenv` (o cualquier nombre que hayas elegido) que contiene nuestro entorno virtual (básicamente un montón de archivos y carpetas).

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Inicia el entorno virtual ejecutando:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **Nota:** en 10 de Windows puedes obtener un error en Windows PowerShell que dice `execution of scripts is disabled on this system`. En este caso, abre otro Windows PowerShell con la opción "Ejecutar como administrador". Luego intenta escribir el siguiente comando antes de inicializar tu entorno virtual:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32 > Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>        Execution Policy Change
>        The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

<!-- (This comment separates the two blockquote blocks, so that GitBook and Crowdin don't merge them into a single block.) -->

> **NOTE:** For users of the popular editor VS Code, which come with an integrated terminal based off windows PowerShell, if you wish to stick with the integrated terminal, you may run the following command to activate your virtual environment:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> La ventaja es que tu no tienes que cambiar las ventanas entre el editor de código y la línea de comandos

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Inicia el entorno virtual ejecutando:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

¡Recuerda reemplazar `myvenv` con tu nombre de `virtualenv` que hayas elegido!

> **NOTA:** a veces `source` podría no estar disponible. En ese caso trata hacerlo de esta forma:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

Sabrás que tienes `virtualenv` iniciado cuando veas que la línea de comando en tu consola tiene el prefijo `(myvenv)`.

Cuando trabajes en un entorno virtual, `python` automáticamente se referirá a la versión correcta, de modo que puedes utilizar `python` en vez de `python3`.

Ok, tenemos todas las dependencias importantes en su lugar. ¡Finalmente podemos instalar Django!

## Instalar Django {#django}

Ahora que tienes tu `virtualenv` iniciado, puedes instalar Django.

Antes de hacer eso, debemos asegurarnos que tenemos la última versión de `pip`, el software que utilizamos para instalar Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Instalar paquetes con un fichero de requisitos (requirements)

Un fichero de requisitos (requirements) tiene una lista de dependencias que se deben instalar mediante `pip install`:

Primero crea un archivo `requirements.txt` dentro de tu directorio `djangogirls`, usando el editor de código que instalaste previamente. Lo puedes hacer mediante abriendo un nuevo archivo en el editor de código y guardandolo como `requirements.txt` en el directorio `djangogirls`. Tu directorio se verá así:

    djangogirls
    ├── myvenv
    │   └── ...
    └───requirements.txt
    

Dentro del fichero `djangogirls/requirements.txt` deberías tener el siguiente texto:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Ahora, ejecuta `pip install -r requirements.txt` para instalar Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> Si tu obtienes un error cuando llamas al pip en la plataforma de Windows, por favor verifica si el nombre de ruta de tu proyecto contiene espacios, acentos o caracteres especiales ( por ejemplo, `C:\Usuarios\NombreUsuario\djangogirls`). Si los tiene, por favor considera usar otro lugar sin espacios, acentos o caracteres especiales (sugerencia: `C:\djangogirls`). Crea un nuevo virtualenv en el nuevo directorio, luego borra el viejo y trata de escribir el comando anterior otra vez. (Moviendo el directorio virtualenv no funcionará debido a que usa rutas absolutas.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Tu línea de comando puede congelarse luego de intentar instalar Django. Si ésto sucede, usa el siguiente comando:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> Si tu obtienes un error cuando llamas pip en Ubuntu 12.04, por favor corre `python -m pip install -U --force-reinstall pip` para reparar la instalación de pip en el virtualenv.

<!--endsec-->

¡Eso es todo! Ahora estás lista (por fin) para crear una aplicación Django!