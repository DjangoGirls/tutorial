# I modelli di Django

Vogliamo creare un qualcosa che raccoglierà tutti i post del nostro blog. Per farlo, però, dobbiamo prima introdurre i cosiddetti `oggetti`.

## Oggetti

There is a concept in programming called `object-oriented programming`. The idea is that instead of writing everything as a boring sequence of programming instructions, we can model things and define how they interact with each other.

Quindi cos'è un oggetto? È un insieme di proprietà ed azioni. Suona strano, ma ti faremo un esempio.

If we want to model a cat, we will create an object `Cat` that has some properties such as `color`, `age`, `mood` (like good, bad, or sleepy ;)), and `owner` (which could be assigned a `Person` object – or maybe, in case of a stray cat, this property could be empty).

Quindi il `Gatto` possiede anche alcune azioni: `fare_le_fusa`, `graffiare` e `alimentare` (in quest'ultimo caso, daremo al gatto del `CiboPerGatti`, che sarà un altro oggetto con le sue proprietà, come `gusto`).

    Cat
    --------
    color
    age
    mood
    owner
    purr()
    scratch()
    feed(cat_food)
    

    CatFood
    --------
    taste
    

Quindi in pratica l'idea è quella di descrivere cose vere in codice con delle proprietà (chiamate `proprietà di oggetti`) e azioni (chiamate `metodi`).

Quindi come faremo a modellare i post del blog? vogliamo costruire un blog, giusto?

Dobbiamo rispondere alla domanda: cos'è un post? Quali proprietà dovrebbe avere?

Beh, sicuramente il nostro post ha bisogno di qualche testo con il suo contenuto ed un titolo, vero? It would be also nice to know who wrote it – so we need an author. Infine, vogliamo sapere quando il post è stato creato e pubblicato.

    Post
    --------
    titolo
    testo
    autore
    data_creazione
    data_pubblicazione
    

Che tipo di cose si potrebbero fare con un post? Sarebbe bello avere qualche `metodo` che pubblica il post, vero?

Quindi avremo bisogno di un metodo `pubblicare`.

Dal momento che sappiamo già cosa vogliamo ottenere, iniziamo a modellarlo in Django!

## Modello Django

Sapendo cos'è un oggetto, possiamo creare un modello Django per il nostro post.

A model in Django is a special kind of object – it is saved in the `database`. Un database è un insieme di dati. È un posto in cui archivierai informazioni sui tuoi utenti, sui tuoi post, ecc. Useremo un database SQLite per archiviare i nostri dati. This is the default Django database adapter – it'll be enough for us right now.

Puoi pensare ad un modello nel database come ad un foglio elettronico con colonne (campi) e righe (dati).

### Creazione di un'applicazione

Per mantenere tutto ordinato, creeremo un'applicazione diversa all'interno del nostro progetto. E' molto bello avere tutto organizzato fin dall'inizio. Per creare un'applicazione abbiamo bisogno di eseguire il seguente comando nella console (dalla cartella `djangogirls` dove si trova il file `manage.py`):

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

You will notice that a new `blog` directory is created and it contains a number of files now. The directories and files in our project should look like this:

    djangogirls
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    └── mysite
        ├── __init__.py
        ├── settings.py
        ├── urls.py
        └── wsgi.py
    

After creating an application, we also need to tell Django that it should use it. We do that in the file `mysite/settings.py`. We need to find `INSTALLED_APPS` and add a line containing `'blog',` just above `]`. So the final product should look like this:

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
]
```

### Creazione di un modello blog post

In the `blog/models.py` file we define all objects called `Models` – this is a place in which we will define our blog post.

Let's open `blog/models.py`, remove everything from it, and write code like this:

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

> Assicurati di aver usato 2 underscore (`_`) da entrambi i lati di `str`. Questa convenzione viene utilizzata spesso in Python e a volte li chiamiamo anche "dunder" (abbreviazione di "doppio carattere di sottolineatura").

It looks scary, right? But don't worry – we will explain what these lines mean!

All lines starting with `from` or `import` are lines that add some bits from other files. So instead of copying and pasting the same things in every file, we can include some parts with `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class` è una parola chiave speciale che indica che stiamo definendo un oggetto.
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- `models.Model` significa che il Post è un modello Django, quindi Django sa che dovrebbe essere salvato nel database.

Now we define the properties we were talking about: `title`, `text`, `created_date`, `published_date` and `author`. To do that we need to define the type of each field (Is it text? A number? A date? A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField` – this is for long text without a limit. Sounds ideal for blog post content, right?
- `models.DateTimeField` – this is a date and time.
- `models.ForeignKey` – this is a link to another model.

We will not explain every bit of code here since it would take too much time. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.0/ref/models/fields/#field-types).

What about `def publish(self):`? This is exactly the `publish` method we were talking about before. `def` means that this is a function/method and `publish` is the name of the method. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

Methods often `return` something. There is an example of that in the `__str__` method. In this scenario, when we call `__str__()` we will get a text (**string**) with a Post title.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

If something is still not clear about models, feel free to ask your coach! We know it is complicated, especially when you learn what objects and functions are at the same time. But hopefully it looks slightly less magic for you now!

### Crea tabelle per i modelli nel tuo database

The last step here is to add our new model to our database. First we have to make Django know that we have some changes in our model. (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. It will look like this:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Note:** Remember to save the files you edit. Otherwise, your computer will execute the previous version which might give you unexpected error messages.

Django prepared a migration file for us that we now have to apply to our database. Type `python manage.py migrate blog` and the output should be as follows:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

Hurray! Our Post model is now in our database! It would be nice to see it, right? Jump to the next chapter to see what your Post looks like!