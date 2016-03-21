# ORM de Django y QuerySets

En este capítulo aprenderás cómo Django se conecta a la base de datos y almacena los datos en ella. ¡Vamos a sumergirnos!

## ¿Qué es un QuerySet?

Un QuerySet es, en esencia, una lista de objetos de un modelo determinado. Un QuerySet te permite leer los datos de una base de datos, filtrarlos y ordenarlos.

Es más fácil de aprender con ejemplos. Vamos a intentarlo, ¿de acuerdo?

## Django shell

Abre la consola y escribe este comando:

    (myvenv) ~/djangogirls$ python manage.py shell
    

El resultado debería ser:

    (InteractiveConsole)
    >>>
    

Ahora estás en la consola interactiva de Django. Es como la consola de Python, pero con un toque de magia Django :). Puedes utilizar todos los comandos Python aquí también, por supuesto.

### Ver todos los objetos

Vamos a mostrar todos nuestros posts primero. Puedes hacerlo con el siguiente comando:

    >>> Post.objects.all()
    Traceback (most recent call last):
          File "<console>", line 1, in <module>
    NameError: name 'Post' is not defined
    

¡Uy! Apareció un error. Nos dice que no hay ningún objeto Post. Esto es correcto, ¡nos olvidamos de importarlo primero!

    >>> from blog.models import Post
    

Esto es simple: importamos el modelo `Post` de `blog.models`. Vamos a intentar mostrar todos los posts nuevamente:

    >>> Post.objects.all()
    [<Post: my post title>, <Post: another post title>]
    

Esta es una lista de las posts creadas anteriormente. Hemos creado estos posts usando la interfaz del administrador de Django. Sin embargo, ahora queremos crear nuevos posts usando Python, ¿cómo lo hacemos?

### Crear objetos

Esta es la forma de crear un nuevo objeto Post en la base de datos:

    >>> Post.objects.create(author=me, title='Sample title', text='Test')
    

Pero hay un ingrediente faltante: `me`. Necesitamos pasar una instancia del modelo `User` como autor. ¿Cómo hacemos eso?

Primero importemos el modelo User:

    >>> from django.contrib.auth.models import User
    

¿Qué usuarios tenemos en nuestra base de datos? Veamos:

    >>> User.objects.all()
    [<User: ola>]
    

Este es el super usuario que creamos anteriormente, Vamos a obtener una instancia de ese usuario ahora:

    me = User.objects.get(username='ola')
    

Como puedes ver, hicimos un `get` de un `User` con el `username` que sea igual a 'ola'. ¡Genial! Acuérdate de poner tu nombre de usuario para obtener tu usuario.

Ahora finalmente podemos crear nuestro primer post:

    >>> Post.objects.create(author=me, title='Sample title', text='Test')
    

¡Hurra! ¿Quieres probar si funcionó?

    >>> Post.objects.all()
    [<Post: my post title>, <Post: another post title>, <Post: Sample title>]
    

### Agrega más posts

Ahora puedes divertirte un poco y añadir más posts para ver cómo funciona. Añade 2 ó 3 más y avanza a la siguiente parte.

### Filtrar objetos

Una parte importante de los QuerySets es la habilidad para filtrarlos. Digamos que queremos encontrar todos los posts cuyo autor es el User ola. Usaremos `filter` en vez de `all` en `Post.objects.all()`. En los paréntesis estableceremos qué condición o conduciones deben cumplirse por un post del blog para terminar en nuestro queryset. En nuestro caso sería `author` es igual a `me`. La forma de escribirlo en Django es: `author=me`. Ahora nuestro bloque de código se ve como esto:

    >>> Post.objects.filter(author=me)
    [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
    

¿O tal vez querramos ver todos los posts que contengan la palabra 'title' en el campo `title`?

    >>> Post.objects.filter(title__contains='title')
    [<Post: Sample title>, <Post: 4th title of post>]
    

> **Nota** Hay dos guiones bajos (`_`) entre `title` y `contains`. Django ORM utiliza esta sintaxis para separar los nombres de los campos ("title") y operaciones o filtros ("contains"). Si sólo utilizas un guión bajo, obtendrás un error como "FieldError: Cannot resolve keyword title_contains".

También puedes obtener una lista de todos los posts publicados. Lo hacemos filtrando los posts que tienen el campo `published_date` en el pasado:

    >>> from django.utils import timezone
    >>> Post.objects.filter(published_date__lte=timezone.now())
    []

Desafortunadamente, ninguno de nuestros posts han sido publicados todavía. ¡Vamos a cambiar esto! Primero obtén una instancia de un post que querramos publicar:

    >>> post = Post.objects.get(id=1)
    

¡Luego utiliza el método `publish` para publicarlo!

    >>> post.publish()
    

Ahora intenta obtener la lista de posts publicados nuevamente (presiona la tecla con la flecha hacia arriba 3 veces y presiona Enter):

    >>> Post.objects.filter(published_date__lte=timezone.now())
    [<Post: Sample title>]
    

### Ordenando objetos

Los QuerySets también te permiten ordenar la lista de objetos. Intentemos ordenarlos por el campo `created_date`:

    >>> Post.objects.order_by('created_date')
    [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
    

También podemos invertir el ordenamiento agregando `-` al principio:

    >>> Post.objects.order_by('-created_date')
    [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]
    

¡Genial! ¡Ahora estás lista para la siguiente parte! Para cerrar la consola, tipea:

    >>> exit()
    $
