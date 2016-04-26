# Les modèles dans Django

Maintenant, nous aimerions créer quelque chose qui permet de stocker les articles de notre blog. Mais avant de pouvoir faire ça, nous allons tout d'abord devoir vous parler d'un truc qui s'appelle les `objets`.

## Les objets

Il existe un concept en programmation qu'on appelle la `programmation orientée objets`. L'idée, c'est de modéliser les choses et de définir comment elles interagissent entre elles plutôt que de tout voir comme une séquence d'instructions.

Du coup, c'est quoi un objet ? C'est une collection de propriétés et d'actions. Ça a l'air bizarre dit comme ça. Un exemple devrait vous permettre d'y voir un peu plus clair.

Si on veut modéliser un chat, nous allons créer un objet `Chat` qui a quelques propriétés comme `couleur`, `age`, `humeur` (bonne humeur, mauvaise humeur, fatigué ;)). Il peut aussi avoir un `propriétaire` (un objet `Personne`), mais ce n'est pas obligatoire : cette propriété pourrait être vide dans le cas d'un chat sauvage.

Ensuite, nous pouvons donner des actions au `Chat` : `ronronner`, `gratter` ou `manger`. (Dans ce dernier cas, on donne au chat un objet `NourriturePourChat`, qui peut lui aussi avoir ses propres propriétés, comme le `goût`).

    Chat
    --------
    couleur
    age
    humeur
    propriétaire
    ronronner()
    gratter()
    nourrir(nourriture_pour_chat)


    NourriturePourChat
    --------
    gout


L'idée qu'il faut retenir, c'est que l'on décrit les choses du monde réel avec des propriétés (appelées `propriétés des objets`) et des actions (appelées `méthodes`).

Du coup, comment modéliser les articles de blog ? C'est bien gentil les chats, mais ce qui nous intéresse, ça reste de faire un blog !

Pour ça, il faut répondre à la question : qu'est-ce qu'un article de blog ? Quelles propriétés devrait-il avoir ?

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

Un modèle Django est un type particulier d'objet : il est sauvegardé dans la `database`. Une base de données est une collection de données. C'est à cet endroit que l'on stocke toutes les informations au sujet des utilisateurs, des blog posts, etc. Pour stocker nos données, nous allons utiliser une base de données SQLite. C'est la base de données par défaut dans Django. Elle sera largement suffisante pour ce que nous voulons faire.

Pour vous aider à visualiser ce qu'est une base de données, pensez à un tableur avec des colonnes (champs) et des lignes (données).

### Créer une application

Pour éviter le désordre, nous allons créer une application séparée à l'intérieur de notre projet. Prenez l'habitude de bien tout organiser dès le début. Afin de créer une application, nous avons besoin d'exécuter la commande suivante dans notre console (prenez garde à bien être dans le dossier `djangogirls` où se trouve le fichier `manage.py`) :

    (myvenv) ~/djangogirls$ python manage.py startapp blog


Vous pouvez voir qu'un nouveau dossier `blog` a été créé et qu'il contient différents fichiers. Vos dossiers et fichiers liés à votre projet doivent maintenant être organisés selon cette structure :

    djangogirls
    ├── mysite
    |       __init__.py
    |       settings.py
    |       urls.py
    |       wsgi.py
    ├── manage.py
    └── blog
        ├── migrations
        |       __init__.py
        ├── __init__.py
        ├── admin.py
        ├── models.py
        ├── tests.py
        └── views.py


Après avoir créé une nouvelle application, vous devez dire à Django de l'utiliser. Pour cela, nous allons éditer le fichier `mysite/settings.py`. Trouvez la section `INSTALLED_APPS` et ajoutez `'blog',` juste avant `)`. La section doit maintenant ressembler à ceci :

```python
INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
)
```

### Créer un modèle de blog post

Le fichier `blog/models.py` permet de définir les objets que nous appelons des `modèles`. C'est à cet endroit que nous allons définir ce qu'est un blog post. Pour éviter tout problème (les caractères accentués par exemple!), nous allons garder les termes en anglais.

Ouvrez le fichier `blog/models.py`, supprimez tout ce qui s'y trouve et copiez-y le morceau de code suivant :

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

> Vérifiez que vous avez bien utilisé deux tirets bas (`_`) autour de `str`. C'est une convention fréquemment utilisée en Python qui porte même un petit nom en anglais : "dunder", pour "double-underscore".

Ce gros morceau de code a l'air effrayant mais, ne vous inquiétez pas : nous allons vous expliquer ce que signifie chacune de ces lignes!

Toutes les lignes qui commencent par `from` ou `import` sont des lignes qui permettent d'importer des morceaux d'autres fichiers. Concrètement, au lieu de recopier ou de copier-coller la même chose dans différents fichiers, nous pouvons tout simplement faire référence à certains morceaux d'autres fichiers à l'aide de `from ... import ...`.

`class Post(models.Model):` - C'est cette ligne qui permet de définir notre modèle. C'est un `object`).

*   Le mot clef spécial `class` permet d'indiquer que nous sommes en train de définir un objet.
*   `Post` est le nom de notre modèle. Vous pouvez lui donner un autre nom mais vous ne pouvez pas utiliser de caractères spéciaux ou accentués ni insérer des espaces. Le nom d'une classe commence toujours par une majuscule.
*   `models.Model` signifie que Post est un modèle Django. Comme ça, Django sait qu'il doit l'enregistrer dans la base de données.

Maintenant, nous allons pouvoir définir les propriétés dont nous parlions au début de ce chapitre : `title (titre)`, `text (texte)`, `created_date (date de création)`, `published_date (date de publication)` et `author (auteur)`. Pour cela, nous allons avoir besoin de définir le type de chaque champ (Est-ce que c'est du texte? Un nombre ? Une date ? Une relation à un autre objet, un utilisateur par exemple ?).

*   `models.CharField` - Cela nous permet de définir un champ texte avec un nombre limité de caractères.
*   `models.TextField` - Cela nous permet de définir un champ texte sans limite de caractères. Parfait pour le contenu d'un blog post !
*   `models.DateTimeField` - Définit que le champ en question est une date ou une heure.
*   `models.ForeignKey` - C'est un lien vers un autre modèle.

Malheureusement, nous n'avons pas le temps de vous expliquer tous les bouts de code que nous allons manipuler dans ce tutoriel. Si vous voulez en savoir un peu plus sur les différents champs disponibles dans les modèles ou que vous aimeriez définir quelque chose qui n'est pas listé dans les exemples ci-dessus, n'hésitez pas à consulter la documentation de Django (https://docs.djangoproject.com/fr/1.8/ref/models/fields/#field-types).

Et sinon, c'est quoi `def publish(self):` ? Il s'agit de notre méthode `publish` dont nous parlions tout à l'heure. `def` signifie que nous créons une fonction/méthode qui porte le nom `publish`. Vous pouvez changer le nom de la méthode si vous le souhaitez. N'oubliez pas les règles de nommage et pensez à utiliser des minuscules et des tirets bas à la place des espaces. Par exemple, une méthode qui calcule le prix moyen d'un produit pourrait s'appeler `calcul_prix_moyen`.

Les méthodes renvoient (`return`) souvent quelque chose. C'est le cas de la méthode `__str__`. Dans notre tutoriel, lorsque nous appellerons la méthode `__str__()`, nous allons obtenir du texte (**string**) avec un titre de Post.

Si quelque chose ne vous parait pas clair au sujet des modèles, n'hésitez pas à demander à votre coach ! Cela peut être compliqué à comprendre la première fois, surtout lorsque l'on apprend les objets et les fonctions en même temps. Gardez espoir ! Avec le temps, tout cela vous paraitra de moins en moins magique et de plus en plus évident !

### Créer des tables pour votre modèle dans votre base de données

La dernière étape pour cette section est d'ajouter notre nouveau modèle à notre base de données. Tout d'abord, nous devons signaler à Django que nous venons de créer notre modèle. Tapez `python manage.py makemigrations blog` dans votre console. Le résultat devrait ressembler à ça :

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      0001_initial.py:
      - Create model Post


Django vient de nous préparer un fichier de migration que nous allons pouvoir appliquer dès maintenant à notre base de données. Pour cela, tapez `python manage.py migrate blog`. Normalement, vous devrez voir ceci s'afficher dans votre console :

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Rendering model states... DONE
      Applying blog.0001_initial... OK


Youpi ! Notre modèle Post est maintenant intégré à la base de données. Ce serait cool de voir à quoi il ressemble réellement ! Pour ça, il va falloir attaquer la section suivante ! Au boulot ;)!
