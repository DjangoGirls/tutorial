> Pour les lecteur·rices autodidactes (et qui n'ont pas de soucis avec l'anglais) : Ce chapitre est traité dans la vidéo [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Cette section repose sur un tutoriel de Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django est écrit en Python. Pour réaliser quelque chose en Django, il va nous falloir Python. Commençons par l'installer ! Pour suivre ce tutoriel, l'idéale est d'installer la dernière version de Python 3. Si vous avez une version antérieure, il va falloir la mettre à jour. Si vous avez une version 3.4 ou supérieure, ça devrait aller.

Please install normal Python as follows, even when you have Anaconda installed on your computer.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Vérifiez d'abord si votre ordinateur exécute une version 32 bits ou une version 64 bits de Windows, en cherchant "Type du système" dans la page d'information système. Pour accéder à cette page, essayez l'une de ces méthodes :

* Appuyez sur la touche Windows et la touche Pause/Attn en même temps
* Ouvrez votre panneau de configuration depuis le menu Windows, puis naviguez vers Système et sécurité, puis Système
* Appuyez sur la touche Windows, puis accédez à Paramètres > Système > A propos

You can download Python for Windows from the website https://www.python.org/downloads/windows/. Click on the "Latest Python 3 Release - Python x.x.x" link. If your computer is running a **64-bit** version of Windows, download the **Windows x86-64 executable installer**. Otherwise, download the **Windows x86 executable installer**. After downloading the installer, you should run it (double-click on it) and follow the instructions there.

One thing to watch out for: During the installation, you will notice a window marked "Setup". Make sure you tick the "Add Python 3.6 to PATH" or 'Add Python to your environment variables" checkbox and click on "Install Now", as shown here (it may look a bit different if you are installing a different version):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

When the installation completes, you may see a dialog box with a link you can follow to learn more about Python or about the version you installed. Close or cancel that dialog -- you'll be learning more in this tutorial!

Note: if you are using an older version of Windows (7, Vista, or any older version) and the Python 3.6.x installer fails with an error, you can try either:

1. Installer toutes les mises à jour Windows et essayer d'installer à nouveau Python ;
2. Installer une [version antérieure de Python](https://www.python.org/downloads/windows/), par exemple, [3.4.6](https://www.python.org/downloads/release/python-346/).

If you install an older version of Python, the installation screen may look a bit different than shown above. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Ajouter Python au chemin, anciennes versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Avant d'installer Python sur OS X, vous devriez vous assurer que vos paramètres Mac permettent d'installer des programmes qui ne proviennent pas de l'App Store. Allez dans Préférences Système (c'est dans le dossier Applications), cliquez sur "Sécurité & Confidentialité", puis sur l'onglet "Général". Si votre "Autoriser les applications téléchargées de:" est défini sur "Mac App Store", changez-le à "Mac App Store et développeurs identifiés".

Vous devez aller sur le site https://www.python.org/downloads/release/python-361/ et télécharger l'installateur Python:

* Téléchargez le fichier *Mac OS X 64-bit/32-bit installer*,
* Double-cliquez sur le fichier *python-3.6.1-macosx10.6.pkg* pour lancer l'installateur.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

If you have a different version of Python installed, at least 3.4.0 (e.g. 3.6.0), then you don't have to upgrade. If you don't have Python installed, or if you want a newer version, you can install it as follows:

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

Tapez cette commande dans votre terminal :

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verify the installation was successful by opening a command prompt and running the `python3` command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

La version affichée peut être différente de 3.6.1 -- elle devrait correspondre à la version que vous avez installée.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is 3.4.0 or higher.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.