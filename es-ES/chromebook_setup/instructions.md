Puedes [saltarte esta sección](http://tutorial.djangogirls.org/en/installation/#install-python) en caso de que no estés usando un Chromebook. Si lo estás usando, tu experiencia de instalación será algo diferente. Puedes ignorar el resto de las instrucciones de instalación.

### IDE en la nube (PaizaCloud Cloud IDE, AWS Cloud9)

Un IDE en la nube es una herramienta que te da un editor de código y acceso a un ordenador conectado a internet en el que puedes instalar, escribir y ejecutar software. En este tutorial, el IDE en la nube te servirá como tu *máquina local*. Seguirás ejecutando comandos en una terminal igual que tus compañeros de clase en OS X, Ubuntu, o Windows, pero tu terminal en realidad estará conectada a un ordenador corriendo en otro sitio que el IDE en la nube gestionará para ti. Aquí están las instrucciones para IDEs en la nube (PaizaCloud Cloud IDE, AWS Cloud9). Puedes elegir uno de los IDEs en la nube, y seguir sus instrucciones.

#### PaizaCloud Cloud IDE

1. Ve a [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Crea una cuenta
3. Haz click en *New Server*
4. Haz click en el botón Terminal (en el lado izquierdo de la ventana)

Ahora deberías ver una interfaz con una barra y botones en la izquierda. Haz click en al botón "Terminal" para abrir la ventana de la terminal con un símbolo de sistema como este:

{% filename %}Terminal{% endfilename %}

    $
    

La terminal enviará tus instrucciones al ordenador que Cloud 9 ha preparado para ti. Puedes redimensionar o maximizar la ventana para hacerla un poco mas grande.

#### AWS Cloud9

1. Ve a [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Crea una cuenta
3. Haz click en *Create Environment*

Deberías ver un interfaz con una barra lateral, una ventana principal grande con texto y una ventana pequeña abajo del todo parecida a esto:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

La parte inferior es tu *terminal*, donde escribirás las instrucciones para el ordenador que Cloud 9 te ha preparado. Puedes redimensionar la ventana para hacerla un poco más grande.

### Entorno Virtual

Un entorno virtual (también llamado virtualenv) es como una caja privada donde podemos guardar código útil para el proyecto en el que estamos trabajando. Lo usamos para guardar por separado los trozos de código de distintos proyectos, y que así, las cosas no se mezclen entre proyectos.

En la terminal de la parte inferior de Cloud 9, ejecuta lo siguiente:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Si aun así, no te funciona, pide ayuda a tu mentor.

A continuación, ejecuta:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(fíjate que en la última línea hemos usado una tilde seguida de un signo de igual: ~=).

### GitHub

Hazte una cuenta de [GitHub](https://github.com).

### Python Anywhere

El tutorial de Django Girls tiene una sección que se llama "Despliegue", que es el proceso de coger el código de tu nueva aplicación web y ponerlo en un ordenador públicamente accesible (un servidor) para que todo el mundo pueda ver tu trabajo.

Esta parte "chirría" un poco cuando haces el tutorial en un Chromebook, porque que ya estamos usando un ordenador que ya está en Internet (en lugar de un ordenador local como un portátil). Sin embargo, aún tiene sentido, si pensamos que nuestro espacio de trabajo en Cloud9 es un lugar para nuestro trabajo "en progreso" y PythonAnywhere es el lugar donde enseñar nuestro sitio web más terminado.

Así que créate una cuenta de PythonAnywhere en [www.pythonanywhere.com](https://www.pythonanywhere.com).