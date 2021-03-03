> Per le lettrici a casa: questo capitolo è trattato nel video [Installazione di Python & Editor di codice](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Questa sezione è basata sul tutorial delle Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django è scritto in Python. Python ci serve per fare qualunque cosa in Django. Iniziamo con l'installazione! Dovresti installare la versione più recente di Python 3, quindi se hai una versione precendente dovrai aggiornarla. Se possiedi già la versione {{ book.py_min_version }} o una versione successiva non servono aggiornamenti.

Installa Python normale come segue, anche quando hai Anaconda installato sul tuo computer.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Prima verifica se il computer sta eseguendo una versione a 32 bit o una versione a 64 bit di Windows, sulla linea "Tipo di sistema" della pagina Info di sistema. Per raggiungere questa pagina, prova uno di questi metodi:

* Premi il tasto Windows e Pausa/Break contemporaneamente
* Apri il tuo Pannello di Controllo dal menu Windows, quindi naviga nel sistema & Sicurezza, quindi sistema
* Premi il pulsante Windows, quindi vai su Impostazioni > Sistema > Informazioni
* Cerca "System Information" nel menu Start di Windows. Per fare ciò, clicca sul pulsante Start o premi il tasto Windows, poi inizia a digitare `System Information`. Inizierà a dare suggerimenti non appena digiterai. Puoi selezionare la voce una volta che compare.

Puoi scaricare Python per Windows dal sito web https://www.python.org/downloads/windows/. Clicca sul link "Ultimo Python 3 - Python x.x.x". Se il tuo computer sta eseguendo una versione **64-bit** di Windows, scarica il file **Windows x86-64 di installer eseguibile**. Altrimenti, scarica il file **Windows x86 eseguibile installer**. Dopo aver scaricato il file *.msi, lo dovresti eseguire (cliccaci sopra due volte) e segui le istruzioni.

Una cosa per cui guardare: durante l'installazione, si noti una finestra contrassegnata "Setup". Assicurati di selezionare la casellina "Add Python {{ book.py_version }} to PATH" o 'Aggiungi Python alle tue variabili ambientali" e clicca su "installa ora", come mostrato qui (potrebbe risultare leggermente diverso se stai installando una versione differente):

![Non dimenticare di aggiungere Python al Path](../python_installation/images/python-installation-options.png)

Quando l'installazione è completata, potresti vedere una finestra di dialogo con un link che puoi seguire per saperne di più su Python o sulla versione installata. Chiudi o annulla questa finestra -- imparerai molto di più in questo tutorial!

Nota: Se si utilizza una versione precedente di Windows (7, Vista, o qualsiasi versione precedente) e l'installatore di Python {{ book.py_version }} non funziona per un errore, installare tutti gli aggiornamenti di Windows e provare a installare nuovamente Python. Se l'errore si ripresenta, prova ad installare la versione di Python {{ book.py_min_release }} da [Python.org](https://www.python.org/downloads/windows/).

> Django {{ book.django_version }} ha bisogno di Python {{ book.py_min_version }} o maggiore, che non supporta Windows XP o versioni precedenti.

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Nota** Prima di installare Python su OS X, devi fare in modo/ verificare che le impostazioni Mac consentano l'installazione di pacchetti che non sono presenti nell'App Store. Vai alle Preferenze di sistema (è nella cartella Applicazioni), clicca "Sicurezza & Privacy," e poi la scheda "Generale". Se il tuo "Consenti le app scaricate da:" è impostato su "Mac App Store", cambialo in "Mac App Store e sviluppatori identificati".

Devi andare sul sito https://www.python.org/downloads/mac-osx/ e scaricare il programma di installazione di Python più recente:

* Scarica il file *Mac OS X 64-bit/32-bit installer*
* Fare doppio clic su *python-{{ book.py_release }}-macosx10.9.pkg* per eseguire l'installer.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

È molto probabile che tu abbia già installato Python fuori dalla scatola. Per verificare se è installata (e quale versione è), aprire una console e digitare il seguente comando:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

Se hai una versione diversa di Python installata, almeno {{ book.py_min_version }} (es. {{ book.py_min_release }}), allora non devi aggiornare. Se non hai Python installato, o se vuoi una versione diversa, controlla prima quale distribuzione Linux stai usando con il seguente comando:

{% filename %}command-line{% endfilename %}

    $ grep '^NAME=' /etc/os-release
    

In seguito, a seconda del risultato, segui una delle seguenti guide di installazione sotto questa sezione.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Digita questo comando nella tua console:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Usa questo comando nella tua console:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

Se sei nelle vecchie versioni Fedora potresti ottenere un errore che il comando `dnf` non è stato trovato. In questo caso, devi utilizzare `yum` invece.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Usa questo comando nella tua console:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verifica che l'installazione si sia conclusa correttamente aprendo l'applicazione *Terminal* ed eseguendo il comando `python3`:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

La versione mostrata può essere diversa da {{ book.py_release }} -- dovrebbe corrispondere alla versione installata.

**NOTA:** Se sei su Windows e ricevi un messaggio di errore che dice che `python3` non è stato trovato, prova ad utilizzare `python` (senza `3`), controlla sia la versione di Python che è {{ book.py_min_version }} o superiore. Se anche questo non funziona, puoi aprire un nuovo prompt dei comandi e riprovare; questo accade se usi un prompt dei comandi aperto da prima dell'installazione di Python.

* * *

Se hai dubbi o se qualcosa è andato storto e non hai idea di cosa fare dopo - chiedi al tuo coach! A volte le cose non vanno come dovrebbero ed è meglio chiedere aiuto a qualcuno con più esperienza.