> Questa sezione si basa su un tutorial fatto da Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django è scritto in Python. Abbiamo bisogno di Python per fare qualsiasi cosa in Django. Iniziamo con l'installazione! Vogliamo che sul tuo pc sia installato Python 3.4 quindi se hai una versione precedente, dovrai aggiornarlo.

### Windows

Puoi scaricare Python per Windows dal sito web https://www.python.org/downloads/release/python-343/. Dopo aver scaricato il file ***.msi**, lo dovresti eseguire (cliccaci sopra due volte) e segui le istruzioni. È importante ricordare il percorso (la directory) dove ha installato Python. Più tardi sarà necessario!

Una cosa a cui fare attenzione: sulla seconda schermata dell'installazione guidata, contrassegnata "Customize", assicurati di scorrere verso il basso e di scegliere l'opzione "Add python.exe to the Path", come illustrato qui:

![Non dimenticare di aggiungere Python al Path](../python_installation/images/add_python_to_windows_path.png)

### Linux

È molto probabile che tu abbia Python già installato di default. Per controllare se ce l'hai già installato (e quale versione è), apri una console e digita il seguente comando:

    $ python3 --version
    Python 3.4.3
    

Se non hai Python installato o se vuoi una versione diversa, puoi installarla come segue:

#### Debian o Ubuntu

Digita questo comando nella tua console:

    $ sudo apt-get install python3.4
    

#### Fedora (fino a 21)

Usa questo comando nella tua console:

    $ sudo yum install python3.4
    

#### Fedora (22+)

Usa questo comando nella tua console:

    $ sudo dnf install python3.4
    

#### openSUSE

Usa questo comando nella tua console:

    $ sudo zypper install python3


### OS X

Devi andare sul sito https://www.python.org/downloads/release/python-343/ e scarica il programma d'installazione di Python:

  * Scarica il file *Mac OS X 64-bit/32-bit installer*
  * Fai doppio click su *python-3.4.3-macosx10.6.pkg* per eseguire il programma d'installazione.

Verifica che l'installazione si sia conclusa correttamente aprendo l'applicazione *Terminal* ed eseguendo il comando `python3`:

    $ python3 --version
    Python 3.4.3
    

* * *

Se hai dubbi o se qualcosa è andato storto e non hai idea di cosa fare dopo - chiedi al tuo insegnante! A volte le cose non vanno come dovrebbero ed è meglio chiedere aiuto a qualcuno con più esperienza.
