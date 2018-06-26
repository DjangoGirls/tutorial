Možeš da [preskočiš preko ovog poglavlja](http://tutorial.djangogirls.org/en/installation/#install-python) ako ne koristiš Chromebook. Ako, pak, koristiš, tvoja instalacija će teći nešto drugačije. Možeš da zanemariš ostatak uputstva za instalaciju.

### Cloud 9

Cloud 9 je alatka koja predstavlja uređivač koda i omogućava ti pristup računaru umreženom na internetu, a gde možeš da instaliraš, pišeš i pokreneš softver. Tokom ovog priručnika, Cloud 9 će služiti kao tvoj *lokalni računar*. I dalje ćeš pokretati naredbe u terminalu, baš kao i tvoji kolege koji koriste OS X, Ubuntu ili Windows, ali će tvoj terminal biti povezan sa računarom pokrenutim negde gde je Cloud 9 to podesio za tebe.

1. Instaliraj Cloud 9 iz [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Idi na [c9.io](https://c9.io)
3. Registruj nalog
4. Klikni na *Create a New Workspace*
5. Imenuj ga *django-girls*
6. Izaberi *Blank* (drugi zdesna u donjem redu, sa narandžastim logom)

Sada bi trebalo da možeš da vidiš interfejs sa sajdbar-om, veliki glavni prozor sa tekstom i mali prozor na dnu koji izgleda nešto poput:

{% filename %}Cloud 9{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your *terminal*, where you will give the computer Cloud 9 has prepared for your instructions. You can resize that window to make it a bit bigger.

### Virtual Environment

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
    pip install django~=1.11.0
    

(note that on the last line we use a tilde followed by an equal sign: ~=).

### Github

Make a [Github](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).