> Parte di questa sezione è basata sul tutorial delle Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Una parte di questo capitolo di basa sul [django-marcador tutorial](http://django-marcador.keimlink.de/), con licenza Creative Commons Attribution-ShareAlike 4.0 International License. Il tutorial di django-marcador è protetto da copyright di Markus Zapke-Gründemann et al.

## Ambiente virtuale

Prima di installare Django, ti vogliamo far installare uno strumento estremamente utile per tenere in ordine l'ambiente in cui programmerai sul tuo computer. Potresti saltare questo passaggio, ma è caldamente consigliato soffermarsi. Se inizi con la migliore configurazione possibile, ti risparmierai un sacco di problemi per il futuro!

Per cui, creiamo ora un **ambiente virtuale** (chiamato anche un *virtualenv*). Virtualenv isolerà la tua configurazione di Python/Django in base ai diversi progetti. Questo significa che qualunque modifica farai su un sito non avrà alcun effetto su tutti gli altri che stai sviluppando. Chiaro ora?

Tutto quello che devi fare è trovare una cartella in cui vuoi creare il `virtualenv`; la tua home directory, ad esempio. Su Windows potrebbe apparire come `C:\Users\Name` (dove `Name` è il nome del tuo login).

> **Nota:** Su Windows, assicurati che la cartella non contenga caratteri accentati o speciali; se il tuo username contiene cartteri accentati, usa una cartella diversa, ad esempio `C:\djangogirls`.

Per questo tutorial useremo una nuova directory `djangogirls` dalla tua home directory:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Ora creeremo un virtualenv dal nome `myvenv`. Questo è il formato del comando generale:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Per creare un nuovo `virtualenv` devi aprire il prompt dei comandi ed eseguire `python -m venv myvenv`. Apparirà così:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Qui `myvenv` è il nome del tuo `virtualenv`. Puoi utilizzare qualsiasi altro nome, ma attieniti a utilizzare le minuscole, a non usare spazi, accenti o caratteri speciali. Inoltre è meglio scegliere un nome breve, dato che dovrai digitarlo molte volte!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Possiamo creare un `virtualenv` sia su Linux che su OS X eseguendo `python3 -m myvenv`. Apparirà così:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` è il nome del tuo `virtualenv`. Puoi usare qualsiasi altro nome, ma utilizza solo minuscole e niente spazi. Inoltre è meglio scegliere un nome breve, in quanto dovrai digitarlo molte volte!

> **NOTA:** Su alcune versioni di Debian/Ubuntu potresti vedere il seguente errore:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> In questo caso, segui le istruzioni sopra e installa il pacchetto `python3-venv`: {% filename %}riga di comando{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **NOTA:** In alcune versioni di Debian/Ubuntu che iniziano l'ambiente virtuale come questo attualmente dà il seguente errore:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Per aggirare il problema utilizza, invece del precedente, il comando `virtualenv`.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **NOTA:** Se ottieni un errore come
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> allora esegui:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## Lavorare con virtualenv

Il comando sopra specificato, creerà una cartella dal nome `myenv` (o col nome che hai scelto) che contiene il tuo virtual environment (ovvero un mucchio di files e cartelle).

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Avvia il tuo virtualenv digitando:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **NOTA:** su Windows 10 potresti ottenere un errore in Windows PowerShell che dice `l'esecuzione degli script è disabilitata su questo sistema`. In questo caso, apri un'altra Windows PowerShell con l'opzione "Esegui come amministratore". Quindi prova a digitare il seguente comando prima di iniziare il tuo ambiente virtuale:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

<!-- (This comment separates the two blockquote blocks, so that GitBook and Crowdin don't merge them into a single block.) -->

> **NOTA:** Per gli utenti del popolare editor VS Code, che ha un terminale integrato basato su una powershell Windows, se vuoi rimanere con il terminale integrato, puoi eseguire il seguente comando per attivare il tuo ambiente virtuale:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> Il vantaggio è che non devi passare tra le finestre dell'editor e le finestre della linea di comando

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Avvia il tuo virtualenv digitando:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Ricordati di sostituire `myvenv` con il nome del `virtualenv` che hai scelto!

> **Nota:** a volte il comando `source` potrebbe non essere disponibile. In quel caso prova ad usare questo:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ myvenv/bin/activate
>     

<!--endsec-->

Sarai certo di aver avviato il `virtualenv` quando vedrai che il prompt nella tua console inizia con `(myvenv)`.

Quando si lavora all'interno di un ambiente virtuale, `python` farà automaticamente riferimento alla versione corretta da utilizzare. Per cui puoi digitare `python` invece che `python3`.

OK, abbiamo tutte le dipendenze importanti pronte. Finalmente possiamo installare Django!

## Installare Django {#django}

Ora che hai avviato il tuo `virtualenv`, puoi installare Django.

Prima però dobbiamo assicurarci di avere la versione più recente di `pip`, il software che useremo per installare Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Installazione di pacchetti con requisiti

Un file di requisiti mantiene un elenco di dipendenze da installare utilizzando `pip install`:

Crea un file `requirements.txt` all'interno della cartella `djangogirls/` utilizzando l'editor di codice che hai installato prima. Lo fai aprendo un nuovo file nell'editor di codice e quindi salvarlo come `requirements.txt` nella cartella `djangogirls/` . La tua cartella assomiglierà a questo:

    djangogirls
    ├── myvenv
    │   └── ...
    └───requirements.txt
    

Nel tuo file `djangogirls/requirements.txt` aggiungi il testo seguente:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Now, run `pip install -r requirements.txt` to install Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> Se si verifica un errore durante la chiamata pip sulla piattaforma Windows, si prega di controllare se il tuo nome del progetto contiene spazi, accenti o caratteri speciali (ad esempio, `C:\Utenti\Nome utente\djangogirls`). Se lo fa, si prega di considerare l'utilizzo di un altro luogo senza spazi, accenti o caratteri speciali (suggerimento: `C:\djangogirls`). Crea un nuovo virtualenv nella nuova cartella, quindi cancellane uno vecchio e riprova il comando sopra. (Spostare la directory virtualenv non funzionerà perché virtualenv utilizza percorsi assoluti.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> La tua linea di comando potrebbe congelare dopo aver provato ad installare Django. Se ciò accade, invece del comando sopra utilizzato:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> Se ottieni un errore quando esegui il comando pip su Ubuntu 12.04, prova ad eseguire `python -m pip install -U --force-reinstall pip` per risolvere il problema.

<!--endsec-->

Questo è tutto! Sei (finalmente) pronto/a a creare un'applicazione Django!