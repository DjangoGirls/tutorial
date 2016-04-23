> Note : ce chapitre est en partie inspiré d'un autre tutoriel réalisé par les Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Ce chapitre est en partie inspiré du [tutoriel django-marcador](http://django-marcador.keimlink.de/) qui est sous licence Creative Commons Attribution-ShareAlike 4.0 International License. Le tutoriel django-marcador a été créé par Markus Zapke-Gründemann et al.

## L'environnement virtuel

Avant d'installer Django, nous allons vous faire installer un outil extrêmement utile qui vous aidera à maintenir votre environnement de développement propre. Nous vous recommandons fortement de ne pas sauter cette étape, même si elle n'est pas indispensable. En commençant avec la meilleure configuration possible vous éviterez beaucoup de problèmes par la suite !

Donc, commençons par créer un **environnement virtuel de programmation** (ou *virtualenv*). Chaque projet aura sa propre configuration en Python/Django grâce à virtualenv. Ce qui veut dire que si vous modifiez un site web, ça n'affectera pas les autres sites sur lesquels vous travaillez. Plutôt cool, non ?

Tout ce dont vous avez besoin, c'est de trouver un dossier où vous voulez créer votre `virtualenv` ; vous pouvez choisir votre home par exemple. Sous Windows, le home ressemble à `C:\Utilisateurs\Nom` (où `Nom` est votre login).

Dans ce tutoriel, nous allons utiliser un nouveau dossier `djangogirls` que vous allez créer dans votre dossier home :

    mkdir djangogirls
    cd djangogirls
    

Nous allons créer un virtualenv appelé `myvenv`. Pour cela, nous taperons une commande qui ressemblera à :

    python3 -m venv myvenv
    

### Windows

Afin de créer un nouveau `virtualenv`, vous avez besoin d'ouvrir votre console (nous en avons déjà parlé dans un chapitre précédent. Est-ce que vous vous en souvenez ?) et tapez `C:\Python34\python -m venv myvenv`. Ça ressemblera à ça :

    C:\Utilisateurs\Nom\djangogirls> C:\Python34\python -m venv myvenv
    

`C:\Python34\python` doit être le nom du dossier où vous avez installé Python et `myvenv` doit être le nom de votre `virtualenv`. Vous pouvez choisir un autre nom mais attention : il doit être en minuscules, sans espaces et sans accents ou caractères spéciaux. C'est aussi une bonne idée de choisir un nom plutôt court, car vous aller souvent l'utiliser !

### Linux et OS X

Pour créer un `virtualenv` sous Linux ou OS X, tapez simplement la commande `python3 -m venv myvenv`. Ça ressemblera à ça :

    ~/djangogirls$ python3 -m venv myvenv
    

`myvenv` est le nom de votre `virtualenv`. Vous pouvez choisir un autre nom, mais veillez à n'utiliser que des minuscules et à n'insérer ni espaces, ni caractères spéciaux. C'est aussi une bonne idée de choisir un nom plutôt court, car vous aller souvent l'utiliser!

> **NOTE:** initialiser un environnement virtuel sous Ubuntu 14.04 de cette manière donne l'erreur suivante :
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Pour résoudre ce problème, utilisez plutôt la commande `virtualenv`.
> 
>     ~/djangogirls$ sudo apt-get install python-virtualenv
>     ~/djangogirls$ virtualenv --python=python3.4 myvenv
>     

## Travailler avec virtualenv

Les commandes listées ci-dessus permettent de créer un dossier appelé `myvenv` (ou le nom que vous avez choisi) qui contient notre environnement virtuel. Pour faire simple, c'est un dossier composé lui-même d'autres dossiers et de fichiers.

#### Windows

Démarrez votre environnement virtuel en exécutant :

    C:\Utilisateurs\Nom\djangogirls> myvenv\Scripts\activate
    

#### Linux et OS X

Démarrez votre environnement virtuel en exécutant :

    ~/djangogirls$ source myvenv/bin/activate
    

N'oubliez pas de remplacer `myvenv` par le nom que vous avez choisi pour votre `virtualenv` (le cas échéant) !

> **NOTE :** il arrive parfois que `source` ne soit pas disponible. Dans ce cas, vous pouvez essayer ceci :
> 
>     ~/djangogirls$ . myvenv/bin/activate
>     

Vous saurez que votre `virtualenv` est lancé quand le prompt de votre console ressemblera à ceci :

    (myvenv) C:\Utilisateurs\Nom\djangogirls>
    

ou :

    (myvenv) ~/djangogirls$
    

Vous remarquez que le préfixe `(myvenv)` est apparu !

Quand vous travaillez dans un environnement virtuel, la commande `python` fera automatiquement référence à la bonne version de Python. Vous pouvez donc utiliser `python` plutôt que `python3`.

Ok, nous avons installé toutes les dépendances dont nous avions besoin. Nous allons enfin pouvoir installer Django !

## Installation de Django

Maintenant que vous avez lancé votre `virtualenv`, vous pouvez installer Django à l'aide de `pip`. Dans votre console, tapez `pip install django~=1.9.0`. Notez bien que nous utilisons un tilde suivi du signe égal : `~=`).

    (myvenv) ~$ pip install django~=1.9.0
    Downloading/unpacking django==1.9
    Installing collected packages: django
    Successfully installed django
    Cleaning up...
    

Sous Windows :

> Si jamais vous obtenez des erreurs lorsque vous utilisez pip sous Windows, vérifiez si votre chemin d'accès contient des espaces, des accents ou des caractères spéciaux (ex : `C:\Utilisateurs\Nom d'Utilisateur\djangogirls`). Si c'est le cas, changez de dossier et essayez d'en créer un nouveau en prenant en compte le fait qu'il ne doit donc avoir ni accents, ni espaces, ni caractères spéciaux (ex : `C:\djangogirls`). Après l'avoir déplacé, essayez de retaper la commande précédente.

Sous Linux :

> Si vous obtenez une erreur lorsque vous utilisez pip sous Ubuntu 12.04, tapez la commande `python -m pip install -U --force-reinstall pip` pour réparer l'installation de pip dans votre virtualenv.

Et voilà ! Vous êtes (enfin) prête pour créer votre première application Django !
