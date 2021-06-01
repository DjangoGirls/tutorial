> Pour les lecteur·rices autodidactes (et qui n'ont pas de soucis avec l'anglais) : Ce chapitre est traité dans la vidéo [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Cette section repose sur un tutoriel de Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django est écrit en Python. Pour réaliser quelque chose en Django, il va nous falloir Python. Commençons par l'installer ! Pour suivre ce tutoriel, l'idéale est d'installer la dernière version de Python 3. Si vous avez une version antérieure, il va falloir la mettre à jour. Si vous avez déjà la version {{ book.py_min_version }} ou supérieure, ça devrait aller.

Veuillez installer Python comme suit, même si vous avez déjà installé Anaconda sur votre ordinateur.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Vérifiez d'abord si votre ordinateur exécute une version 32 bits ou une version 64 bits de Windows, en cherchant "Type du système" dans la page d'information système. Pour accéder à cette page, essayez l'une de ces méthodes :

* Appuyez sur la touche Windows et la touche Pause/Attn en même temps
* Ouvrez votre panneau de configuration depuis le menu Windows, puis naviguez vers Système et sécurité, puis Système
* Appuyez sur la touche Windows, puis accédez à Paramètres > Système > A propos
* Recherchez dans le menu Démarrer Windows le raccourci "Informations système". Pour ce faire, cliquez sur le bouton Démarrer ou appuyez sur la touche Windows, puis commencez à taper `Informations système`. Des entrées correspondantes apparaîtrons dès que vous tapez. Vous pouvez sélectionner l'entrée une fois qu'elle apparaît.

Vous pouvez télécharger Python pour Windows depuis le site web https://www.python.org/downloads/windows/. Cliquez sur le lien "Latest Python 3 Release - Python x.x.x". Si votre ordinateur exécute une version **64-bit** de Windows, téléchargez l'installateur exécutable **Windows x86-64 executable installer**. Sinon, téléchargez **Windows x86 executable installer**. Après avoir téléchargé l'installateur, vous devriez l'exécuter (double-cliquez dessus) et suivre les instructions.

Une chose à surveiller : lors de l’installation, vous remarquerez une fenêtre marquée « Setup ». Assurez-vous de cocher la case "Add Python {{ book.py_version }} to PATH" ou "Add Python to your environment variables" et cliquez sur "Install Now", comme indiqué ici (cela peut s'afficher un peu différemment si vous installez une autre version):

![N'oubliez pas d'ajouter Python à votre chemin (path)](../python_installation/images/python-installation-options.png)

Une fois l’installation terminée, vous verrez une boîte de dialogue contenant un lien que vous pouvez suivre pour en savoir plus sur Python ou sur la version que vous avez installée. Fermez ou annulez cette boîte de dialogue -- vous en apprendrez plus dans ce tutoriel !

Note : Si vous utilisez une ancienne version de Windows (7, Vista, ou n'importe quelle version antérieure) et l'installateur Python {{ book.py_version }} échoue avec une erreur, alors installez toutes les mises à jour Windows et essayez d'installer Python à nouveau. Si vous avez toujours l'erreur, essayez d'installer la version {{ book.py_min_release }} de Python depuis [Python.org](https://www.python.org/downloads/windows/).

> Django {{ book.django_version }} a besoin de Python {{ book.py_min_version }} ou plus récent, qui n'est pas pris pas en charge par Windows XP ou les versions précédentes.

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Avant d'installer Python sur OS X, vous devriez vous assurer que vos paramètres Mac permettent d'installer des programmes qui ne proviennent pas de l'App Store. Allez dans Préférences Système (c'est dans le dossier Applications), cliquez sur "Sécurité & Confidentialité", puis sur l'onglet "Général". Si votre "Autoriser les applications téléchargées de:" est défini sur "Mac App Store", changez-le à "Mac App Store et développeurs identifiés".

Vous devez aller sur le site https://www.python.org/downloads/mac-osx/ et télécharger l'installateur python:

* Téléchargez le fichier *Mac OS X 64-bit/32-bit installer*,
* Double-cliquez sur le fichier *python-{{ book.py_release }}-macosx10.9.pkg* pour lancer l'installateur.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

Il est très probable que Python soit déjà installé sur votre machine. Afin de vérifier qu'il est bien installé (et surtout quelle version vous avez), ouvrez une console et tapez la commande suivante :

{% filename %}ligne de commande{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

Si vous avez une version différente de Python installée, au moins {{ book.py_min_version }} (par exemple {{ book.py_min_release }}), vous n'avez pas besoin de mettre à jour Python. Si Python n'est pas installé, ou si vous voulez une version différente, vérifiez d'abord la distribution Linux que vous utilisez avec la commande suivante :

{% filename %}command-line{% endfilename %}

    $ grep '^NAME=' /etc/os-release
    

Ensuite, selon le résultat, suivez l'un des guides d'installation sous cette section.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Tapez cette commande dans votre terminal :

{% filename %}ligne de commande{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Tapez cette commande dans votre terminal :

{% filename %}ligne de commande{% endfilename %}

    $ sudo dnf install python3
    

Si vous utilisez une ancienne version de Fedora, vous pourriez avoir une erreur disant que la commande `dnf` n'est pas trouvée. Dans ce cas, vous devez utiliser la commande `yum` à la place.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Tapez cette commande dans votre terminal :

{% filename %}ligne de commande{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Vérifiez que l'installation s'est bien déroulée en ouvrant votre terminal et en lançant la commande `python3`:

{% filename %}ligne de commande{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

La version affichée peut être différente de {{ book.py_release }} -- elle devrait correspondre à la version que vous avez installée.

**NOTE:** Si vous êtes sur Windows et que vous obtenez un message d'erreur disant que `python3` n'a pas été trouvé, essayez d'utiliser `python` (sans `3`) et vérifiez si elle lance une version de Python {{ book.py_min_version }} ou ultérieure. Si cela ne fonctionne pas non plus, vous pouvez ouvrir une nouvelle ligne de commande et réessayer ; cela se produit si vous utilisez une fenêtre de ligne de commande datant d'avant l'installation de Python.

* * *

Si vous avez des questions ou si quelque chose ne fonctionne pas et que vous ne savez pas quoi faire : demandez de l'aide à votre coach ! Il arrive parfois que les choses ne se déroulent pas comme prévu et il est alors préférable de demander à quelqu'un qui a plus d'expérience.