Puedes [ir directamente a esta sección](http://tutorial.djangogirls.org/en/installation/#install-python) si no utilizas una Chromebook. Si lo haces, el proceso de instalación será algo diferente. Puedes ignorar el resto de las instrucciones de instalación. 

### Cloud 9

Cloud 9 es una herramienta que te da un editor de código y acceso a una computadora 
ejecutándose en Internet donde puedes instalar, escribir y ejecutar software. Durante
el tutorial Cloud 9 será como tu _máquina local_. Vas a estar ejecutando comandos
en una interfaz de terminal al igual que tus compañeros de clase en OS X, 
Ubuntu o Windows pero tu terminal estará conectada a una computadora ejecutándose
en algún otro lugar que Cloud 9 configure para vos.

1. Instala Cloud 9 desde la [tienda web de Chrome](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Dirigite a [c9.io](https://c9.io)
3. Registrate para obtener una cuenta
4. Clickea en _Create a New Workspace_
5. Nombralo _django-girls_
6. Selecciona _Blank_ (el segundo desde la derecha en la fila inferior con logo naranja)

Ahora deberías ver una interfaz con una barra lateral, una ventana principal grande con algo
de texto y, una ventana pequeña en la parte inferior que luce como esta:

{% filename %}Cloud 9{% endfilename %}
```
yourusername:~/workspace $
```

El área inferior es tu _terminal_, donde obtendrás la computadora que Cloud 9 
ha preparado para tus instrucciones. Puedes redimensionar esa ventana para hacerla un poco
mas grande.

### Entorno Virtual

Un entorno virtual (también llamado virtualenv) es como una caja personal donde 
guardamos el código útil de un proyecto en el que estamos trabajando. Lo usamos para
mantener separados fragmentos de código de distintos proyectos, de modo que no
se mezclen entre si.

En la terminal que se encuentra en la parte inferior de la interfaz de Cloud 9 ejecuta lo siguiente:

{% filename %}Cloud 9{% endfilename %}
```
sudo apt install python3.5-venv
```

Si esto no funciona, pide ayuda a tu guía.

Luego, ejecuta:

{% filename %}Cloud 9{% endfilename %}
```
mkdir djangogirls
cd djangogirls
python3.5 -mvenv myvenv
source myvenv/bin/activate
pip install django~=1.10.0
```

(nota que en la última línea usamos un tilde seguido por un signo igual: ~=).

### Github

Crea una cuenta en [Github](https://github.com).

### PythonAnywhere

El tutorial de Django Girls incluye una sección denominada Despliega, 
que consiste en el proceso de tomar el código de tu nueva aplicación web 
y llevarlo a una computadora accesible al público (llamada servidor) para que otras
personas puedan ver tu trabajo.

Esta proceso es algo particular al hacer el tutorial en una Chromebook debido a que estamos 
utilizando una computadora que está en Internet (en contraposición, digamos, a una portátil).
Sin embargo aún así es útil, ya que podemos pensar a Cloud 9 como un lugar
para nuestro trabajo "en progreso" y a Python Anywhere como el lugar para mostrar el trabajo
a medida que se va completando.

Por tanto, registra una nueva cuenta en Python Anywhere
[www.pythonanywhere.com](https://www.pythonanywhere.com).
