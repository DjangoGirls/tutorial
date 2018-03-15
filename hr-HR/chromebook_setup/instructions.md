Možeš [odmah preskočiti ovaj dio](http://tutorial.djangogirls.org/en/installation/#install-python) ako ne koristiš Chromebook. Ako ipak koristiš, tvoje će iskustvo instalacije biti malo drugačije. Možeš ignorirati ostatak uputa za instalaciju.

### Cloud 9

Cloud 9 je alat koji ti daje uređivač koda i pristup računalu pokrenutom na Internetu gdje možeš instalirati, pisati i pokretati programsku potporu (eng. software). Za vrijeme tutorijala, Cloud 9 služit će kao tvoj *lokalni stroj*. I dalje ćeš pokretati naredbe u terminalu kao i tvoji kolege iz razreda na OS X, Ubuntu ili Windowsima, ali tvoj će terminal biti povezan na računalo pokrenuto negdje drugdje gdje ga Cloud 9 postavi za tebe.

1. Instaliraj Cloud 9 iz [Chrome web store-a](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Odi na [c9.io](https://c9.io)
3. Napravi račun
4. Pritisni *Create a New Workspace*
5. Imenuj ga *django-girls*
6. Odaberi *Blank* (donji red, narančasti logo, drugo zdesna)

Sada bi trebala vidjeti sučelje s alatnom trakom sa strane, veliki glavni prozor s nekim tekstom i mali prozor na dnu koji izgleda ovako nekako:

{% filename %}Cloud 9{% endfilename %}

    yourusername:~/workspace $
    

To donje područje je tvoj *terminal* u kojem ćeš davati naredbe računalu koje je Cloud 9 pripremio za tebe. Možeš promijeniti veličinu tog prozora da bude malo veći.

### Virutalno okruženje

Virtualno okruženje (eng. virtual environment, virutalenv) je poput privatne kutije u koju možemo natrpati koristan računalni kod za projekt na kojem radimo. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

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

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place or our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).