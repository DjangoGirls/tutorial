Puoi [saltare questa sezione](http://tutorial.djangogirls.org/en/installation/#install-python) se non utilizzi un Chromebook. L'installazione su Chromebook segue una procedura un po' diversa. Il resto delle istruzioni di installazione può essere ignorato.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE è uno strumento che mette a disposizione un editor di codice e l'accesso ad un computer virtuale su cui installare, scrivere ed eseguire il software. In questo tutorial, Cloud IDE avrà la funzione di un *computer locale*. Digiterai i comandi sull'interfaccia di un terminale, come le tue compagne di corso che utilizzano OS X, Ubuntu o Windows, ma il tuo terminale sarà connesso a un computer remoto che Cloud IDE ha creato per te. Di seguito trovi le istruzioni per i cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9). Puoi selezionare uno dei Cloud IDE e seguire le relative istruzioni.

#### PaizaCloud Cloud IDE

1. Andare su [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Creare un account
3. Clicca su *Nuovo server* oppure <0>New Server</0> e scegli l'app Django
4. Fare click sul pulsante Terminal (sul lato sinistro della finestra)

Ora dovresti vedere un'interfaccia con una barra laterale e dei pulsanti sulla sinistra. Fai click sul pulante "Terminal" per aprire la finestra del terminale con il prompt, così:

{% filename %}Terminal{% endfilename %}

    $
    

Il terminale su PaizaCloud Cloud IDE è pronto a ricevere istruzioni. Puoi ridimensionare la finestra o renderla un po' più più grande.

#### AWS Cloud9

Attualmente Cloud 9 richiede la registrazione con AWS e l'inserimento delle informazioni sulla carta di credito.

1. Installa Cloud9 dal [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Vai su [c9.io](https://c9.io) e clicca *Inizia con AWS Cloud9*
3. Registra un account AWS (richiede informazioni sulla carta di credito, ma puoi usarlo gratuitamente)
4. Nella Dashboard di AWS, inserisci *Cloud9* nella barra di ricerca e facci click
5. Nel cruscotto Cloud 9, clicca su *Crea ambiente*
6. Chiamalo *django-girls*
7. Durante la configurazione delle impostazioni, selezionare *Creare una nuova istanza per l'ambiente (EC2)* per "Tipo di Ambiente" e *t2.micro* "Tipo di Istanza" (dovrebbe essere "Free-tier."). L'impostazione di default per il risparmio dei costi va bene e puoi mantenere le altre impostazioni predefinite.
8. Clicca *Passo Successivo*
9. Fai click su *Create Environment*

Ora dovresti vedere un'interfaccia con una barra laterale, una grossa finestra principale con del testo, ed una piccola finestra in basso che sembra questa:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Questa finestra in basso è il tuo terminale. Puoi usare il terminale per inviare istruzioni al computer remoto Cloud9. Puoi cambiare le dimensioni della finestra e renderla più grande.

### Ambiente virtuale

Un ambiente virtuale (in inglese virtual environment, abbreviato spesso in virtualenv) è come una scatola privata in cui possiamo istallare le dipendenze per un progetto su cui stiamo lavorando. Li usiamo per tenere separate le dipendenze dei nostri progetti, affinché non vengano mescolate tra di essi e non si crei confusione.

Esegui:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(nota che nell'ultima linea abbiamo usato una tilde seguita dal segno 'uguale':`~=`).

### GitHub

Crea un account [GitHub](https://github.com).

### PythonAnywhere

Il tutorial Django Girls include una sezione chiamata Deployment, che è il processo di spostamento del codice della tua applicazione web su un computer accessibile a tutti (chiamato server) in modo tale che altre persone possano vedere il tuo lavoro.

Questa parte del tutorial è un po' strana seguendo il tutorial su un Chromebook, poiché stiamo già usando un computer che è già su internet (al contrario di, per esempio, un laptop). Tuttavia è importante, se pensiamo a Cloud9 come ad uno spazio dove abbiamo il nostro lavoro in modalità "work in progress", ed a PythonAnywhere come ad uno spazio dove pubblicare il nostro progetto quando è più completo.

Quindi, registrati a PythonAnywhere su [www.pythonanywhere.com](https://www.pythonanywhere.com).