> Note : ce sous-chapitre est en partie inspiré d'un autre tutoriel réalisé par les Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django est écrit en Python. Pour réaliser quelque chose en Django, il va nous falloir Python. Commençons par installer ce dernier ! Pour ce tutoriel, nous utilisons la version 3.4 de Python. Si vous avez une version antérieure, il va falloir la mettre à jour.

### Windows

Vous pouvez télécharger Python pour Windows sur le site web https://www.python.org/downloads/release/python-343/. Après avoir téléchargé le fichier ***.msi**, lancez-le en double-cliquant sur son icône et suivez les instructions qui s'affichent à l'écran. Attention : il est important de se souvenir du chemin d'accès (le dossier) où vous avez installé Python. Vous en aurez besoin plus tard.

Une chose à laquelle vous devez faire attention : dans le second écran de l'installateur intitulé "Customize", assurez-vous de bien dérouler l'écran jusqu'en bas et de choisir l'option "Ajouter python.exe au chemin", comme sur l'image ci dessous :

![N'oubliez pas d'ajouter Python à votre chemin (path)](../python_installation/images/add_python_to_windows_path.png)

### Linux

Il est très probable que Python soit déjà installé sur votre machine. Afin de vérifier qu'il est bien installé (et surtout quelle version vous avez), ouvrez une console et tapez la commande suivante :

    $ python3 --version
    Python 3.4.3
    

Si Python n'est pas installé ou que vous avez une version différente, vous pouvez l'installer en suivant les instructions suivantes :

#### Debian ou Ubuntu

Tapez cette commande dans votre terminal :

    $ sudo apt-get install python3.4
    

#### Fedora (jusqu'à la version 21)

Tapez cette commande dans votre terminal :

    $ sudo yum install python3.4
    

#### Fedora (22+)

Tapez cette commande dans votre terminal :

    $ sudo dnf install python3.4
    

#### openSUSE

Tapez cette commande dans votre terminal :

    $ sudo zypper install python3


### OS X

Vous devez aller sur le site https://www.python.org/downloads/release/python-343/ et télécharger l'installateur Python :

  * Téléchargez le fichier *Mac OS X 64-bit/32-bit installer*,
  * Double-cliquez sur le fichier *python-3.4.3-macosx10.6.pkg* pour lancer l'installateur.

Vérifiez que l'installation s'est bien déroulée en ouvrant votre *Terminal* et en lançant la commande `python3`:

    $ python3 --version
    Python 3.4.3
    

* * *

Si vous avez des questions ou si quelque chose ne fonctionne pas et que vous ne savez pas quoi faire : demandez de l'aide à votre coach ! Il arrive parfois que les choses ne se déroulent pas comme prévu et il est alors préférable de demander à quelqu'un qui a plus d'expérience.
