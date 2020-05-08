Puedes [saltarte esta sección](http://tutorial.djangogirls.org/en/installation/#install-python) en caso de que no estés usando un Chromebook. Si lo usas, tu experiencia de instalación será algo diferente. Puedes ignorar el resto de las instrucciones de instalación.

### IDE en la nube (PaizaCloud Cloud IDE, AWS Cloud9)

Nube de IDE es una herramienta que te ofrece un editor de código y el acceso por medio de internet a una computadora donde puedes instalar, escribir y ejecutar el software. Durante este tutorial, el IDE en la nube te servirá como tu *máquina local*. Seguirás ejecutando comandos en una terminal igual que tus compañeros de clase en OS X, Ubuntu, o Windows, pero tu terminal en realidad estará conectada a una computadora trabajando en algún otro lugar, que el IDE en la nube configura para ti. Aquí están las instrucciones para IDEs en la nube (PaizaCloud Cloud IDE, AWS Cloud9). Puedes elegir uno de los IDEs en la nube, y seguir sus instrucciones.

#### PaizaCloud Cloud IDE

1. Ve a [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Crea una cuenta
3. Haga clic en *Nuevo Servidor* y elija la aplicación Django
4. Haga clic en el botón Terminal (al lado izquierdo de la ventana)

Ahora deberías ver una interfaz con una barra y botones en la izquierda. Haz click en al botón "Terminal" para abrir la ventana de la terminal con un símbolo de sistema como este:

{% filename %}Terminal{% endfilename %}

    $
    

La terminal en el IDE en la nube PaizaCloud, está preparada para ejecutar tus instrucciones. Puedes redimensionar o maximizar la ventana para hacerla un poco más grande.

#### AWS Cloud9

Actualmente Cloud 9 requiere que te registres con AWS y ingreses la información de la tarjeta de crédito.

1. Instala Cloud 9 desde la [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Valla a [c9.io](https://c9.io) y haz clic en *Get started with AWS Cloud9*
3. Regístrate en una cuenta AWS (requiere información de tarjeta de crédito, pero puedes usar gratis)
4. En el panel de control AWS, introduzca *Cloud9* en la barra de búsqueda y haga clic en él
5. En el panel de control de la Cloud 9, haga clic en *Create environment*
6. Nómbralo *django-girls*
7. Mientras configura los ajustes, seleccione *Create a new instance for environment (EC2)* para "Environment Type" y seleccione el valor *t2.micro* para "Instance type" (debería decir "Free-tier eligible."). La configuración de ahorro de costes por defecto está bien y puede mantener los otros valores por defecto.
8. Haz clic en *Next step*
9. Haz clic en *Create environment*

Ahora deberías ver una interfaz con una barra, una gran ventana principal con algún texto y, una ventana pequeña en la parte inferior que se vería así:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

El área de abajo es tu terminal. Puedes usar el terminal para enviar instrucciones al ordenador remoto en Cloud 9. Puedes redimensionar o maximizar la ventana para hacerla un poco más grande.

### Entorno Virtual

Un entorno virtual (también llamado "virtualenv" o "vitual environment" en inglés) es un tipo de caja privada donde podemos introducir código para el proyecto en el cual estemos trabajando. Lo usamos para mantener separados los diferentes trozos de código de nuestros proyectos, de modo que no haya mezclas indeseadas entre los mismos.

Ejecutar:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(nota que en la última linea usamos una virgulilla (~) seguido de un signo igual `~=`).

### GitHub

Hazte una cuenta de [GitHub](https://github.com).

### PythonAnywhere

El tutorial de Django Girls incluye una sección en lo que se conoce como Despliegue, lo cual se refiere al proceso de tomar el código que da vida a tu nueva aplicación web y moverlo a un ordenador de acceso publico (llamado servidor) para que otras personas puedan ver tu trabajo.

Esta parte del tutorial es algo extraña usando un Chromebook, pues ya estamos usando un computador conectado a Internet (contrario a, por ejemplo, una laptop). Sin embargo, aún es útil, ya que podemos pensar que nuestro espacio de trabajo en Cloud 9 como un repositorio para nuestro trabajo "en progreso" y Python Anywhere como un lugar donde mostrar nuestro trabajo más completo.

Así que, registra una cuenta en Python Anywhere [www.pythonanywhere.com](https://www.pythonanywhere.com).