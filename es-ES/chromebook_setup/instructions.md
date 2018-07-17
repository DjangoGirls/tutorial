Puedes [saltarte esta sección](http://tutorial.djangogirls.org/en/installation/#install-python) en caso de que no estés usando un Chromebook. Si lo usas, tu experiencia de instalación será algo diferente. Puedes ignorar el resto de las instrucciones de instalación.

### Cloud 9

Cloud 9 es una herramienta que te proporciona un editor de código y un acceso a una computadora funcionando en Internet donde puedes instalar, escribir y ejecutar software. Durante el tutorial, Cloud 9 actuará como tu *equipo local*. Aún así, estarás ejecutando comandos en una terminal, tal como tus compañeros de clase en OS X, Ubuntu, o Windows, pero tu terminal estará conectada a una computadora activa en algún otro lugar que Cloud 9 establecerá por tí.

1. Instala Cloud 9 desde la [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Ve a [c9.io](https://c9.io)
3. Crea una cuenta
4. Haz clic en *Crear un nuevo espacio de trabajo*
5. Nómbralo *django-girls*
6. Selecciona *Blank*(en la parte inferior, el segundo desde la derecha con un logo anaranjado)

Ahora deberías ver una interfaz con una barra, una gran ventana principal con algún texto y, una ventana pequeña en la parte inferior que se vería así:

{% filename %}Cloud 9{% endfilename %}

    tunombredeusuario:~/workspace $
    

Esta zona es tu *terminal*, donde la computadora Cloud9 está preparada para que le des instrucciones. Puedes cambiar el tamaño de la ventana para hacerla un poco más grande.

### Entorno Virtual

Un entorno virtual (también llamado "virtualenv" o "vitual environment" en inglés) es un tipo de caja privada donde podemos introducir código para el proyecto en el que estemos trabajando. Lo usamos para mantener separados los diferentes trozos de código de nuestros proyectos, de modo que no haya mezclas indeseadas entre los mismos.

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
    pip install django~={{ book.django_version }}
    

(Presta atención que en la ultima línea usamos una virgulilla seguida por un signo de igual: ~=).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

El tutorial de Django Girls incluye una sección en lo que se conoce como Despliegue, lo cual se refiere al proceso de tomar el código que da vida a tu nueva aplicación web y moverlo a un ordenador de acceso publico (llamado servidor) para que otras personas puedan ver tu trabajo.

Esta parte del tutorial es algo extraña usando un Chromebook, pues ya estamos usando un computador conectado a internet (contrario a, por ejemplo, una laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Así que, regístrate en Python Anywhere [www.pythonanywhere.com](https://www.pythonanywhere.com).