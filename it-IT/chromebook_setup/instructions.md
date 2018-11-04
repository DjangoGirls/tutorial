E' possibile [saltare questa sezione](http://tutorial.djangogirls.org/en/installation/#install-python) se non si utilizza un Chromebook. Altrimenti, la tua installazione seguirà una procedura diversa. Il resto delle istruzioni di installazione puó essere ignorato.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud9 è uno strumento che mette a disposizione un editor e l'accesso ad un computer su Internet su cui installare, scrivere ed eseguire il software. In questo tutorial, Cloud9 sarà come un *computer locale*. I comandi verranno digitati sul terminale come i compagni di classe che eseguino OS X, Ubuntu o Windows ma, il terminale, sarà connesso ad una macchina remota in esecuzione da qualche latra parte configurata dal cloud IDE. Di seguito le istruzioni per gli IDE cloud (PaizaCloud Cloud IDE, AWS Cloud9). E' possibile selezionare uno degli IDE Cloud e seguire le relative istruzioni.

#### PaizaCloud Cloud IDE

1. Andare su [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Creare un account
3. Cliccare su *New Server*
4. Fare click sul pulsante Terminal (sul lato sinistro della finestra)

Verrà visualizzata un'interfaccia con una barra laterale e dei bottoni sulla sinistra. Fare click sul pulante "Terminal" una nuova finestra simile a questa verrà visualizzata:

{% filename %}Terminal{% endfilename %}

    $
    

Il terminale PaizaCloud Cloud IDE è pronto per ricevere istruzioni. E' possibile ridimensionare o massimizzare la finiestra per renderla più grande.

#### AWS Cloud9

1. Andare su [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Creare un account
3. Click *Create Environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your *terminal*, where you will give the computer Cloud 9 has prepared for your instructions. You can resize that window to make it a bit bigger.

### Ambiente virtuale

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

In your terminal at the bottom of the Cloud 9 interface, run the following:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

If this still doesn't work, ask your coach for some help.

Next, run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: ~=).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).