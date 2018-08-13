# Les modèles dans Django

Maintenant, nous aimerions créer quelque chose qui permet stocker les articles de notre blog. Mais avant de pour pouvoir faire ça, nous allons tout d'abord devoir vous parler d'un truc qui s'appelle les `objets`.

## Les objets

There is a concept in programming called `object-oriented programming`. The idea is that instead of writing everything as a boring sequence of programming instructions, we can model things and define how they interact with each other.

Du coup, c'est quoi un objet ? C'est une collection de propriétés et d'actions. Ça a l'air bizarre dit comme ça. Un exemple devrait vous permettre d'y voir un peu plus clair.

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
    

L'idée qu'il faut retenir, c'est que l'on décrit les choses du monde réel avec des propriétés (appelées `propriétés des objets`) et des actions (appelées `méthodes`).

Du coup, comment modéliser les articles de blog ? C'est bien gentil les chats, mais ce qui nous intéresse, ça reste de faire un blog !

Pour ça, il faut réponde à la question : qu'est-ce qu'un article de blog ? Quelles propriétés devrait-il avoir ?

Pour commencer, notre blog post doit avoir du texte : il a bien du contenu et un titre, n'est-ce pas ? It would be also nice to know who wrote it – so we need an author. Enfin, on aimerait aussi savoir quand l'article a été écrit et publié.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Quel genre d'actions pourrions-nous faire sur un article de blog ? Un bon début serait d'avoir une `méthode` qui permet de publier le post.

On va donc avoir besoin d'une méthode `publish`.

Voilà, nous avons une idée de ce que nous avons besoin. Allons modéliser tout ça dans Django!

## Les modèles dans Django

Maintenant que nous savons ce qu'est un objet, nous allons pouvoir créer un modèle Django pour notre post de blog.

A model in Django is a special kind of object – it is saved in the `database`. Une base de données est une collection de données. C'est à cet endroit que l'on stocke toutes les informations au sujet des utilisateurs, des blog posts, etc. Pour stocker nos données, nous allons utiliser une base de données SQLite. This is the default Django database adapter – it'll be enough for us right now.

Pour vous aider à visualiser ce qu'est une base de données, pensez à un tableur avec des colonnes (champs) et des lignes (données).

### Créer une application

Pour éviter le désordre, nous allons créer une application séparée à l'intérieur de notre projet. Prenez l'habitude de bien tout organiser dès le début. Afin de créer une application, nous avons besoin d'exécuter la commande suivante dans notre console (prenez garde à bien être dans le dossier `djangogirls` où se trouve le fichier `manage.py`) :

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

### Créer un modèle de blog post

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

> Double-check that you use two underscore characters (`_`) on each side of `str`. C'est une convention fréquemment utilisée en Python qui porte même un petit nom en anglais : "dunder", pour "double-underscore".

It looks scary, right? But don't worry – we will explain what these lines mean!

All lines starting with `from` or `import` are lines that add some bits from other files. So instead of copying and pasting the same things in every file, we can include some parts with `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- Le mot clef spécial `class` permet d'indiquer que nous sommes en train de définir un objet.
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- `models.Model` signifie que Post est un modèle Django. Comme ça, Django sait qu'il doit l'enregistrer dans la base de données.

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

### Créer des tables pour votre modèle dans votre base de données

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