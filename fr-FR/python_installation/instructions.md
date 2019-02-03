> Pour les lecteur·rices autodidactes (et qui n'ont pas de soucis avec l'anglais) : Ce chapitre est traité dans la vidéo [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Cette section repose sur un tutoriel de Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django est écrit en Python. Pour réaliser quelque chose en Django, il va nous falloir Python. Commençons par l'installer ! Pour suivre ce tutoriel, l'idéale est d'installer la dernière version de Python 3. Si vous avez une version antérieure, il va falloir la mettre à jour. Si vous avez une version 3.4 ou supérieure, ça devrait aller.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Vérifiez d'abord si votre ordinateur exécute une version 32 bits ou une version 64 bits de Windows, en cherchant "Type du système" dans la page d'information système. Pour accéder à cette page, essayez l'une de ces méthodes :

* Appuyez sur la touche Windows et la touche Pause/Attn en même temps
* Ouvrez votre panneau de configuration depuis le menu Windows, puis naviguez vers Système et sécurité, puis Système
* Appuyez sur la touche Windows, puis accédez à Paramètres > Système > A propos

Vous pouvez télécharger Python pour Windows depuis le site web https://www.python.org/downloads/windows/. Cliquez sur le lien "Latest Python 3 Release - Python x.x.x". Si votre ordinateur exécute une version **64-bit** de Windows, téléchargez l'installateur exécutable **Windows x86-64 executable installer**. Sinon, téléchargez **Windows x86 executable installer**. Après avoir téléchargé l'installateur, vous devriez l'exécuter (double-cliquez dessus) et suivre les instructions.

Une chose à surveiller : lors de l’installation, vous remarquerez une fenêtre marquée « Setup ». Assurez-vous de cocher la case "Add Python 3.6 to PATH" ou "Add Python to your environment variables" et cliquez sur "Install Now", comme indiqué ici (il peut sembler un peu différent si vous installez une autre version):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

Une fois l’installation terminée, vous verrez une boîte de dialogue contenant un lien que vous pouvez suivre pour en savoir plus sur Python ou sur la version que vous avez installée. Fermez ou annulez cette boîte de dialogue -- vous en apprendrez plus dans ce tutoriel !

Note: si vous utilisez une ancienne version de Windows (7, Vista ou une version antérieure) et que l'installateur Python 3.6.x échoue avec une erreur, vous pouvez essayer une des solutions suivantes :

1. Installer toutes les mises à jour Windows et essayer d'installer à nouveau Python ;
2. Installer une [version antérieure de Python](https://www.python.org/downloads/windows/), par exemple, [3.4.6](https://www.python.org/downloads/release/python-346/).

Si vous installez une ancienne version de Python, l'écran d'installation peut sembler un peu différent de ce qui est affiché ci-dessus. Assurez-vous de défiler vers le bas jusqu'à "Add python.exe to Path", puis cliquez sur le bouton à gauche et choisissez "Will be installed on local hard drive" :

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Avant d'installer Python sur OS X, vous devriez vous assurer que vos paramètres Mac permettent d'installer des programmes qui ne proviennent pas de l'App Store. Allez dans Préférences Système (c'est dans le dossier Applications), cliquez sur "Sécurité & Confidentialité", puis sur l'onglet "Général". Si votre "Autoriser les applications téléchargées de:" est défini sur "Mac App Store", changez-le à "Mac App Store et développeurs identifiés".

Vous devez aller sur le site https://www.python.org/downloads/release/python-361/ et télécharger l'installateur python:

* Téléchargez le fichier *Mac OS X 64-bit/32-bit installer*,
* Double-cliquez sur le fichier *python-3.6.1-macosx10.6.pkg* pour lancer l'installateur.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

Il est très probable que Python soit déjà installé sur votre machine. Afin de vérifier qu'il est bien installé (et surtout quelle version vous avez), ouvrez une console et tapez la commande suivante :

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Si vous avez une version différente de Python installée, au moins 3.4.0 (par exemple 3.6.0), alors il n'y a pas besoin de mettre à jour. Si Python n'est pas installé ou si vous souhaitez une version plus récente, vous pouvez l'installer en suivant les instructions suivantes :

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Tapez cette commande dans votre terminal :

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Tapez cette commande dans votre terminal :

{% filename %}command-line{% endfilename %}

    sudo dnf install python3
    

If you're on older Fedora versions you might get an error that the command `dnf` is not found. In that case, you need to use `yum` instead.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verify the installation was successful by opening a command prompt and running the `python3` command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

The version shown may be different from 3.6.1 -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is 3.4.0 or higher.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.