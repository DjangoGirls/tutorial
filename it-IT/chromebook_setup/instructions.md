Puoi [saltare questa sezione](http://tutorial.djangogirls.org/en/installation/#install-python) se non utilizzi un Chromebook. L'installazione su Chromebook segue una procedura un po' diversa. Il resto delle istruzioni di installazione puó essere ignorato.

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
4. In the AWS Dashboard, enter *Cloud9* in the search bar and click it
5. In the Cloud 9 dashboard, click *Create environment*
6. Name it *django-girls*
7. While configuring settings, select *Create a new instance for environment (EC2)* for "Environment Type" and the *t2.micro* "Instance type" (it should say "Free-tier eligible."). The default cost-saving setting is fine and you can keep the other defaults.
8. Click *Next step*
9. Click *Create environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### Ambiente virtuale

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).