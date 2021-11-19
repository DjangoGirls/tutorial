# Modelos en Django

Lo que queremos crear ahora es algo que almacene todas las entradas de nuestro blog. Pero para poder hacerlo tenemos que hablar un poco sobre algo llamado `objetos`.

## Objetos

Hay un concepto en el mundo de la programación llamado `programación orientada a objetos`. La idea es que en lugar de escribir todo como una aburrida secuencia de instrucciones de programación podemos modelar cosas y definir cómo interactúan entre ellas.

Entonces, ¿qué es un objeto? Es un conjunto de propiedades y acciones. Suena raro, pero te daremos un ejemplo.

Si queremos modelar un gato crearemos un objeto `Gato` que tiene algunas propiedades como: `color`, `edad`, `temperamento` (como bueno, malo, o dormilón ;)), y `dueño` (este es un objeto `Persona` o en caso de un gato callejero, esta propiedad está vacía).

Luego, el `Gato` tiene algunas acciones como: `ronronear`, `arañar` o `alimentar` (en cuyo caso daremos al gato algo de `ComidaDeGato`, el cual debería ser un objeto aparte con propiedades como `sabor`).

    Gato
    ---------
    color
    edad
    humor
    dueño
    ronronear()
    rasguñar()
    alimentarse(comida_de_gato)
    
    

    ComidaDeGato
    --------
    sabor
    

Básicamente se trata de describir cosas reales en el código con propiedades (llamadas `propiedades del objeto`) y las acciones (llamadas `métodos`).

Y ahora, ¿cómo modelamos las entradas en el blog? Queremos construir un blog, ¿no?

Necesitamos responder a la pregunta: ¿Qué es una entrada de un blog? ¿Qué propiedades debería tener?

Bueno, seguro que nuestras entradas de blog necesitan un texto con su contenido y un título, ¿cierto? También sería bueno saber quién lo escribió, así que necesitamos un autor. Por último, queremos saber cuándo se creó y publicó la entrada.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

¿Qué tipo de cosas podría hacerse con una entrada del blog? Sería bueno tener algún `método` que publique la entrada, ¿no?

Así que vamos a necesitar el método `publicar`.

Puesto que ya sabemos lo que queremos lograr, ¡podemos empezar a modelarlo en Django!

## Modelos en Django

Sabiendo qué es un objeto, podemos crear un modelo en Django para nuestros entradas de blog.

Un modelo en Django es un tipo especial de objeto que se guarda en la `base de datos`. Una base de datos es una colección de datos. Es un lugar en el cual almacenarás la información sobre usuarios, tus entradas de blog, etc. Utilizaremos una base de datos SQLite para almacenar nuestros datos. Este es el adaptador de base de datos predeterminado en Django -- será suficiente para nosotros por ahora.

Puedes pensar el modelo en la base de datos, como una hoja de cálculo con columnas (campos) y filas (datos).

### Crear una aplicación

Para mantener todo en orden, crearemos una aplicación separada dentro de nuestro proyecto. Es muy bueno tener todo organizado desde el principio. Para crear una aplicación, necesitamos ejecutar el siguiente comando en la consola (dentro de la carpeta de `djangogirls` donde está el archivo `manage.py`):

{% filename %}Mac OS X y Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

Notarás que se ha creado un nuevo directorio `blog` y ahora contiene una cantidad de archivos. Los directorios y archivos en nuestro proyecto deberían verse así:

    djangogirls
    ├── blog
    │   ├── admin.py
    │   ├── apps.py
    │   ├── __init__.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    
    

Después de crear una aplicación, también necesitamos decirle a Django que debe utilizarla. Eso se hace en el fichero `mysite/settings.py` -- ábrelo en el editor. Tenemos que encontrar `INSTALLED_APPS` y agregar una línea que contiene `'blog.apps.BlogConfig',` justo por encima de `]`. El producto final debe tener este aspecto:

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog.apps.BlogConfig',
]
```

### Crear el modelo del Post

En el archivo `blog/models.py` definimos todos los objetos llamados `Models`. Este es un lugar en el cual definiremos nuestra entrada del blog.

Abre `blog/models.py` en el editor, borra todo, y escribe código como este:

{% filename %}blog/models.py{% endfilename %}

```python
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey('auth.User', on_delete=models.CASCADE)
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
```

> Comprueba nuevamente que usas dos guiones bajos (`_`) en cada lado de `str`. Esta convención se usa en Python con mucha frecuencia y a veces también se llaman "dunder" (abreviatura de "double-underscore" o, en español, "doble guión bajo").

Da un poco de miedo, ¿no? Pero no te preocupes, ¡vamos a explicar qué significan estas líneas!

Todas las líneas que comienzan con `from` o `import` son líneas para agregar algo de otros archivos. Así que en vez de copiar y pegar las mismas cosas en cada archivo, podemos incluir algunas partes con `from... import ...`.

`class Post(models.Model):`, esta línea define nuestro modelo (es un `objeto`).

- `class` es una palabra clave que indica que estamos definiendo un objeto.
- `Post` es el nombre de nuestro modelo. Podemos darle un nombre diferente (pero debemos evitar espacios en blanco y caracteres especiales). Siempre inicia el nombre de una clase con una letra mayúscula.
- `models.Model` significa que Post es un modelo de Django, así Django sabe que debe guardarlo en la base de datos.

Ahora definimos las propiedades de las que hablábamos: `title`, `text`, `created_date`, `published_date` y `author`. Para ello tenemos que definir el tipo de cada campo (¿es texto? ¿un número? ¿una fecha? ¿una relación con otro objeto como un User (usuario)?)

- `models.CharField`, así es como defines un texto con un número limitado de caracteres.
- `models.TextField`, este es para texto largo sin límite. Suena perfecto para el contenido de la entrada del blog, ¿no?
- `models.DateTimeField`, este es fecha y hora.
- `modelos.ForeignKey`, este es una relación (link) con otro modelo.

No vamos a explicar aquí cada pedacito de código porque nos tomaría demasiado tiempo. Debería echar un vistazo a la documentación de Django si desea obtener más información sobre los campos Modelo y cómo definir otras cosas distintas a las descritas anteriormente (https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types).

¿Y qué sobre `def publish(self):`? Es exactamente el método `publish` que mencionábamos antes. `def` significa que es una función/método y `publish` es el nombre del método. Puedes cambiar el nombre del método, si quieres. La regla de nomenclatura es utilizar minúsculas y guiones bajos en lugar de espacios. Por ejemplo, un método que calcule el precio medio se podría llamar `calcular_precio_medio`.

Los métodos suelen devolver (`return`, en inglés) algo. Hay un ejemplo de esto en el método `__str__`. En este escenario, cuando llamemos a `__str__()` obtendremos un texto (**string**) con un título de Post.

También, nota que ambos `def publish(self):`, y `def __str__(self):` son indentados dentro de nuestra clase. Porque Python es sensible a los espacios en blancos, necesitamos indentar nuestros métodos dentro de la clase. De lo contrario, los métodos no pertenecen a la clase, y puedes obtener un comportamiento inesperado.

Si algo todavía no está claro sobre modelos, ¡no dudes en preguntar a tu guía! Sabemos que es complicado, sobre todo cuando aprendes lo que son funciones y objetos al mismo tiempo. Pero con suerte, ¡todo tiene un poco más de sentido para ti ahora!

### Crear tablas para los modelos en tu base de datos

El último paso aquí es agregar nuestro nuevo modelo a la base de datos. Primero tenemos que hacer saber a Django que hemos hecho cambios en nuestro modelo. (Lo acabamos de crear!) Ve a tu terminal y escribe `python manage.py makemigrations blog`. Se verá así:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Nota:** Recuerda guardar los archivos que edites. De otro modo, tu computador ejecutara las versiones anteriores lo que puede ocasionar errores inesperados.

Django preparó un archivo de migración que ahora tenemos que aplicar a nuestra base de datos. Escribe `python manage.py migrate blog` y el resultado debería ser:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

¡Hurra! ¡Nuestro modelo Post ya está en nuestra base de datos! Estaría bien verlo, ¿no? ¡Salta al siguiente capítulo para ver qué aspecto tiene tu Post!