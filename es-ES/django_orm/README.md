# ORM de Django y QuerySets

En este capítulo aprenderás cómo Django se conecta a la base de datos y almacena los datos en ella. ¡Vamos a sumergirnos!

## ¿Qué es un QuerySet?

Un QuerySet es, en esencia, una lista de objetos de un modelo determinado. Un QuerySet te permite leer los datos de la base de datos, filtrarlos y ordenarlos.

Es más fácil de aprender con ejemplos. Vamos a intentarlo, ¿de acuerdo?

## Django shell

Abre tu consola local (no la de PythonAnywhere) y escribe este comando:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

El resultado debería ser:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

You're now in Django's interactive console. It's just like the Python prompt, but with some additional Django magic. :) You can use all the Python commands here too.

### Todos los objetos

Vamos a mostrar todos nuestros posts primero. Puedes hacerlo con el siguiente comando:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

¡Uy! Apareció un error. Nos dice que Post no existe. Esto es correcto, ¡olvidamos importarlo!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

We import the model `Post` from `blog.models`. Let's try displaying all posts again:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

¡Es la lista de posts que creamos anteriormente! Creamos estos posts usando la interfaz de administración de Django. Pero, ahora queremos crear nuevos posts usando Python, ¿cómo lo hacemos?

### Crear objetos

Esta es la forma de crear un nuevo objeto Post en la base de datos:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Pero nos falta un ingrediente aquí: `me`. Tenemos que pasar una instancia del modelo `User` como autor. ¿Eso cómo se hace?

Primero importemos el modelo User:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

¿Qué usuarios tenemos en nuestra base de datos? Prueba esto:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

This is the superuser we created earlier! Let's get an instance of the user now (adjust this line to use your own username):

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

As you can see, we now `get` a `User` with a `username` that equals 'ola'. Neat!

Ahora, finalmente, podemos crear nuestra entrada:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

¡Hurra! ¿Quieres probar si funcionó?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

¡Ahí está, una entrada de blog más en la lista!

### Agrega más entradas

Ahora puedes divertirte un poco y agregar más entradas para ver cómo funciona. Agrega dos o tres más y avanza a la siguiente parte.

### Filtrar objetos

Una parte importante de los QuerySets es la habilidad para filtrar los resultados. Digamos que queremos encontrar todos los post del usuario ola. Usaremos `filter` en vez de `all` en `Post.objects.all()`. Entre paréntesis estableceremos qué condición (o condiciones) debe cumplir un post del blog para aparecer como resultado en nuestro queryset. En nuestro caso sería `author` es igual a `me`. La forma de escribirlo en Django es: `author=me`. Ahora nuestro bloque de código tiene este aspecto:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

¿O quizá queremos ver todas las entradas que contengan la palabra 'title' en el campo `title`?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Nota** Hay dos guiones bajos (`_`) entre `title` y `contains`. El ORM de Django utiliza esta sintaxis para separar los nombres de los campos ("title") de las operaciones o filtros ("contains"). Si sólo utilizas un guión bajo, obtendrás un error como "FieldError: Cannot resolve keyword title_contains".

También puedes obtener una lista de todos los post publicados. Lo hacemos filtrando los post que tienen la fecha de publicación, `published_date`, en el pasado:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Por desgracia, el post que hemos añadido desde la consola de Python aùn no está publicado. Pero lo podemos cambiar! Primero obtèn una instancia de la entrada que queremos publicar:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

Y luego publícala con nuestro método `publish`:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Ahora vuelve a intentar obtener la lista de posts publicados (pulsa la tecla de "flecha arriba" tres veces y pulsa `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### Ordenar objetos

Los QuerySets también te permiten ordenar la lista de objetos. Intentemos ordenarlos por el campo `created_date`:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

También podemos invertir el orden agregando `-` al principio:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Encadenar QuerySets

También puedes combinar QuerySets **encadenando** uno con otro:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

Es muy potente y te permite escribir consultas bastante complejas.

¡Genial! ¡Ahora estás lista para la siguiente parte! Para cerrar la consola, escribe esto:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```