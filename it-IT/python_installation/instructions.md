> Per le lettrici a casa: questo capitolo è trattato nel video [Installazione di Python & Editor di codice](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Questa sezione è basata sul tutorial delle Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django è scritto in Python. Python ci serve per fare qualunque cosa in Django. Iniziamo con l'installazione! Dovresti installare la versione più recente di Python 3, quindi se hai una versione precendente dovrai aggiornarla. If you already have version {{ book.py_min_version }} or higher you should be fine.

Installa Python normale come segue, anche quando hai Anaconda installato sul tuo computer.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Prima verifica se il computer sta eseguendo una versione a 32 bit o una versione a 64 bit di Windows, sulla linea "Tipo di sistema" della pagina Info di sistema. Per raggiungere questa pagina, prova uno di questi metodi:

* Premi il tasto Windows e Pausa/Break contemporaneamente
* Apri il tuo Pannello di Controllo dal menu Windows, quindi naviga nel sistema & Sicurezza, quindi sistema
* Premi il pulsante Windows, quindi vai su Impostazioni > Sistema > Informazioni
* Cerca "System Information" nel menu Start di Windows. Per fare ciò, clicca sul pulsante Start o premi il tasto Windows, poi inizia a digitare `System Information`. Inizierà a dare suggerimenti non appena digiterai. Puoi selezionare la voce una volta che compare.

Puoi scaricare Python per Windows dal sito web https://www.python.org/downloads/windows/. Clicca sul link "Ultimo Python 3 - Python x.x.x". Se il tuo computer sta eseguendo una versione **64-bit** di Windows, scarica il file **Windows x86-64 di installer eseguibile**. Altrimenti, scarica il file **Windows x86 eseguibile installer**. Dopo aver scaricato il file *.msi, lo dovresti eseguire (cliccaci sopra due volte) e segui le istruzioni.

Una cosa per cui guardare: durante l'installazione, si noti una finestra contrassegnata "Setup". Make sure you tick the "Add Python {{ book.py_version }} to PATH" or 'Add Python to your environment variables" checkbox and click on "Install Now", as shown here (it may look a bit different if you are installing a different version):

![Non dimenticare di aggiungere Python al Path](../python_installation/images/python-installation-options.png)

Quando l'installazione è completata, potresti vedere una finestra di dialogo con un link che puoi seguire per saperne di più su Python o sulla versione installata. Chiudi o annulla questa finestra -- imparerai molto di più in questo tutorial!

Note: If you are using an older version of Windows (7, Vista, or any older version) and the Python {{ book.py_version }} installer fails with an error, then install all Windows Updates and try to install Python again. If you still have the error, try installing Python version {{ book.py_min_release }} from [Python.org](https://www.python.org/downloads/windows/).

> Django {{ book.django_version }} needs Python {{ book.py_min_version }} or greater, which does not support Windows XP or earlier versions.

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

You need to go to the website https://www.python.org/downloads/mac-osx/ and download the latest Python installer:

* Scarica il file *Mac OS X 64-bit/32-bit installer*
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

    $ sudo dnf install python3
    

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