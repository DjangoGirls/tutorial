> Una parte di questo capitolo si basa sui tutorial delle Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Una parte di questo capitolo di basa sul [django-marcador tutorial](http://django-marcador.keimlink.de/) sotto licenza Creative Commons Attribution-ShareAlike 4.0 International License. Il tutorial di django-marcador è protetto da copyright di Markus Zapke-Gründemann et al.

## Ambiente virtuale

Prima di installare Django, ti vogliamo far installare uno strumento estremamente utile per tenere in ordine l'ambiente in cui programmerai sul tuo computer. Potresti saltare questo passaggio, ma è caldamente consigliato soffermarsi. Se inizi con la migliore configurazione possibile, ti risparmierai un sacco di problemi per il futuro!

Per cui, creiamo ora un **ambiente virtuale** (chiamato anche un *virtualenv*). Virtualenv isolerà la tua configurazione di Python/Django in base ai diversi progetti. Questo significa che qualunque modifica farai su un sito non avrà alcun effetto su tutti gli altri che stai sviluppando. Chiaro ora?

Tutto quello che devi fare è trovare una cartella in cui vuoi creare il `virtualenv`; la tua home directory, ad esempio. Su Windows potrebbe essere `C:\Users\Name` (dove `Name` è il nome del tuo login).

Per questo tutorial useremo una nuova directory `djangogirls` dalla tua home directory:

    mkdir djangogirls
    cd djangogirls
    

Ora creeremo un virtualenv dal nome `myvenv`. Questo è il formato del comando generale:

    python3 -m venv myvenv
    

### Windows

Per creare un nuovo `virtualenv` è necessario aprire la console (ti abbiamo spiegato come fare nei capitoli precedenti, ricordi?) ed esegui `C:\Python34\python -m venv myvenv`. Il risultato somiglierà a questo:

    C:\Users\Name\djangogirls> C:\Python34\python -m venv myvenv
    

dove `C:\Python34\python` è la directory in cui precedentemente hai installato Python e `myvenv` è il nome del tuo `virtualenv`. Puoi utilizzare qualsiasi altro nome, ma attieniti a utilizzare le minuscole, a non usare spazi, accenti o caratteri speciali. È meglio usare un nome breve dal momento che dovrai digitarlo spesso!

### Linux e OS X

Creare un `virtualenv` su Linux e OS X è semplice, basta digitare: `python3 -m venv myvenv`. Il risultato sarà simile a questo:

    ~/djangogirls$ python3 -m venv myvenv
    

`myvenv` è il nome del tuo `virtualenv`. Puoi usare qualsiasi altro nome, ma utilizza solo minuscole e niente spazi. Sarebbe meglio se il nome fosse corto perchè lo dovrai digitare molte volte!

> **NOTA:** Avviare il virtualenv su Ubuntu 14.04 in questa maniera al momento darà il seguente errore:
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Per aggirare il problema utilizza, invece del precedente, il comando `virtualenv`.
> 
>     ~/djangogirls$ sudo apt-get install python-virtualenv
>     ~/djangogirls$ virtualenv --python=python3.4 myvenv
>     

## Lavorare con virtualenv

Il comando sopra specificato, creerà una cartella dal nome `myvenv` (o col nome che hai scelto) che contiene il tuo virtual environment (ovvero un mucchio di files e cartelle).

#### Windows

Avvia il tuo virtualenv digitando:

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    


#### Linux e OS X

Avvia il tuo virtualenv digitando:

    ~/djangogirls$ source myvenv/bin/activate
    

Ricordati di sostituire `myvenv` con il nome `virtualenv` che hai scelto!

> **Nota:** a volte il comando `source` potrebbe non essere disponibile. In quel caso prova ad usare questo:
> 
>     ~/djangogirls$ . myvenv/bin/activate
>     

Saprai con certezza che hai avviato `virtualenv` quando vedrai che il prompt dei comandi nella console si presenta così:

    (myvenv) C:\Users\Name\djangogirls>
    

oppure:

    (myvenv) ~/djangogirls$
    

Fai caso al prefisso `(myvenv)`!

Quando si lavora all'interno di un ambiente virtuale, `python` farà automaticamente riferimento alla versione corretta da utilizzare. Per cui puoi digitare `python` invece `python3`.

OK, abbiamo tutte le dipendenze importanti pronte. Finalmente possiamo installare Django!

## Installare Django

Ora che hai iniziato ad utilizzare il tuo `virtualenv`, puoi installare Django usando `pip`. Nella console, esegui `pip install django==1.8` (nota che usiamo un doppio simbolo di uguale: `==`).

    (myvenv) ~$ pip install django==1.8
    Downloading/unpacking django==1.8
    Installing collected packages: django
    Successfully installed django
    Cleaning up...
    

Su Windows

> Se ottieni un errore quando chiami pip sulla piattaforma Windows controlla se il pathname del tuo progetto contiene spazi, accenti o caratteri speciali (i.e. `C:\Users\User Name\djangogirls`). Se è così ti conviene spostarlo in un altro path senza spazi, accenti o caratteri speciali (il suggerimento è: `C:\djangogirls`). Dopo averlo spostato, prova ad eseguire di nuovo il comando di cui sopra.

su Linux

> Se ottieni un errore quando esegui il comando pip su Ubuntu 12.04, prova ad eseguire `python -m pip install -U --force-reinstall pip` per risolvere il problema.

Questo è tutto! Sei (finalmente) pronto/a a creare un'applicazione Django!
