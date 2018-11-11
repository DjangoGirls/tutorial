# Les modèles dans Django

Maintenant, nous aimerions créer quelque chose qui permet stocker les articles de notre blog. Mais avant de pour pouvoir faire ça, nous allons tout d'abord devoir vous parler d'un truc qui s'appelle les `objets`.

## Les objets

Il existe un concept en programmation qu'on appelle la `programmation orientée objets`. L'idée, c'est de modéliser les choses et de définir comment elles interagissent entre elles plutôt que de tout voir comme une séquence d'instructions.

Du coup, c'est quoi un objet ? C'est une collection de propriétés et d'actions. Ça a l'air bizarre dit comme ça. Un exemple devrait vous permettre d'y voir un peu plus clair.

Si on veut modéliser un chat, nous allons créer un objet `Chat` qui a des propriétés comme `couleur`, `âge`, `humeur` (bonne humeur, mauvaise humeur, fatigué ;)) et `propriétaire` (ce qui pourrait être un objet `Personne`, ou, s'il s'agit d'un chat sauvage, cette propriété pourrait être simplement vide).

Ensuite, nous pouvons donner des actions au `Chat` : `ronronner`, `gratter` ou `manger`. (Dans ce dernier cas, on donne au chat de la `NourriturePourChat`, ce qui peut être un objet séparé avec ses propres propriétés, comme le `goût`).

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

Pour commencer, notre blog post doit avoir du texte : il a bien du contenu et un titre, n'est-ce pas ? Et puis, ce serait bien de savoir aussi qui l'a écrit. On a donc besoin d'un auteur. Enfin, on aimerait aussi savoir quand l'article a été écrit et publié.

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

Un modèle Django est un type particulier d'objet : il est sauvegardé dans la `base de données`. Une base de données est une collection de données. C'est à cet endroit que l'on stocke toutes les informations au sujet des utilisateurs, des blog posts, etc. Pour stocker nos données, nous allons utiliser une base de données SQLite. C'est la base de données par défaut dans Django. Elle sera largement suffisante pour ce que nous voulons faire.

Pour vous aider à visualiser ce qu'est une base de données, pensez à un tableur avec des colonnes (champs) et des lignes (données).

### Créer une application

Pour éviter le désordre, nous allons créer une application séparée à l'intérieur de notre projet. Prenez l'habitude de bien tout organiser dès le début. Afin de créer une application, nous avons besoin d'exécuter la commande suivante dans notre console (prenez garde à bien être dans le dossier `djangogirls` où se trouve le fichier `manage.py`) :

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

Vous pouvez voir qu'un nouveau dossier `blog` a été créé et qu'il contient différents fichiers. Les dossiers et fichiers liés à votre projet doivent maintenant être organisés selon cette structure :

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
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    └── requirements.txt
    

Après avoir créé une nouvelle application, vous devez dire à Django de l'utiliser. Nous faisons cela via le fichier `mysite/settings.py`. Ouvrez-le dans votre éditeur de code. Trouvez la section `INSTALLED_APPS` et ajoutez une ligne `'blog',` juste avant `]`. La section doit maintenant ressembler à ceci :

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

Le fichier `blog/models.py` permet de définir les objets que nous appelons des `modèles`. C'est à cet endroit que nous allons définir ce que c'est qu'un un blog post.

Ouvrez le fichier `blog/models.py` dans l'éditeur de code, supprimez tout ce qui s'y trouve et copiez-y le morceau de code suivant :

{% filename %}blog/models.py{% endfilename %}

```python
from django.conf import settings
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(default=timezone.now)
    published_date = models.DateTimeField(blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> Vérifiez que vous avez bien utilisé deux tirets bas (`_`) autour de `str`. C'est une convention fréquemment utilisée en Python qui porte même un petit nom en anglais : "dunder", pour "double-underscore".

Ce gros morceau de code a l'air effrayant mais, ne vous inquiétez pas : nous allons vous expliquer ce que signifie chacune de ces lignes!

Toutes les lignes qui commencent par `from` ou `import` sont des lignes qui permettent d'importer des morceaux d'autres fichiers. Concrètement, au lieu de recopier ou de copier-coller la même chose dans différents fichiers, nous pouvons tout simplement faire référence à certains morceaux d'autres fichiers à l'aide de `from ... import ...`.

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