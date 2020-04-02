> Per le lettrici a casa: questo capitolo è trattato nel video [Installazione di Python & Editor di codice](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Questa sezione è basata sul tutorial delle Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django è scritto in Python. Python ci serve per fare qualunque cosa in Django. Iniziamo con l'istallazione! Dovresti installare la versione più recente di Python 3, quindi se hai una versione precendente dovrai aggiornarla. Se hai già la versione 3.4 o una versione successiva non servono aggiornamenti.

Installa Python normale come segue, anche quando hai Anaconda installato sul tuo computer.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Prima verifica se il computer sta eseguendo una versione a 32 bit o una versione a 64 bit di Windows, sulla linea "Tipo di sistema" della pagina Info di sistema. Per raggiungere questa pagina, prova uno di questi metodi:

* Premi il tasto Windows e Pausa/Break contemporaneamente
* Apri il tuo Pannello di Controllo dal menu Windows, quindi naviga nel sistema & Sicurezza, quindi sistema
* Premi il pulsante Windows, quindi vai su Impostazioni > Sistema > Informazioni

Puoi scaricare Python per Windows dal sito web https://www.python.org/downloads/windows/. Clicca sul link "Ultimo Python 3 - Python x.x.x". Se il tuo computer sta eseguendo una versione **64-bit** di Windows, scarica il file **Windows x86-64 di installer eseguibile**. Altrimenti, scarica il file **Windows x86 eseguibile installer**. Dopo aver scaricato il file *.msi, lo dovresti eseguire (cliccaci sopra due volte) e segui le istruzioni.

Una cosa per cui guardare: durante l'installazione, si noti una finestra contrassegnata "Setup". Assicurati di spuntare la casella di controllo "Aggiungi Python 3.6 a PATH" o 'Aggiungi Python alle variabili ambientali" e clicca su "Installa Ora", come mostrato qui (potrebbe sembrare un po' diverso se stai installando una versione diversa):

![Non dimenticare di aggiungere Python al Path](../python_installation/images/python-installation-options.png)

Quando l'installazione è completata, potresti vedere una finestra di dialogo con un link che puoi seguire per saperne di più su Python o sulla versione installata. Chiudi o annulla questa finestra -- imparerai molto di più in questo tutorial!

Nota: se stai usando una versione precedente di Windows (7, Vista o qualsiasi versione precedente) e l'installazione Python 3.6.x fallisce e restituisce un errore, puoi provare a:

1. installare tutti gli aggiornamenti di Windows e provare a installare di nuovo Python; oppure
2. installare una [versione precedente di Python](https://www.python.org/downloads/windows/), ad esempio la [3.4.6](https://www.python.org/downloads/release/python-346/).

Se installi una versione precedente di Python, la schermata di installazione potrebbe apparire un po' diversa da quella mostrata sopra. Assicurati di scorrere verso il basso per vedere "Aggiungi python.exe al Path", quindi clicca sul pulsante a sinistra e scegli "Verrà installato sul disco rigido locale":

![Aggiungi Python al percorso, versioni precedenti](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Nota** Prima di installare Python su OS X, devi garantire che le impostazioni Mac consentano l'installazione di pacchetti che non sono presenti nell'App Store. Vai alle Preferenze di sistema (è nella cartella Applicazioni), clicca "Sicurezza & Privacy," e poi la scheda "Generale". Se le tue "Consenti app scaricate da:" sono impostate su "Mac App Store," cambiale in "Mac App Store e sviluppatori identificati."

Devi andare sul sito https://www.python.org/downloads/release/python-361/ e scaricare il programma di installazione di Python:

* Scarica il file *Mac OS X 64-bit/32-bit installer*
* Fai doppio click su *python-3.4.3-macosx10.6.pkg* per eseguire il programma d'istallazione.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

È molto probabile che tu abbia Python già installato di default. Per controllare se ce l'hai già installato (e quale versione è), apri una console e digita il seguente comando:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Se hai una differente 'micro versione' di Python installata, ad esempio la 3.4.0, non hai bisogno di aggiornarla. Se non hai Python installato, o se vuoi una versione diversa, controlla prima quale distribuzione Linux stai usando con il seguente comando:

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

Digita questo comando nella tua console:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

Se sei nelle vecchie versioni Fedora potresti ottenere un errore che il comando `dnf` non è stato trovato. In questo caso, devi utilizzare `yum` invece.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Digita questo comando nella tua console:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verifica che l'installazione si sia conclusa correttamente aprendo l'applicazione *Terminal* ed eseguendo il comando `python3`:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

La versione mostrata può essere diversa da 3.6.1 -- dovrebbe corrispondere alla versione installata.

**NOTA:** Se sei su Windows e ricevi un messaggio di errore che dice che `python3` non è stato trovato, prova ad utilizzare `python` (senza `3`), controlla sia la versione di Python 3.4.0 o superiore. Se anche questo non funziona, puoi aprire un nuovo prompt dei comandi e riprovare; questo accade se usi un prompt dei comandi aperto da prima dell'installazione di Python.

* * *

Se hai dubbi o se qualcosa è andato storto e non hai idea di cosa fare dopo - chiedi al tuo coach! A volte le cose non vanno come dovrebbero ed è meglio chiedere aiuto a qualcuno con più esperienza.