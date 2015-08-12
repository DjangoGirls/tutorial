# Les modèles dans Django

Maintenant, ce qu'on veut, c'est un moyen de stocker les articles de notre blog. Mais, pour pouvoir faire ça, on doit tout d'abord parler d'un truc qui s'appelle les `objets`.

## Les objets

Il y a un concept en programmation qu'on appelle la `programmation orientée objets`. L'idée, c'est de modéliser les choses et de définir comment elles interagissent entre elles plutôt que de tout voir comme une séquence d'instructions.

Du coup, c'est quoi un objet? C'est une collection de propriétés et d'actions. Ça a l'air bizarre. Un exemple va nous permettre d'y voir plus clair.

Si on veut modéliser un chat, nous allons créer un objet `Chat` qui a quelques propriétés comme `couleur`, `age`, `humeur` (bonne humeur, mauvaise humeur, fatigué ;)). Il peut aussi avoir un `propriétaire` (un objet `Personne`) mais ce n'est pas obligatoire: cette propriété pourrait être vide dans le cas d'un chat sauvage.

Ensuite, nous pouvons donner des actions au `Chat`: `ronronner`, `gratter` ou `manger`. (Dans ce dernier cas, on donne au chat un objet `NourriturePourChat`, qui peut lui aussi avoir ses propres propriétés, comme le `goût`).

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

Du coup, comment modéliser les articles de blog? C'est bien gentil les chats, mais ce qui nous intéresse, ça reste de faire un blog!

Pour ça, il faut réponde à la question: qu'est-ce qu'un article de blog? Quelles propriétés a-t-il?

Déjà, notre blog post doit avoir du texte, comme du contenu et un titre par exemple, n'est-ce pas? Et puis, ce serait bien de savoir qui l'a écrit. On a donc besoin d'un auteur. Enfin, on aimerait aussi savoir quand l'article a été écrit et publié.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Quel genre d'actions peut-on faire sur un article de blog? Un bon début serait d'avoir une `méthode` qui permet de publier le post.

On va donc avoir besoin d'une méthode `publish`.

Voilà, nous savons ce que nous voulons: nous pouvons commencer à la modéliser dans Django!

## Les modèles dans Django

Maintenant que nous savons ce qu'est un objet, nous allons pouvoir créer un modèle Django pour notre post de blog.

Un modèle Django est un type particulier d'objet: il est sauvegardé dans la `database`. Une base de données est une collection de données. C'est à cet endroit que l'on stocke toutes les informations au sujet des utilisateurs, des blog posts, etc. Pour stocker nos données, nous allons utiliser une base de données SQLite. C'est la base de données par défaut dans Django. Elle sera largement suffisante pour ce que nous voulons faire.

Pour vous aider à visualiser ce qu'est une base de données, pensez à un tableur avec des colonnes (champs) et des lignes (données).

### Créer une application

Pour ne pas nous laisser déborder par le désordre et garder une vision claire de ce que nous faisons, nous allons créer une application séparée à l'intérieur de notre projet. Prenez l'habitude de bien tout organiser dès le début. Afin de créer une application, nous avons besoin d'exécuter la commande suivante dans notre console (prenez garde à bien être dans le dossier `djangogirls` où se trouve le fichier `manage.py`):

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

Vous pouvez voir qu'un nouveau dossier `blog` a été créé et qu'il contient différents fichiers. Vos dossiers et fichiers liés à votre projet doivent maintenant être organisés selon cette structure:

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
    

Après avoir créé une nouvelle application, vous devez dire à Django de l'utiliser. Pour faire ça, nous allons nous servir du fichier `mysite/settings.py`. Vous allez devoir trouver la section `INSTALLED_APPS` et ajouter à la fin de la liste la ligne `'blog',``)`. Après ajout, cette section doit ressembler à ceci:

    INSTALLED_APPS = (
        'django.contrib.admin',
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.messages',
        'django.contrib.staticfiles',
        'blog',
    )
    

### Créer un modèle de blog post

Le fichier `blog/models.py` permet de définir les objets que nous appelons des `modèles`. C'est à cet endroit que nous allons définir ce qu'est un blog post.

Ouvrez le fichier `blog/models.py`, supprimez tout ce qui s'y trouve et copiez-y le morceau de code suivant:

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
    

> Si jamais vous avez préféré le taper à la main, vérifiez que vous avez bien utilisé deux tirets bas (`_`) autour de `str`. Ils sont assez fréquemment utilisés en Python et portent parfois le doux nom de "dunder" ("double-underscore").

Ce gros morceau de code a l'air effrayant! Ne vous inquiétez pas, nous allons vous expliquer ce que signifie chacune de ces lignes!

Toutes les lignes qui commencent par `from` ou `import` sont des lignes qui permettent d'importer des morceaux d'autres fichiers. Concrètement, au lieu de recopier ou de copier-coller la même chose dans différents fichiers, nous pouvons tout simplement faire référence à certains morceaux d'autres fichiers à l'aide de `from ... import ...`.

`class Post(models.Model):` - C'est cette ligne qui permet de définir notre modèle. C'est un `object`).

*   Le mot clef spécial `class` permet d'indiquer que nous sommes en train de définir un objet.
*   `Post` est le nom de notre modèle. Vous pouvez lui donner un autre nom mais vous ne pouvez pas utiliser de caractères spéciaux ou accentués ainsi qu'y insérer des espaces. Le nom d'une classe commence toujours par une majuscule.
*   `models.Model` signifie que Post est un modèle Django. Comme ça, Django sait qu'il doit l'enregistrer dans la base de données.

Maintenant, nous allons pouvoir définir les propriétés dont nous parlions au début de ce chapitre: `title (titre)`, `text (texte)`, `created_date (date de création)`, `published_date (date de publication)` et `author (auteur)`. Pour cela, nous allons avoir besoin de définir le type de chaque champ (Est-ce du texte? Un nombre? Une date? Une relation à un autre objet, un utilisateur par exemple?).

*   `models.CharField` - Cela nous permet de définir un champ texte avec un nombre limité de caractères.
*   `models.TextField` - Ce type de champ est pour les longs textes car il ne possède pas de limite de taille. Ça ne vous paraît pas être pile ce que l'on cherche pour le contenu de nos blog posts?
*   `models.DateTimeField` - Définit que le champ en question est une date ou une heure.
*   `models.ForeignKey` - C'est un lien vers un autre modèle.

Malheureusement, nous n'avons pas le temps de vous expliquer tous les bouts de code que nous allons manipuler dans ce tutoriel. Si vous voulez en savoir plus sur les modèles Django, n'hésitez pas à consulter la documentation officielle de Django (https://docs.djangoproject.com/en/1.7/ref/models/fields/#field-types).

Et sinon, c'est quoi `def publish(self):`? Il s'agit de notre méthode `publish (publication)` dont nous parlions tout à l'heure. C'est le mot `def` qui permet de dire que c'est une fonction/méthode. `publish` est le nom de notre méthode. Vous pouvez le changer si vous le voulez. Mais, si vous le faîtes, veillez à respecter les règles suivantes: n'utilisez que des minuscules, pas de caractères spéciaux ou accentués, et remplacez les espaces par des tirets bas. Par exemple, si vous vouliez créer une méthode qui permet de calculer le prix moyen de quelque chose, vous pourriez l'appeler: `calcul_prix_moyen`).

Les méthodes `retournent` très souvent quelque chose. C'est le cas de la méthode `__str__`. Dans notre tutoriel, lorsque nous appellerons `__str__()`, nous allons obtenir du texte (**string**) dans le titre du Post.

Si quelque chose ne vous paraît pas clair au sujet des modèles, n'hésitez pas à demander à votre coach! Ça peut être très compliqué à comprendre la première fois, surtout lorsque l'on apprend les objets et les fonctions en même temps. Rassurez-vous! Avec le temps, tout cela vous paraitra de moins en moins magique et de plus en plus évident!

### Créer des tables pour votre modèle dans votre base de données

La dernière étape pour cette section est d'ajouter notre nouveau modèle à notre base de données. Tout d'abord, nous allons devoir signaler à Django que nous avons fait des modifications dans notre modèle (nous venons de le créer! ). Pour cela, tapez `python manage.py makemigrations blog`. Ça ressemblera à ça:

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      0001_initial.py:
      - Create model Post
    

Django vient de nous préparer un fichier de migration que nous allons pouvoir appliquer dès maintenant à notre base de données. Pour cela, tapez `python manage.py migrate blog`. Normalement, vous devez voir ceci s'afficher dans votre console :

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

Youpi! Notre modèle Post est maintenant intégré à la base de données. Ce serait cool de voir à quoi il ressemble réellement! Pour ça, il va falloir attaquer la section suivante! Au boulot ;)
