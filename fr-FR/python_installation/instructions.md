> Pour les lecteur·rices autodidactes (et qui n'ont pas de soucis avec l'anglais) : Ce chapitre est traité dans la vidéo [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Cette section repose sur un tutoriel de Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django est écrit en Python. Pour réaliser quelque chose en Django, il va nous falloir Python. Commençons par l'installer ! Pour suivre ce tutoriel, l'idéale est d'installer la dernière version de Python 3. Si vous avez une version antérieure, il va falloir la mettre à jour. If you already have version {{ book.py_min_version }} or higher you should be fine.

Veuillez installer Python comme suit, même si vous avez déjà installé Anaconda sur votre ordinateur.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Vérifiez d'abord si votre ordinateur exécute une version 32 bits ou une version 64 bits de Windows, en cherchant "Type du système" dans la page d'information système. Pour accéder à cette page, essayez l'une de ces méthodes :

* Appuyez sur la touche Windows et la touche Pause/Attn en même temps
* Ouvrez votre panneau de configuration depuis le menu Windows, puis naviguez vers Système et sécurité, puis Système
* Appuyez sur la touche Windows, puis accédez à Paramètres > Système > A propos
* Search the Windows Start menu for "System Information". To do that, click the Start button or press the Windows key, then begin to type `System Information`. It will start making suggestions as soon as you type. You can select the entry once it shows up.

Vous pouvez télécharger Python pour Windows depuis le site web https://www.python.org/downloads/windows/. Cliquez sur le lien "Latest Python 3 Release - Python x.x.x". Si votre ordinateur exécute une version **64-bit** de Windows, téléchargez l'installateur exécutable **Windows x86-64 executable installer**. Sinon, téléchargez **Windows x86 executable installer**. Après avoir téléchargé l'installateur, vous devriez l'exécuter (double-cliquez dessus) et suivre les instructions.

Une chose à surveiller : lors de l’installation, vous remarquerez une fenêtre marquée « Setup ». Make sure you tick the "Add Python {{ book.py_version }} to PATH" or 'Add Python to your environment variables" checkbox and click on "Install Now", as shown here (it may look a bit different if you are installing a different version):

![N'oubliez pas d'ajouter Python à votre chemin (path)](../python_installation/images/python-installation-options.png)

Une fois l’installation terminée, vous verrez une boîte de dialogue contenant un lien que vous pouvez suivre pour en savoir plus sur Python ou sur la version que vous avez installée. Fermez ou annulez cette boîte de dialogue -- vous en apprendrez plus dans ce tutoriel !

Note: If you are using an older version of Windows (7, Vista, or any older version) and the Python {{ book.py_version }} installer fails with an error, then install all Windows Updates and try to install Python again. If you still have the error, try installing Python version {{ book.py_min_release }} from [Python.org](https://www.python.org/downloads/windows/).

> Django {{ book.django_version }} needs Python {{ book.py_min_version }} or greater, which does not support Windows XP or earlier versions.

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

You need to go to the website https://www.python.org/downloads/mac-osx/ and download the latest Python installer:

* Téléchargez le fichier *Mac OS X 64-bit/32-bit installer*,
* Double click *python-{{ book.py_release }}-macosx10.9.pkg* to run the installer.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

If you have a different version of Python installed, at least {{ book.py_min_version }} (e.g. {{ book.py_min_release }}), then you don't have to upgrade. If you don't have Python installed, or if you want a different version, first check what Linux distribution you are using with the following command:

{% filename %}command-line{% endfilename %}

    $ grep '^NAME=' /etc/os-release
    

Afterwards, depending on the result, follow one of the following installation guides below this section.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Type this command into your console:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Use this command in your console:

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
    Python {{ book.py_release }}
    

The version shown may be different from {{ book.py_release }} -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is {{ book.py_min_version }} or higher. If that doesn't work either, you may open a new command prompt and try again; this happens if you use a command prompt left open from before the Python installation.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.