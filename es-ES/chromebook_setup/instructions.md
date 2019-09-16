Puedes [saltarte esta sección](http://tutorial.djangogirls.org/en/installation/#install-python) en caso de que no estés usando un Chromebook. Si lo usas, tu experiencia de instalación será algo diferente. Puedes ignorar el resto de las instrucciones de instalación.

### IDE en la nube (PaizaCloud Cloud IDE, AWS Cloud9)

Nube de IDE es una herramienta que te ofrece un editor de código y el acceso por medio de internet a una computadora donde puedes instalar, escribir y ejecutar el software. Durante este tutorial, el IDE en la nube te servirá como tu *máquina local*. Seguirás ejecutando comandos en una terminal igual que tus compañeros de clase en OS X, Ubuntu, o Windows, pero tu terminal en realidad estará conectada a una computadora trabajando en algún otro lugar, que el IDE en la nube configura para ti. Aquí están las instrucciones para IDEs en la nube (PaizaCloud Cloud IDE, AWS Cloud9). Puedes elegir uno de los IDEs en la nube, y seguir sus instrucciones.

#### PaizaCloud Cloud IDE

1. Ve a [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Crea una cuenta
3. Haga clic en *Nuevo Servidor* y elija la aplicación Django
4. Haz clic en el botón Terminal (en el lado izquierdo de la ventana)

Ahora deberías ver una interfaz con una barra y botones en la izquierda. Haz click en al botón "Terminal" para abrir la ventana de la terminal con un símbolo de sistema como este:

{% filename %}Terminal{% endfilename %}

    $
    

La terminal en el IDE en la nube PaizaCloud, está preparada para ejecutar tus instrucciones. Puedes redimensionar o maximar la ventana para hacerla un poco mas grande.

#### AWS Cloud9

Actualmente Cloud 9 requiere que te registres con AWS y ingreses la información de la tarjeta de crédito.

1. Instala Cloud 9 desde la [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Valla a [c9.io](https://c9.io) y haz clic en *Get started with AWS Cloud9*
3. Sign up for an AWS account (requires credit card information, but you can use it for free)
4. In the AWS Dashboard, enter *Cloud9* in the search bar and click it
5. In the Cloud 9 dashboard, click *Create environment*
6. Name it *django-girls*
7. While configuring settings, select *Create a new instance for environment (EC2)* for "Environment Type" and the *t2.micro* "Instance type" (it should say "Free-tier eligible."). The default cost-saving setting is fine and you can keep the other defaults.
8. Click *Next step*
9. Click *Create environment*

Ahora deberías ver una interfaz con una barra, una gran ventana principal con algún texto y, una ventana pequeña en la parte inferior que se vería así:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

El área de abajo es tu terminal. Puedes usar el terminal para enviar instrucciones al ordenador remoto en Cloud 9. Puedes redimensionar o maximizar la ventana para hacerla un poco mas grande.

### Entorno Virtual

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Ejecutar:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(nota que en la ultima linea usamos una virgulilla (~) seguido de un signo igual `~=`).

### GitHub

Hazte una cuenta de [GitHub](https://github.com).

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).