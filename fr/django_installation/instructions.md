> Note : ce chapitre est en partie inspiré d'un autre tutoriel réalisé par les Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Ce chapitre est en partie inspiré du [tutoriel django-marcador](http://django-marcador.keimlink.de/) qui est sous licence Creative Commons Attribution-ShareAlike 4.0 International License. Le tutoriel django-marcador a été créé par Markus Zapke-Gründemann et al.

## L'environnement virtuel

Avant d'installer Django, nous allons vous faire installer un outil extrêmement utile qui vous aidera à maintenir votre environnement de développement propre. Nous vous recommandons fortement de ne pas sauter cette étape, même si elle n'est pas indispensable. En commençant avec la meilleure configuration possible vous éviterez beaucoup de problèmes par la suite !

Donc, commençons par créer un **environnement virtuel de programmation** (ou *virtualenv*). Chaque projet aura sa propre configuration en Python/Django grâce à virtualenv. Ce qui veut dire que si vous modifiez un site web, ça n'affectera pas les autres sites sur lesquels vous travaillez. Plutôt cool, non ?

Tout ce dont vous avez besoin, c'est de trouver un dossier où vous voulez créer votre `virtualenv` ; vous pouvez choisir votre répertoire "home" par exemple. Sous Windows, le home ressemble à `C:\Utilisateurs\Nom` (où `Nom` est votre login).

> **Note:** Sur Windows, assurez-vous que le chemin vers ce répertoire ne contienne pas d'accents ou autres caractères spéciaux; si c'est la cas, utilisez un répertoire différent, par exemple `C:\djangogirls`.

Dans ce tutoriel, nous allons utiliser un nouveau dossier `djangogirls` que vous allez créer dans votre dossier home :

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Nous allons créer un virtualenv appelé `myvenv`. Pour cela, nous taperons une commande qui ressemblera à :

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Pour créer un nouveau `virtualenv`, vous devez ouvrir un terminal et exécuter `python -m venv myvenv`. Voici ce à quoi ça devrait ressembler:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Où `myvenv` est le nom de votre `virtualenv`. Vous pouvez choisir un autre nom mais attention : il doit être en minuscules, sans espaces et sans accents ou caractères spéciaux. C'est aussi une bonne idée de choisir un nom plutôt court, car vous aller souvent l'utiliser!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Pour créer un `virtualenv` sous Linux ou OS X, tapez simplement la commande `python3 -m venv myvenv`. Ça ressemblera à ça :

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` est le nom de votre `virtualenv`. Vous pouvez choisir un autre nom, mais veillez à n'utiliser que des minuscules et à n'insérer ni espaces, ni caractères spéciaux. C'est aussi une bonne idée de choisir un nom plutôt court, car vous aller souvent l'utiliser!

> **Note:** sur certaines versions de Debian/Ubuntu vous pouvez avoir l'erreur suivante:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> Dans ce cas, suivez les instructions ci-dessus et installez le paquet `python9-venv`: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **Note:** Sur certaines version de Debian/Ubuntu, initialiser l’environnement virtuel de cette façon donne l'erreur suivante:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Pour résoudre ce problème, utilisez plutôt la commande `virtualenv`.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **Note:** Si vous avez une erreur telle que :
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> alors exécutez plutôt :
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## Travailler avec virtualenv

Les commandes listées ci-dessus permettent de créer un dossier appelé `myvenv` (ou le nom que vous avez choisi) qui contient notre environnement virtuel. Pour faire simple, c'est un dossier composé lui-même d'autres dossiers et de fichiers.

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Démarrez votre environnement virtuel en exécutant :

{% filename %}command-line{% endfilename %}

    C:\Utilisateurs\Nom\djangogirls> myvenv\Scripts\activate
    

> **Note:** sur Windows 10 vous pouvez avoir une erreur dans le PowerShell de Windows disant `execution of scripts is disabled on this system`. Dans ce cas ouvrez une autre console Windows PowerShell avec l'option "ouvrir en tant qu'administrateur". Puis essayer d'exécuter la commande suivante avant de démarrer votre environnement virtuel :
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     
> 
> **NOTE :** Pour les éditeurs du très populaire VS Code, qui comporte un terminal intégré basé sur Windows Powershell, si vous souhaitez conserver le terminal intégré, vous pouvez utiliser la commande suivante pour activer votre environnement virtuel :
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> L'avantage, c'est que vous n'aurez pas à constamment passer de l'éditeur aux lignes de commandes

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Démarrez votre environnement virtuel en exécutant :

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

N'oubliez pas de remplacer `myvenv` par le nom que vous avez choisi pour votre `virtualenv` (le cas échéant) !

> **NOTE :** il arrive parfois que `source` ne soit pas disponible. Dans ce cas, vous pouvez essayer ceci :
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

Vous saurez que votre `virtualenv` est lancé quand le prompt de votre console est précédé de `(myvenv)`.

Quand vous travaillez dans un environnement virtuel, la commande `python` fera automatiquement référence à la bonne version de Python. Vous pouvez donc utiliser `python` plutôt que `python3`.

Ok, nous avons installé toutes les dépendances dont nous avions besoin. Nous allons enfin pouvoir installer Django !

## Installation de Django

Maintenant que vous avez activé votre `virtualenv`, vous pouvez installer Django.

Avant de faire cela, nous devons nous assurer que nous avons la dernière version de `pip`, le programme que nous allons utiliser pour installer Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Installer des paquets avec un fichier "requirements"

Un fichier "requirement" maintient une liste des dépendances qui doivent être installées avec `pip install`:

Tout d'abord, créez un fichier `requirements.txt` dans votre dossier `djangogirls`, en utilisant l'éditeur de texte que vous avez téléchargé précédemment. Pour ce faire, ouvrez un nouveau fichier dans l'éditeur et sauvegarde-le à l'intérieur du dossier `djangogirls/` en lui donnant le nom `requirements.txt`. Votre dossier ressemble maintenant à ceci :

    djangogirls
    ├── myvenv
    │   └── ...
    └───requirements.txt
    

Dans ce fichier `djangogirls/requirements.txt` vous devez ajouter ceci :

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Maintenant, exécutez `pip install -r requirements.txt` pour installer Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> Si jamais vous obtenez des erreurs lorsque vous utilisez pip sous Windows, vérifiez si votre chemin d'accès contient des espaces, des accents ou des caractères spéciaux (ex : `C:\Utilisateurs\Nom d'Utilisateur\djangogirls`). Si c'est le cas, changez de dossier et essayez d'en créer un nouveau en prenant en compte le fait qu'il ne doit donc avoir ni accents, ni espaces, ni caractères spéciaux (ex : `C:\djangogirls`). Créez un nouvel environnement virtuel dans le nouveau répertoire, puis supprimez l'ancien et ré-essayez la commande précédente. (Déplacer ou couper/coller le répertoire de l'environnement virtuel ne marchera pas car virtualenv utilise des chemins absolus)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Votre terminal peut se figer quand vous essayez d'installer Django. Si cela arrive, utilisez cette commande au lieu de la précédente :
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> Si vous obtenez une erreur lorsque vous utilisez pip sous Ubuntu 12.04, tapez la commande `python -m pip install -U --force-reinstall pip` pour réparer l'installation de pip dans votre virtualenv.

<!--endsec-->

Et voilà ! Vous êtes (enfin) prête pour créer votre première application Django !