# ORM de Django y QuerySets

En este capítulo aprenderás cómo Django se conecta a la base de datos y almacena los datos en ella. ¡Vamos a sumergirnos!

## ¿Qué es un QuerySet?

Un QuerySet es, en esencia, una lista de objetos de un modelo determinado. Un QuerySet te permite leer los datos de base de datos, filtrarlos y ordenarlos.

Es más fácil de aprender con ejemplos. Vamos a intentarlo, ¿de acuerdo?

## Django shell

Abre la consola y escribe este comando:

    (myvenv) ~/djangogirls$ python manage.py shell
    

El resultado debería ser:

    (InteractiveConsole)
    >>>
    

Ahora estás en la consola interactiva de Django. Es como la consola de Python, pero con un toque de magia Django :). Puedes utilizar todos los comandos Python aquí también, por supuesto.

### Ver todos los objetos

Vamos a mostrar todos nuestros objetos Posts primero. Puedes hacerlo con el siguiente comando:

    >>> Post.objects.all()
    Traceback (most recent call last):
          File "<console>", line 1, in <module>
    NameError: name 'Post' is not defined
    

¡ Uy! Apareció un error. Nos dice que no hay ningún objeto Post. Esto es correcto, nos olvidamos de importarlo primero!

    >>> from blog.models import Post
    

Esto es simple: importamos el modelo `Post` de `blog.models`. Vamos a intentar mostrar todos los Posts nuevamente:

    >>> Post.objects.all()
    []
    

Es una lista vacía. Esto es correcto, ¿verdad?¡Todavía no hemos añadido ningún Post! Vamos a arreglarlo.

### Crear objetos

Esta es la forma de crear un objeto Post en la base de datos:

    >>> Post.objects.create(author=me, title='Sample title', text='Test')
    

Pero hay un ingrediente faltante: `me`. Necesitamos pasar una instancia del modelo `User` como autor. ¿Cómo hacemos eso?

Primero importemos el modelo User:

    >>> from django.contrib.auth.models import User
    

¿Qué usuarios tenemos en nuestra base de datos? Veamos:

    >>> User.objects.all()
    []
    

¡Ninguno! Creemos un usuario:

    >>> User.objects.create(username='ola')
    <User: ola>
    

Veamos nuevamente qué usuarios tenemos:

    >>> User.objects.all()
    [<User: ola>]
    

¡ Genial! Ahora usemos una instancia del usuario:

    me = User.objects.get(username='ola')
    

Como puedes ver, ahora `get` un `User` con un `username` que es igual a 'ola'. Limpio! Por supuesto, tienes que ajustarlo a tu nombre de usuario.

Ahora por fin podemos crear nuestro primer post:

    >>> Post.objects.create(author = me, title = 'Titulo simple', text = 'Test')
    

¡Hurra! ¿Quieres comprobar si ha funcionado?

    >>> Post.objects.all()
    [<Post: Título simple>]
    

### Agrega más posts

Ahora puedes divertirte un poco y añadir más posts para ver cómo funciona. Añade 2 - 3 más y avanzar a la siguiente parte.

### Filtrar Objetos

En gran parte los QuerySets tienen la habilidad de filtrar. Digamos que queremos encontrar todos los mensajes que son escritos por el usuario ola. Utilizaremos el `filter` en lugar de `all` en `Post.objects.all()`. Entre paréntesis indicará qué condición(es) debe coincidir por una entrada de blog en nuestro queryset. En nuestra situación es `author` que es igual a `me`. La manera de escribirlo en Django es: `author = me`. Ahora nuestro código tiene este aspecto:

    >>> Post.objects.filter(author=me)
    [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
    

¿O tal vez queremos ver todos los mensajes que contienen una palabra 'título' en el campo `title`?

    >>> Post.objects.filter(title__contains='title')
    [<Post: Sample title>, <Post: 4th title of post>]
    

> **Nota** Hay dos caracteres de subrayado (`_`) entre el `title` y `contains`. Django ORM utiliza esta sintaxis para separar los nombres de campo ("title") y operaciones o filtros ("contains"). Si sólo utilizas un carácter de subrayado, obtendrás un error como "FieldError: Cannot resolve keyword title_contains".

También puedes obtener una lista de todos los mensajes publicados. Lo hacemos filtrando todos los post que tienen `published_date`:

    >>> Post.objects.filter(published_date__isnull=False)
    []
    

Lamentablemente, ninguno de nuestros mensajes son publicado todavía. Podemos cambiar eso. Primero obtener una instancia de un post que queremos publicar:

    >>> post = Post.objects.get(id=1)
    

Y luego publicarlo con nuestro método de `publish`!

    >>> post.publish()
    

Ahora intenta obtener lista de mensajes publicados otra vez (presiona 3 veces el botón de la flecha hacia arriba y pulse Enter):

    >>> Post.objects.filter(published_date__isnull=False)
    [<Post: Sample title>]
    

### Ordenando Objetos

Los QuerySets también permite ordenar la lista de objetos. Tratemos de pedirlos por `created_date` :

    >>> Post.objects.order_by('created_date')
    [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
    

También podemos invertir el orden agregando `–` al principio:

    >>> Post.objects.order_by('-created_date')
    [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]
    

¡Genial! Ahora estás listo para la siguiente parte! Para cerrar el shell, escribe esto:

    >>> exit()
    $