# ORM de Django y QuerySets

En este capítulo aprenderás cómo Django se conecta a la base de datos y almacena los datos en ella. ¡Vamos a sumergirnos!

## ¿Qué es un QuerySet?

A QuerySet is, in essence, a list of objects of a given Model. QuerySets allow you to read the data from the database, filter it and order it.

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

You're now in Django's interactive console. It's just like the Python prompt, but with some additional Django magic. :) You can use all the Python commands here too, of course.

### Todos los objetos

Vamos a mostrar todos nuestros posts primero. Puedes hacerlo con el siguiente comando:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Oops! An error showed up. It tells us that there is no Post. It's correct – we forgot to import it first!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

This is simple: we import the model `Post` from `blog.models`. Let's try displaying all posts again:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

This is a list of the posts we created earlier! We created these posts using the Django admin interface. But now we want to create new posts using Python, so how do we do that?

### Crear objetos

Esta es la forma de crear un nuevo objeto Post en la base de datos:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

But we have one missing ingredient here: `me`. We need to pass an instance of `User` model as an author. How do we do that?

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

This is the superuser we created earlier! Let's get an instance of the user now:

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

As you can see, we now `get` a `User` with a `username` that equals 'ola'. Neat! Of course, you have to adjust this line to use your own username.

Ahora, finalmente, podemos crear nuestra entrada:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

¡Hurra! ¿Quieres comprobar si ha funcionado?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

¡Ahí está, una entrada de blog más en la lista!

### Agrega más entradas

You can now have a little fun and add more posts to see how it works. Add two or three more and then go ahead to the next part.

### Filtrar objetos

A big part of QuerySets is the ability to filter them. Let's say we want to find all posts that user ola authored. Usaremos `filter` en vez de `all` en `Post.objects.all()`. In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. The way to write it in Django is `author=me`. Ahora nuestro bloque de código tiene este aspecto:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

Or maybe we want to see all the posts that contain the word 'title' in the `title` field?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
[<Post: Sample title>, <Post: 4th title of post>]
```

> **Nota** Hay dos guiones bajos (`_`) entre `title` y `contains`. Django's ORM uses this rule to separate field names ("title") and operations or filters ("contains"). If you use only one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

You can also get a list of all published posts. We do this by filtering all the posts that have `published_date` set in the past:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
[]
```

Unfortunately, the post we added from the Python console is not published yet. But we can change that! First get an instance of a post we want to publish:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

And then publish it with our `publish` method:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Now try to get list of published posts again (press the up arrow key three times and hit `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
[<Post: Sample title>]
```

### Ordenar objetos

Los QuerySets también te permiten ordenar la lista de objetos. Intentemos ordenarlos por el campo `created_date`:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

También podemos invertir el orden agregando `-` al principio:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
[<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]
```

### Encadenar QuerySets

También puedes combinar QuerySets **encadenando** uno con otro:

    >>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    

Es muy potente y te permite escribir consultas bastante complejas.

¡Genial! ¡Ahora estás lista para la siguiente parte! Para cerrar la consola, escribe esto:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```