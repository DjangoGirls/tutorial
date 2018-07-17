Puoi [saltare questa sezione](http://tutorial.djangogirls.org/en/installation/#install-python) se non stai usando un Chromebook. Altrimenti, la tua installazione seguirà una procedura diversa. Puoi ignorare il resto delle istruzioni di installazione.

### Cloud9

Cloud9 è uno strumento che mette a disposizione un editor e l'accesso ad un computer su Internet su cui puoi installare, scrivere ed eseguire il software. Per questo tutorial, Cloud9 sarà come il tuo *computer locale*. Potrai sempre scrivere comandi sul terminale come i tuoi compagni di classe su OS X, Ubuntu o Windows, ma il tuo terminale sarà connesso ad un computer attivo da un'altra parte, che Cloud9 configura per te.

1. Installa Cloud 9dal [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Vai su [c9.io](https://c9.io)
3. Registrati
4. Clicca *Crea nuovo spazio di lavoro*
5. Chiamalo *django-girls*
6. Seleziona *Blank* (secondo da destra nella riga in basso con il logo arancione)

Ora dovresti vedere un'interfaccia con una barra laterale, una grossa finestra principale con del testo, ed una piccola finestra in basso che somiglia a questa:

{% filename %}Cloud 9{% endfilename %}

    tuonome:~/workspace $
    

Quest'area in basso è il tuo *terminale*, dove darai le tue istruzioni al computer che Cloud9 ha preparato. Puoi ridimensionare questa finestra per renderla un po' più grande.

### Ambiente virtuale

Un ambiente virtuale (in inglese virtual environment, abbreviato spesso in virtualenv) è come una scatola privata in cui possiamo mettere del codice per un progetto su cui stiamo lavorando. Li usiamo per tenere separati i vari pezzi di codice dei nostri progetti, affinchè non si crei confusione tra di essi.

Nel terminale in basso dell'interfaccia di Cloud9, esegui:

{% filename %} Nuvola 9 {% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Se non funziona, chiedi aiuto al tuo coach.

Poi, esegui:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(nota che nell'ultima linea abbiamo usato una tilde seguita da un segno di uguale: ~=).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

Il tutorial Django Girls include una sezione chiamata Distribuzione, ovvero spostare su un computer accessibile a tutti (chiamato server) il codice che alimenta la tua nuova applicazione web, affinché altre persone possano vedere il tuo lavoro.

Questa parte del tutorial è un po' strana seguendo il tutorial su un Chromebook, poiché stiamo già usando un computer che è già su internet (al contrario di, per esempio, un laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Quindi, registrati a PythonAnywhere su [www.pythonanywhere.com](https://www.pythonanywhere.com).