# Modelli Django

What we want to create now is something that will store all the posts in our blog. But to be able to do that we need to talk a little bit about things called `objects`.

## Oggetti

There is a concept in programming called `object-oriented programming`. The idea is that instead of writing everything as a boring sequence of programming instructions, we can model things and define how they interact with each other.

Quindi cos'è un oggetto? È un insieme di proprietà ed azioni. Suona strano, ma ti faremo un esempio.

If we want to model a cat, we will create an object `Cat` that has some properties such as `color`, `age`, `mood` (like good, bad, or sleepy ;)), and `owner` (which could be assigned a `Person` object – or maybe, in case of a stray cat, this property could be empty).

Then the `Cat` has some actions: `purr`, `scratch`, or `feed` (in which case, we will give the cat some `CatFood`, which could be a separate object with properties, like `taste`).

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
    

So basically the idea is to describe real things in code with properties (called `object properties`) and actions (called `methods`).

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

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

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
    

After creating an application, we also need to tell Django that it should use it. Lo facciamo nel file `mysite/settings.py`. We need to find `INSTALLED_APPS` and add a line containing `'blog',` just above `]`. Quindi il prodotto finale dovrebbe assomigliare a questo:

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
```

> Double-check that you use two underscore characters (`_`) on each side of `str`. Questa convenzione viene utilizzata spesso in Python e a volte li chiamiamo anche "dunder" (abbreviazione di "doppio carattere di sottolineatura").

It looks scary, right? But don't worry – we will explain what these lines mean!

Tutte le righe che iniziano con `from` oppure con `import` sono righe che aggiungono alcuni pezzi da altri file. Quindi invece di copiare e incollare le stesse cose in ogni file, possiamo includere alcune parti con `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class` è una parola chiave speciale che indica che stiamo definendo un oggetto.
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- `models.Model` significa che il Post è un modello Django, quindi Django sa che dovrebbe essere salvato nel database.

Ora definiamo le proprietà di cui stavamo parlando: `titolo`, `testo`, `data_creazione`, `data_pubblicazione` e `autore`. To do that we need to define the type of each field (Is it text? Un numero? Una data? A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField` – this is for long text without a limit. Sounds ideal for blog post content, right?
- `models.DateTimeField` – this is a date and time.
- `models.ForeignKey` – this is a link to another model.

Non spiegheremo ogni pezzo di codice perchè ci vorrebbre troppo tempo. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/1.11/ref/models/fields/#field-types).

Che dire di `def publish(self):`? This is exactly the `publish` method we were talking about before. `def` significa che questa è una funzione/metodo e `publish` è il nome del metodo. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

I metodi spesso `restituiscono` qualcosa. C'è un esempio nel metodo `__str__`. In questo caso, quando chiamiamo `__str__()` otterremo un testo (**stringa**) con il titolo del Post.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

Se c'è qualcosa di poco chiaro sui modelli, sentiti libera/o di chiedere al tuo coach! Sappiamo che è complicato, soprattutto quando impari cosa sono gli oggetti e le funzioni allo stesso tempo. Ma speriamo che sembri un po' meno magico per te per adesso!

### Crea tabelle per i modelli nel tuo database

L'ultimo passo è quello di aggiungere un nuovo modello al nostro database. First we have to make Django know that we have some changes in our model. (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. Il risultato somiglierà a questo:

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
      Rendering model states... DONE
      Applying blog.0001_initial... OK
    

Evviva! Il nostro modello Post ora è nel database! Sarebbe bello poterlo vedere, vero? Vai al prossimo capitolo per vedere com'è il tuo Post!