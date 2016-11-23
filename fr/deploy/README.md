# Déployer !

> **Note** Le chapitre suivant peut-être un peu difficile à comprendre. Accrochez-vous et allez jusqu'au bout : le déploiement fait partie intégrale du processus de développement d'un site internet. Ce chapitre a été placé au milieu du tutoriel afin de permettre à votre coach de vous aider dans cette étape un peu compliquée qu'est la mise en ligne de votre site. Si jamais vous manquez de temps à la fin de la journée, ne vous inquiétez pas ! Une fois ce chapitre terminé, vous serez en mesure de finir le tutoriel chez vous :)

Jusqu'à présent, votre site web n'était seulement disponible que sur votre ordinateur. Maintenant, vous allez apprendre à le déployer ! Déployer signifie mettre en ligne votre site pour que d'autres personnes puissent enfin voir votre app :).

Comme vous l'avez appris, un site web a besoin d'être installé sur un serveur. Il existe de très nombreux fournisseurs de serveurs sur Internet. Nous allons en utiliser un qui dispose d'un système de déploiement relativement simple : [PythonAnywhere][1]. PythonAnywhere est gratuit pour les petites applications qui n'ont pas beaucoup de visiteurs : cela correspond parfaitement à ce dont nous avons besoin pour le moment.

 [1]: https://pythonanywhere.com/

Nous allons aussi utiliser les services [GitHub][2], ce qui nous permettra d'héberger notre code en ligne. Il existe d'autres entreprises qui proposent des services similaires. Cependant, presque tous⋅tes les développeurs·ses possèdent aujourd'hui un compte Github et, dans quelques instants, vous aussi !

 [2]: https://www.github.com

Github va nous servir d'intermédiaire pour envoyer et récupérer notre code sur PythonAnywhere.

# Git

Git est un "gestionnaire de version" utilisé par de nombreux·ses développeurs·ses. Ce logiciel permet de garder une trace des modifications apportées à chaque fichier afin que vous puissiez facilement revenir en arrière ou à une version spécifique. Cette fonction est similaire au "suivi des modifications" de Microsoft Word, mais en beaucoup plus puissant.

## Installer Git

> **Note** Si vous avez suivi la partie "installation" du tutoriel, vous n'avez pas besoin d'installer Git à nouveau. Vous pouvez passer directement à la prochaine section et commencer à créer votre dépôt Git.

{% include "/deploy/install_git.md" %}

## Démarrer un dépôt Git

Git conserve toutes les modifications apportées à un ensemble de fichiers dans un "repository" (ou "dépôt"). Nous allons devoir en créer un pour notre projet. Ouvrez votre terminal et allez dans le répertoire `djangogirls`. Ensuite, tapez les commandes suivantes :

> **Note** : n'oubliez pas de vérifier dans quel répertoire vous vous trouvez avant d'initialiser votre dépôt. Pour cela tapez la commande `pwd` (OSX/Linux) ou `cd` (Windows). Vous devriez vous trouver dans le dossier `djangogirls`.

    $ git init
    Initialise un dépôt Git vide à l'emplacement ~/djangogirls/.git/
    $ git config --global user.name "Votre nom"
    $ git config --global user.email you@exemple.com


L'initialisation d'un dépôt git ne se fait qu'une fois par projet. De même, vous n'aurez plus jamais à ré-entrer votre nom d'utilisateur ou votre email.

Git va surveiller et conserver les modifications concernant l'ensemble des fichiers et dossiers présents dans ce répertoire, à l'exception de certains fichiers que nous aimerions exclure. Pour cela, nous allons créer un fichier appelé `.gitignore` dans le répertoire principal du projet. Ouvrez votre éditeur et créez un nouveau fichier en copiant le contenu suivant :

```
*.pyc
__pycache__
myvenv
db.sqlite3
/static
.DS_Store
```

Enregistrez ce fichier `.gitignore` dans votre répertoire principal "djangogirls".

> **Attention**: le point au début du nom du fichier est important ! Vous pouvez parfois rencontrer des difficultés à créer ce fichier. Par exemple, Mac ne vous laisse pas enregistrer un fichier qui commence par un point dans Finder. Pour contourner ce problème, utilisez la fonction "enregistrer sous" de votre éditeur : ça marche à tous les coups!

> **Note** L'un des fichiers spécifiés dans `.gitignore` est `db.sqlite3`. Ce fichier est votre base de donnée locale, où tous vos posts de blog sont stockés. Ce fichier n'est pas ajouté à la base de données parce que votre site internet sur PythonAnywhere utilise une base de donnée différente.  Cette base de donnée peut être en SQLite, comme celle créée localement sur votre ordinateur mais en général, une base de données appelée MySQL est utilisée parce qu'elle peut gérer beaucoup plus de visiteurs qu'une base de données SQLite. Dans tous les cas, ignorer votre base de donneés SQLite pour la copie sur GitHub signifie que tous les posts que vous avez créé jusqu'à maintenant vont rester sur votre machine locale et ne seront accessible que depuis cette machine. Vous allez devoir les ajouter à nouveau sur votre site internet en production. Considérez votre base de données locale comme une aire de jeu où vous pouvez essayer des choses différentes sans vous souciez de supprimer un de vos vrais post de blog.

Avant de taper la commande `git add` ou lorsque vous ne vous souvenez plus des changements que vous avez effectué dans votre projet, pensez à taper la commande `git status`. Cela permet surtout d'éviter les mauvaises surprises, comme l'ajout ou l'envoi d'un mauvais fichier. La commande `git status` permet d'obtenir des informations sur tous les fichiers non-suivis/modifiés/mis-à-jour, l'état de la branche, et bien plus encore. Voici ce qui se passe lorsque vous tapez cette commande :

    $ git status
    On branch master

    Initial commit

    Untracked files:
      (use "git add <file>..." to include in what will be committed)

            .gitignore
            blog/
            manage.py
            mysite/

    nothing added to commit but untracked files present (use "git add" to track)


Pour le moment, nous n'avons fait que regarder l'état de notre branche. Pour enregistrer nos changements, nous allons devoir taper les commandes suivantes :

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py


## Publier votre code sur GitHub

Allez sur [GitHub.com][2] et inscrivez-vous gratuitement (si vous possédez déjà un compte, c'est très bien!)

Ensuite, créez un nouveau dépôt en lui donnant le nom "my-first-blog". Pensez à laisser les options par défaut. Dans notre cas, il n'est pas nécessaire de cocher la case "initialise with a README". Vous pouvez aussi laisser l'option .gitignore vide car nous avons déjà créé ce fichier précédemment. Enfin, comme nous n'avons pas besoin d'une licence pour notre application, laissez le champ License à None.

![][3]

 [3]: images/new_github_repo.png

> **Note** : dans le cadre de ce tutoriel, le nom `my-first-blog` est très important. Cependant, vous êtes libre de le changer mais, attention : à chaque fois que ce nom apparaitra dans le tutoriel, vous allez devoir le substituer avec le nom que vous avez choisi. Il est probablement plus simple de garder le nom `my-first-blog` pour cette fois.

La page suivante vous donne l'URL qui va vous permettre de cloner votre dépôt. Choisissez la version « HTTPS » et copiez l'URL car nous allons rapidement en avoir besoin :

![][4]

 [4]: images/github_get_repo_url_screenshot.png

Nous avons maintenant besoin de relier nos deux dépôts : celui sur notre ordinateur et celui sur GitHub. On utilise l'expression "hook" en anglais pour cette décrire cette étape.

Tapez les instructions suivantes dans votre console (remplacez `<votre-nom-d'utilisateur-github>` avec le nom d'utilisateur de votre compte GitHub et sans les chevrons) :

    $ git remote add origin https://github.com/<votre-nom-d'utilisateur-github>/my-first-blog.git
    $ git push -u origin master


Entrez votre nom d'utilisateur et mot de passe Github. Vous devriez voir quelque chose comme ceci :

    Username for 'https://github.com': votre-nom
    Password for 'https://votre-nom@github.com':
    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/votre-nom/my-first-blog.git
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.


<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extention -->

Votre code est maintenant sur GitHub. Allez jeter un coup d’œil ! Votre code est maintenant au même endroit que d'autres projets super cool : [Django][5], [le tutoriel Django Girls][6] et les nombreux autres projets libres qui sont hébergés sur GitHub :)

 [5]: https://github.com/django/django
 [6]: https://github.com/DjangoGirls/tutorial

# Mettre votre blog en ligne avec PythonAnywhere

> **Note** Vous avez peut être déjà créé un compte PythonAnyWhere au cours de la phase d'installation - si c'est le cas, inutile de le refaire.

{% include "/deploy/signup_pythonanywhere.md" %}

## Récupérer votre code sur PythonAnywhere

Une fois enregistré sur PythonAnywhere, vous serez automatiquement redirigée sur votre écran d'accueil où se trouve la liste des consoles. Cliquez sur le lien "Bash" dans la partie "start a new console". C'est la version PythonAnywhere des consoles que vous avez sur votre ordinateur.

> **Note** : PythonAnywhere utilise Linux. Si vous êtes sous Windows, la console sera un peu différente de celle de votre ordinateur.

Importons notre code depuis Github vers PythonAnywhere en créant un "clone" de notre dépôt. Tapez la commande suivante dans la console de PythonAnywhere (n'oubliez pas d'utiliser votre nom d'utilisateur Github à la place de `<your-github-username>`):

    $ git clone https://github.com/<votre-nom-d'utilisateur-github>/my-first-blog.git


Cette commande va permettre d'effectuer une copie de votre code vers PythonAnywhere. La commande `tree my-first-blog` permet d'afficher un aperçu de ce qui se trouve maintenant sur votre serveur :

    $ tree my-first-blog
    my-first-blog/
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── migrations
    │   │   ├── 0001_initial.py
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── manage.py
    └── mysite
        ├── __init__.py
        ├── settings.py
        ├── urls.py
        └── wsgi.py


### Créer un virtualenv sur PythonAnywhere

Tout comme sur votre ordinateur, vous allez devoir créer un environnement virtuel et installer Django sur PythonAnywhere. L'opération est identique, à une différence près pour les utilisatrices de Windows : il s'agit ici d'une console Linux. Pas de panique, c'est très simple ! Ouvrez la console Bash de PythonAnywhere et tapez les commandes suivantes :

    $ cd my-first-blog

    $ virtualenv --python=python3.4 myvenv
    Running virtualenv with interpreter /usr/bin/python3.4
    [...]
    Installing setuptools, pip...done.

    $ source myvenv/bin/activate


    (mvenv) $  pip install django~=1.9.0
    Collecting django
    [...]
    Successfully installed django-1.9


> **Note** : L'étape `pip install` peut prendre quelques minutes. Patience, patience ! Cependant, si cela prend plus de 5 minutes, c'est que quelque chose ne va pas. N'hésitez pas à solliciter votre coach.

<!--TODO: think about using requirements.txt instead of pip install.-->



### Créer une base de données sur PythonAnywhere

Tout comme l'environnement virtuel, la base de données n'est pas partagée entre le serveur et votre ordinateur. Cela signifie, entre autre, que vous n'aurez plus forcément les mêmes utilisateurs ni les mêmes posts sur votre ordinateur et sur PythonAnywhere.

Pour créer une base de données sur PythonAnywhere, nous allons taper les mêmes commandes que sur notre ordinateur: d'abord `migrate`, puis `createsuperuser`:

    (mvenv) $ python manage.py migrate
    Operations to perform:
    [...]
      Applying sessions.0001_initial... OK


    (mvenv) $ python manage.py createsuperuser


## Faire de votre blog une application web

Maintenant, notre code est sur PythonAnywhere, notre virtualenv est prêt, les fichiers statiques sont recueillis et la base de données est initialisée. Nous sommes prêts à le publier comme une application web !

Retourner sur la page d'accueil de PythonAnywhere en cliquant sur le logo en haut à gauche. Ensuite, cliquez sur l'onglet **Web** et **Add a new web app**.

Après avoir confirmé votre nom de domaine, choisissez **manual configuration** dans la boite de dialogue (NB : ne choisissez *pas* l'option "Django"). Enfin, choisissez **Python 3.4** et cliquez sur "next" pour fermer l'assistant de configuration.

> **Note** : Faites bien attention à sélectionner l'option configuration manuelle ("Manual configuration") et non l'option "Django". N'oubliez pas une chose : vous êtes bien trop cool pour prendre l'option Django qui est fourni par défaut ;-)

### Configurer le virtualenv

Une fois l'assistant fermé, vous serez automatiquement conduite sur la page de configuration dédiée à votre application web. Dès que vous aurez besoin de modifier quelque chose concernant votre appli, c'est là que vous devrez aller.

![][7]

 [7]: images/pythonanywhere_web_tab_virtualenv.png

Dans la section "Virtualenv", cliquez sur le texte en rouge qui indique "Enter the path to a virtualenv" (entrer le chemin d'accès de votre environnement virtuel), et entrez ceci : `/home/<your-username>/my-first-blog/myvenv/`. Cliquez sur la boite bleue avec la case à cocher pour sauvegarder le chemin d’accès.

> **Note** : N'oubliez pas de mettre votre nom d'utilisateur. Ne vous inquiétez pas : si vous faites une erreur, PythonAnywhere vous le signalera.

### Configurer le fichier WSGI

Django utilise le protocole "WSGI" qui est un stantard pour servir des sites web qui utilisent Python. Ce protocole est supporté par PythonAnywhere. Afin que PythonAnywhere détecte notre blog Django, nous allons éditer le fichier de configuration WSGI.

Dans l'onglet web, vous allez trouver une section code : cliquez sur le lien "WSGI configuration file" : votre fichier de configuration devrait s’intituler `/var/www/<your-username>_pythonanywhere_com_wsgi.py`. Une fois que vous avez cliqué dessus, vous serez automatiquement redirigée dans un éditeur de texte.

Supprimer le contenu du fichier et le remplacer par ce qui suit :

```python
import os
import sys

path = '/home/<your-username>/my-first-blog'  # use your own username here
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'

from django.core.wsgi import get_wsgi_application
from django.contrib.staticfiles.handlers import StaticFilesHandler
application = StaticFilesHandler(get_wsgi_application())
```

> **Note** : N'oubliez pas de remplacer `<your-username>` par votre nom d'utilisateur
> **Note** : A la ligne 3, on s'assure que PythonAnywhere saura trouver notre application. Il est très important que ce chemin d'accès soit correct, et plus particulièrement qu'il n'y ait pas d'espaces en plus. Dans le cas contraire "ImportError" s'affichera dans le log d'erreur.

Le but de ce fichier est de permettre à PythonAnywhere de savoir où votre application web se situe et de connaître le nom des fichiers de configuration de Django.

`StaticFilesHandler` sert à gérer notre CSS. Cette étape est réalisée automatiquement en exécutant la commande `runserver`. Nous aborderons un peu plus en détails les fichiers statiques quand nous éditerons le CSS de notre site.

Cliquez sur **Save** puis, retournez dans l'onglet **Web**.

Et voilà, c'est fini ! Vous n'avez plus qu'à cliquer sur le gros bouton vert **Reload** et vous devriez voir votre application en ligne. Le lien vers votre site est situé en haut de l'onglet web de PythonAnywhere.

## Conseils en cas de bug

Si vous constatez une erreur lorsque vous essayez de visiter votre site web, les **logs d'erreurs** devraient vous permettre de comprendre ce qui ne marche pas. Vous trouverez un lien vers ces fichiers dans l'onglet [Web][8] de PythonAnywhere. Regardez s’il y a des messages d’erreurs ; les plus récents seront en bas du fichier. Les bugs les plus fréquents que vous pouvez rencontrer sont les suivants:

 [8]: https://www.pythonanywhere.com/web_app_setup/

*   Oublier une étape lors du passage dans la console. Vous devriez avoir fait toutes les étapes suivantes : créer un environnement virtuel, l'activer, installer Django, lancer la commande "collectstatic" et enfin créer la base de données.

*   Se tromper dans le chemin d'accès à l'environnement virtuel : si c'est le cas, vous trouverez un petit message d'erreur en rouge dans l'onglet "web", section virtualenv.

*   Se tromper lors de la création du fichier de configuration WSGI : pensez à vérifier si le chemin d'accès que vous avez entré est bien celui de "my-first-blog"?

*   Se tromper de version de Python : votre environnement virtuel et votre application web doivent toutes les deux être sous Python 3.4.

*   Il y a quelques [astuces générales de débogage sur le wiki PythonAnywhere][9].

 [9]: https://www.pythonanywhere.com/wiki/DebuggingImportError

Et n'oubliez pas, votre coach est là pour vous aider !

# Votre site est en ligne !

La page qui s'affiche devrait être la même que celle sur votre ordinateur : "Welcome to Django". Vous pouvez essayer d'accéder à l'interface d’administration en ajoutant `/admin/` à la fin de l'URL. Normalement, une page de login devrait s'afficher. Une fois connectée en utilisant votre nom d'utilisateur et votre mot de passe, vous devriez pouvoir ajouter des nouveaux posts sur le serveur.

*Félicitations !* Le déploiement est l’une des parties les plus épineuses du développement web et il faut souvent plusieurs jours avant d'obtenir quelque chose de fonctionnel. Mais vous avez réussi sans trop d'encombres à mettre votre site en ligne : parfait <3
