# Modelos en Django

Lo que queremos crear ahora es algo que va a almacenar todas las entradas en nuestro blog. Pero para poder hacerlo tenemos que hablar un poco de acerca de algo llamado `objetos`.

## Objetos

Hay un concepto en el mundo de la programación llamado `programación orientada a objetos`. La idea es que en lugar de escribir todo como una aburrida secuencia de instrucciones de programación podemos modelar cosas y definir cómo interactúan con las demás.

Entonces ¿qué es un objeto? Es un conjunto de propiedades y acciones, suena raro, pero te ponemos un ejemplo:

Si queremos modelar un gato, crearemos un objeto `Gato` que tiene diversas propiedades, como `color`, `edad`, `estado de ánimo` (es decir, bueno, malo, sueño ;)), `dueño` (que es un objeto `persona` o tal vez, en el caso de que el gato sea callejero, esta propiedad estara vacía).

Y luego el `Gato` tiene algunas acciones: `ronronear`, `aranar` (es recomendable no utilizar caracteres especiales, ¡la "ñ" lo es!) o `alimentarse` (en la cual daremos el gato algunos `ComidaDeGato`, que podría ser un objeto independiente con propiedades, como por ejemplo, `sabor`).

    Gato
    ---------
    color
    edad
    humor
    dueño
    ronronear()
    aranar()
    alimientarse(comida_de_gato)

    ComidaDeGato
    ----------
    sabor


Básicamente se trata de describir cosas reales en el código a través de las propiedades (llamadas `Propiedades del objeto`) y las acciones (llamadas `métodos`).

Y ahora ¿cómo modelamos las entradas en el blog? Porque queremos construir un blog, ¿no?

Primero tenemos que responder algunas preguntas: ¿qué es una entrada de un blog? ¿qué características debería tener?

Bueno, seguro que nuestras entradas necesitan un texto con su contenido y un título, ¿cierto?, también sería bueno saber quién lo escribió, así que necesitamos un autor y por último, queremos saber cuando fue creada y publicada dicha entrada.

    Entrada
    ---------

    título
    texto
    autor
    fecha_creacion
    fecha_publicacion


¿Qué tipo de cosas podría hacerse con una entrada del blog? Sería bueno tener algún `método` que publique la entrada, ¿no?

Así que vamos a necesitar el método `publicar`.

Puesto que ya sabemos lo que queremos hacer, ¡podemos empezar a crear nuestro Modelo en Django!

## Modelo en Django

Sabiendo que es un objeto, podemos crear un modelo en Django para nuestras entradas en nuestro Blog.

Un modelo en Django es un tipo especial de objeto, que se almacena en la `base de datos`. Una base de datos es un conjunto de datos y allí es donde almacenaremos la información sobre usuarios, entradas del blogs, etc. Utilizaremos una base de datos SQLite para almacenar nuestros datos. Este es el adaptador de base de datos predeterminada en Django, será suficiente para nosotros por ahora.

Piensa en el modelo como una hoja de cálculo con columnas (campos) y filas (datos).

### Creando una aplicación

Para mantener todo en orden, crearemos una aplicación separada dentro de nuestro proyecto. Es muy bueno tener todo organizado desde el principio. Para crear una aplicación ejecutaremos el siguiente comando en la consola (dentro `djangogirls` donde está el archivo `manage.py`):

    (myvenv) ~/djangogirls$ python manage.py startapp blog


Verás que se crea un nuevo directorio llamado `blog` y contiene una serie de archivos. Los directorios y archivos en nuestro proyecto deberían parecerse a esto:

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


Después de crear una aplicación, también necesitaremos decirle a Django que debe utilizarla. Lo hacemos en el archivo `mysite/settings.py`. Tenemos que encontrar `INSTALLED_APPS` y añadir una línea que contiene `'blog',` justo por encima de `)`. El resultado final debe tener este aspecto:

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

En el archivo `blog/models.py` definiremos todos los objetos llamados `Models`, así que este es el lugar en el cual definiremos nuestro modelo post.

Vamos abrir `blog/models.py`, eliminamos todo y escribimos un código como este:

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


> Vuelve a verificar que has usado dos caracteres undescore (`_`) en cada lado del `str`. Son utilizos con frecuencia en Python y a veces también los llamamos "dunder" (diminutivo de "doble-subrayado").

Es aterrador, ¿cierto? Pero no te preocupes, ¡vamos a explicar qué significan estas líneas!

Todas las líneas a partir `from` o de `import` son líneas para añadir algo de otros archivos. Así que en vez de copiar y pegar las mismas cosas en cada archivo, podemos incluir algunas partes con `from... import ...`.

`class Post(models.Model):` - esta linea define nuestro modelo (es un `objeto`).

*   `class` Es una palabra clave que indica que estamos definiedo un objeto.
*   `Post` Es el nombre de nuestro modelo, podemos darle un nombre diferente (pero debemos evitar espacios en blanco y caracteres especiales). Una clase siempre comienza con su primera letra en mayúscula.
*   `models.Model` Significa que Post es un modelo de Django, así Django sabe que debe guardarlo en la base de datos.

Ahora definimos las propiedades que hablábamos: `title`, `text`, `created_date`, `published_date` y `author`. Para hacer eso tenemos que definir un tipo de campo (¿Es texto? ¿Un número? ¿Una fecha? Una relación con otro objeto, es decir, ¿un usuario?).

*   `models.CharField` - esto es como defines un texto con un número limitado de caracteres.
*   `modelos.TextField`- esto es para textos largos sin un límite. ¿Será ideal para un blog post contenido, verdad?
*   `models.DateTimeField` - esta es la fecha y hora.
*   `modelos.ForeignKey`-este es una relación a otro modelo.

No vamos a explicar cada pedacito de código, ya que nos tomaría demasiado tiempo. Debes echar un vistazo a la documentación de Django. Si quieres saber más sobre los campos de Modelos y cómo definir cosas diferentes a las descritas anteriormente (https://docs.djangoproject.com/en/1.8/ref/models/fields/#field-types).

¿Y qué sobre `def publish(self):`? Es exactamente el método `publish` del que hablábamos antes. 
*   `def` significa que se trata de una función o método. 
*   `publish` es el nombre del método. Puedes cambiarlo, si quieres, la regla es que usamos minúscula y guiones bajos en lugar de espacios (es decir, si quieres tener un método que calcule el precio medio, este podría llamarse `calculate_average_price`).

Los métodos muy a menudo `devuelven` algo. Hay un ejemplo de esto en el método `__str__`. En este escenario, cuando llamamos a `__str__()` obtendremos un texto (**string**) con un título de Post.

Si algo todavía no está claro sobre modelos, ¡no dudes en preguntar a tu tutor! Sabemos que es muy complicado, sobre todo cuando estás entendiendo qué funciones y objetos son mientras sigues este documento. Con suerte, ¡todo tiene un poco más de sentido para ti ahora!

### Crear tablas para los modelos en tu base de datos

El último paso es añadir nuestro nuevo modelo a nuestra base de datos. Primero tenemos que hacer Django sepa que tenemos algunos cambios en nuestro modelo (acabamos de crearlo), escribe `python manage.py makemigrations blog`. Se verá así:

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      0001_initial.py:
      - Create model Post


Django nos prepara un archivo de migración que tenemos que aplicar ahora a nuestra base de datos, escribe `python manage.py migrate blog`, el resultado debe ser:

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK


¡Hurra! Nuestro modelo de Post está ahora en nuestra base de datos, sería bueno verlo, ¿no? Dirígete al siguiente capítulo para ver cómo luce tu Post!
