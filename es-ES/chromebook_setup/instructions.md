Podrías [saltarte esta sección](http://tutorial.djangogirls.org/en/installation/#install-python) en caso de que no estés usando un Chromebook. Si lo usas, tu experiencia de instalación sera un poco diferente. Puede ignorar el resto de las instrucciones de instalación.

### Cloud 9

Cloud 9 is a tool that gives you a code editor and access to a computer running on the Internet where you can install, write, and run the software. Durante el tutorial, Cloud 9 actuará como su *máquina local*. Aún así, usted estará ejecutando comandos en una terminal, tal como sus compañeros de clase en OS X, Ubuntu, o Windows, pero su terminal estará conectada a una computadora activa en algún otro lugar que Cloud 9 le establezca.

1. Instalar Cloud 9 desde la [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Ir a [c9.io](https://c9.io)
3. Crea una cuenta
4. Da click en *Create a New Workspace*
5. Llamalo *django-girls*
6. Selecciona *Blank*(en la parte inferior, el segundo desde la derecha con logo anaranjado)

Ahora deberías ver una interfaz con una barra, una gran ventana principal con algo de texto y, una ventana pequeña en la parte inferior que se mira así:

{% filename %}Cloud 9{% endfilename %}

    tunombredeusuario:~/workspace $
    

This bottom area is your *terminal*, where you will give the computer Cloud 9 has prepared for your instructions. You can resize that window to make it a bit bigger.

### Entorno Virtual

Un entorno virtual (también llamado "virtualenv" o "vitual environment" en inglés) es un tipo de caja privada donde podemos introducir código para un proyecto en el que estemos trabajando. Lo usamos para mantener los diferentes trozos de código que queramos para nuestros diferentes proyectos separados de modo que no haya mezclas indeseadas entre los proyectos.

En tu terminal en la zona inferior de la interfaz de Cloud 9, ejecuta lo siguiente:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Si esto no funciona, pídele ayuda a tu tutor.

Después, ejecuta:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~=1.11.0
    

(Mira que en la ultima línea usamos una virgulilla seguida por un signo de igual: ~=)

### Github

Crea una cuenta de [Github](https://github.com).

### PythonAnywhere

El tutorial de las Django Girls incluye una sección en lo que se conoce como Despliegue, lo cual se refiere al proceso de tomar el código que da vida a tu nueva aplicación web y moverlo a un ordenador de acceso publico (llamado servidor) para que otras personas puedan ver tu trabajo.

Esta parte del tutorial es algo extraña usando un Chromebook, pues ya estamos usando un computador conectado a internet (contrario a, por ejemplo, una laptop). Sin embargo, aun es útil, pues nos podemos imaginar a Cloud9 como un lugar para nuestro trabajo "en progreso" y a Python Anywhere como un lugar donde mostrar nuestro material una vez completado.

Así que, Regístrate en Python Anywhere en [www.pythonanywhere.com](https://www.pythonanywhere.com).