# Installation de Django

> Note: ce chapitre est en partie inspiré d'un autre tutoriel réalisé par les Geek Girls Carrots (http://django.carrots.pl/).
> 
> Ce chapitre est en partie inspiré du [tutoriel django-marcador][1] qui est sous licence Creative Commons Attribution-ShareAlike 4.0 International License. Le tutoriel django-marcador a été créé par Markus Zapke-Gründemann et al.

 [1]: http://django-marcador.keimlink.de/

## L'environnement virtuel

Avant d'installer Django, nous allons vous faire installer un outil extrêmement utile qui vous aidera à maintenir votre environnement de développement propre. Vous pouvez sauter cette partie, mais nous vous le déconseillons: bien préparer votre ordinateur vous épargnera de nombreux problèmes par la suite!

Donc, commençons par créer un **environnement de développement** (ou *virtualenv*). Cela va vous permettre, pour chaque projet, d'isoler votre installation Python/Django afin que les modifications que vous souhaitiez effectuer sur un site n'affectent pas les autres que vous seriez en train de développer à côté. Cool, non?

Tout ce dont vous avez besoin, c'est de trouver un dossier où vous voulez créer votre `virtualenv`; vous pouvez choisir votre home par exemple. Sous Windows, le home ressemble à `C:\Users\Name` (où `Name` est votre login).

Dans ce tutoriel, nous allons utiliser le nouveau dossier `djangogirls` que vous allez créer dans votre dossier home:

    mkdir djangogirls
    cd djangogirls
    

Nous allons créer un virtualenv appelé `myvenv`. Pour cela, nous taperons une commande qui ressemblera à:

    python -m venv myvenv
    

### Windows

Afin de créer un nouveau `virtualenv`, vous avez besoin d'ouvrir votre console (on vous en a parlé précédemment, est-ce que vous vous en souvenez?) et tapez `C:\Python34\python -m venv myvenv`. Ça ressemblera à ça:

    C:\Users\Name\djangogirls> C:\Python34\python -m venv myvenv
    

`C:\Python34\python` doit être le nom du dossier où vous avez installé Python et `myvenv` doit être le nom de votre `virtualenv`. Vous pouvez choisir le nom que vous voulez, mais veillez à n'utiliser que des minuscules et à n'insérer ni espaces, ni caractères spéciaux. C'est aussi une bonne idée de choisir un nom plutôt court, car vous aller souvent l'utiliser!

### Linux et OS X

Pour créer un `virtualenv` sous Linux ou OS X, tapez simplement la commande `python3 -m venv myvenv`. Ça ressemblera à ça:

    ~/djangogirls$ python3 -m venv myvenv
    

`myvenv` est le nom de votre `virtualenv`. Vous pouvez choisir le nom que vous voulez, mais veillez à n'utiliser que des minuscules et à n'insérer ni espaces, ni caractères spéciaux. C'est aussi une bonne idée de choisir un nom plutôt court, car vous aller souvent l'utiliser!

> **NOTE:** initialiser un environnement virtuel sous Ubuntu 14.04 de cette manière donne l'erreur suivante:
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

Les commandes listées ci-dessus permettent de créer un dossier appelé `myvenv` (ou le nom que vous avez choisi) qui contient notre environnement virtuel. Pour faire simple, c'est un dossier composé lui-même d'autres dossiers et de fichiers. Tout ce que nous avons à faire maintenant, c'est de le lancer en tapant:

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

sous Windows, ou:

    ~/djangogirls$ source myvenv/bin/activate
    

sous Linux et OS X.

N'oubliez pas que si vous avez choisi un autre nom pour votre `virtualenv` à la place de `myvenv`, vous devez utiliser celui-là!

> **NOTE:** il arrive parfois que `source` ne soit pas disponible. Dans ce cas, vous pouvez essayer ceci:
> 
>     ~/djangogirls$ . myvenv/bin/activate
>     

Vous saurez que votre `virtualenv` est lancé quand le prompt de votre console ressemblera à ceci:

    (myvenv) C:\Users\Name\djangogirls>
    

ou:

    (myvenv) ~/djangogirls$
    

Remarquez le préfixe `(myvenv)` qui vient d'apparaître!

Quand vous travaillez dans un environnement virtuel, la commande `python` fera automatiquement référence à la bonne version de Python que vous utilisez. Vous pouvez ainsi utiliser `python` à la place de la commande `python3`.

Ok, nous avons installé toutes les dépendances dont nous avions besoin. Nous allons enfin pouvoir installer Django!

## Installation de Django

Maintenant que notre `virtualenv` est lancé, nous pouvons installer Django en utilisant `pip`. Dans la console, tapez `pip install django==1.7.1` (notez que nous utilisons un double signe égal): `==`).

    (myvenv) ~$ pip install django==1.7.1
    Downloading/unpacking django==1.7.1
    Installing collected packages: django
    Successfully installed django
    Cleaning up...
    

Sous Windows:

> Si vous obtenez une erreur en utilisant pip sous Windows, vérifiez si le chemin d'accès de votre projet ne contient pas des espaces (par exemple: `C:\Users\User Name\djangogirls`). Si c'est le cas, il vaudrait peut-être mieux changer l'emplacement de votre projet afin de ne plus avoir de chemin d'accès avec des espaces (par exemple: `C:\djangogirls`). Après l'avoir déplacé, essayez de retaper la commande précédente.

Sous Linux:

> Si vous obtenez une erreur lorsque vous utilisez pip sous Ubuntu 12.04, tapez la commande `python -m pip install -U --force-reinstall pip` pour réparer l'installation de pip dans votre virtualenv.

Et voilà! Vous êtes (enfin) prêt⋅e à créer votre première application en Django! Pour cela, vous allez avoir besoin d'un programme sympathique pour y écrire votre code...
