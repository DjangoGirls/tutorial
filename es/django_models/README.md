# Modelos en Django

Lo que queremos crear ahora es algo que va a almacenar todas las entradas en nuestro blog. Pero para poder hacerlo tenemos que hablar un poco de acerca de algo llamado `objetos`.

## Objetos

Hay un concepto en el mundo de la programación llamado `programación orientada a objetos`. La idea es que en lugar de escribir todo como una aburrida secuencia de instrucciones de programación podemos modelar cosas y definir cómo interactúan con las demás.

Entonces ¿Qué es un objeto? Es un conjunto de propiedades y acciones. Suena raro, pero te daremos un ejemplo.

Si queremos un modelar un gato crearemos un objeto `Gato` que tiene algunas propiedades, como son, `color`, `edad`, `estado de ánimo` (es decir, bueno, malo, sueño ;)), `dueño` (que es un objeto `persona` o tal vez, en el caso de que el gato sea callejero, esta propiedad estara vacía).

Y luego el `Gato` tiene algunas acciones: `ronronear`, `rasguñar` o `alimentarse` (en la cual daremos el gato algunos `ComidaDeGato`, que podría ser un objeto independiente con propiedades, como por ejemplo, `sabor`).

    Gato
    ---------
    color 
    edad 
    humor 
    dueño 
    ronronear() 
    rasguñar() 
    alimientarse(comida_de_gato) 
    
    ComidaDeGato
    ----------
    sabor
    

Básicamente se trata de describir cosas reales en el código con propiedades (llamadas `Propiedades del objeto`) y las acciones (llamadas `métodos`).

y ahora ¿Cómo modelamos las entradas en el blog? Queremos construir un blog, ¿no?

Tenemos primero que responder algunas preguntas: ¿Qué es una entrada de un blog? ¿Qué características debe tener?

Bueno, seguro que nuestras entradas necesitan un texto con su contenido y un título, ¿Cierto? También sería bueno saber quién lo escribió, así que necesitamos un autor. Por último, queremos saber cuando fue creado y publicado dicha entrada.

    Entrada
    ---------
    
    título
    texto
    autor
    fecha_creacion
    fecha_publicacion
    

¿Qué tipo de cosas podría hacerse con una entrada del blog? Sería bueno tener algún `método` que publique la entrada, ¿no?

Así que vamos a necesitar el método `publicar`.

Puesto que ya sabemos lo que queremos hacer, podemos empezar a crear nuestro Modelo en Django!

## Modelo en Django

Sabiendo que es un objeto, podemos crear un modelo en Django para nuestras entradas en el Blog.

Un modelo en Django es un tipo especial de objeto, que se guarda en la `base de datos`. Una base de datos es un conjunto de datos. Allí es el lugar en el cual almacenarás la información sobre usuarios, entradas del blogs, etc. Utilizaremos una base de datos SQLite para almacenar nuestros datos. Este es el adaptador de base de datos predeterminada en Django -- será suficiente para nosotros por ahora.

Piensa en el modelo como una hoja de cálculo con columnas (campos) y filas (datos).

### Creando una aplicación

Para mantener todo en orden, crearemos una aplicación separada dentro de nuestro proyecto. Es muy bueno tener todo organizado desde el principio. Para crear una aplicación necesitamos ejecutar el siguiente comando en la consola (dentro `djangogirls` donde está el archivo `manage.py`):

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

Vas notar que se crea un nuevo directorio llamado `blog` y contiene una serie de archivos. Nuestros directorios y archivos en nuestro proyecto deberían parecerse a esto:

    djangogirls
    ├── mysite
    | __init__.py
    | settings.py
    | urls.py
    | wsgi.py
    ├── manage.py
    └── blog
    ├── migrations
    | __init__.py
    ├── __init__.py
    ├── admin.py
    ├── models.py
    ├── tests.py
    └── views.py
    

Después de crear una aplicación también necesitamos decirle a Django que debe utilizarla. Lo hacemos en el archivo `mysite/settings.py`. Tenemos que encontrar `INSTALLED_APPS` y añadir una línea que contiene `'blog',` justo por encima de `)`. El producto final debe tener este aspecto:

    INSTALLED_APPS = (
        'django.contrib.admin',
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.messages',
        'django.contrib.staticfiles',
        'blog',
    )
    

### Creando el Modelo post

En el archivo `blog/models.py` definimos todos los objetos llamados `Models` - este es un lugar en el cual definiremos nuestro modelo post.

Vamos abrir `blog/models.py`, quitamos todo y escribimos un código como este:

    from django.db import models
    from django.utils import timezone
    
    class Post(models.Model):
        author = models.ForeignKey('auth.User')
        title = models.CharField(max_length=200)
        text = models.TextField()
        created_date = models.DateTimeField(
                default=timezone.now)
        published_date = models.DateTimeField(
                blank=True, null=True)
    
        def publish(self):
            self.published_date = timezone.now()
            self.save()
    
        def __str__(self):
            return self.title
    

> Vuelva a verificar que usaste dos caracteres undescore (`_`) en cada lado del `str`. Los que se utilizan con frecuencia en Python y a veces también los llamamos "dunder" (diminutivo de "doble-subrayado").

Es aterrador, ¿cierto? Pero no te preocupes, vamos a explicar qué significan estas líneas!

Todas las líneas a partir `from` o de `import` son líneas para añadir algo de otros archivos. Así que en vez de copiar y pegar las mismas cosas en cada archivo, podemos incluir algunas partes con `from... import ...`.

`class Post(models.Model):` - esta linea define nuestro modelo (es un `objeto`).

*   `class` Es una palabra clave que indica que estamos definiedo un objeto.
*   `Post` Es el nombre de nuestro modelo, podemos darle un nombre diferente(pero debemos evitar espacios en blanco y caracteres especiales). Una clase siempre comienza con su primera letra en mayúscula.
*   `models.Model` Significa que Post es un modelo de Django, así Django sabe que debe guardarlo en la base de datos.

Now we define properties we were talking about: `title`, `text`, `created_date`, `published_date` and `author`. Para hacer eso tenemos que definir un tipo de campo (¿es texto? ¿Un número? ¿Una fecha? Una relación con otro objeto, es decir, un usuario?).

*   `models.CharField` - esto es como defines un texto con un numero limitado de caracteres.
*   `modelos.TextField`-esto es para textos largos sin un límite. ¿Será ideal para un blog post contenido, verdad?
*   `models.DateTimeField` - esta es la fecha y hora.
*   `modelos.ForeignKey`-este es una relación a otro modelo.

No vamos a explicar cada pedacito de código, ya que nos tomaría demasiado tiempo. You should take a look at Django's documentation, if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/1.7/ref/models/fields/#field-types).

What about `def publish(self):`? It is exactly our `publish` method we were talking about before. `def` means that this is a function/method. `publish` is the name of the method. You can change it, if you want. The rule is that we use lowercase and underscores instead of whitespaces (i.e. if you want to have a method that calculates average price you could call it `calculate_average_price`).

Methods very often `return` something. There is an example of that in the `__str__` method. In this scenario, when we call `__str__()` we will get a text (**string**) with a Post title.

If something is still not clear about models, feel free to ask your coach! We know it is very complicated, especially when you learn what objects and functions are at the same time. But hopefully it looks slightly less magic for you now!

### Create tables for models in your database

The last step here is to add our new model to our database. First we have to make Django know that we have some changes in our model (we have just created it), type `python manage.py makemigrations blog`. It will look like this:

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      0001_initial.py:
      - Create model Post
    

Django prepared for us a migration file that we have to apply now to our database, type `python manage.py migrate blog`, the output should be:

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

Hurray! Our Post model is now in our database, it would be nice to see it, right? Jump to the next chapter to see what your Post looks like!