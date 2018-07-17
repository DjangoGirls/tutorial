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

Virtualno okruženje (eng. virtual environment, virutalenv) je poput privatne kutije u koju možemo natrpati koristan računalni kod za projekt na kojem radimo. Koristimo ih kako bismo zadržali razne komadiće koda za naše razne projekte odvojene kako nam se ništa između projekata ne bi pomiješalo.

U svom terminalu na dnu Cloud 9 sučelja pokreni sljedeće:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Ako ovo i dalje ne radi, pitaj svoj učitelja za pomoć.

Nadalje, pokreni:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(Primijeti da smo u zadnjoj liniji koristili tildu popraćenu znakom jednakosti: ~=)

### GitHub

Make a [GitHub](https://github.com) account.

### Python Anywhere

Django Girls tutorijal uključuje dio o nečemu što se zove Postavljanje (Deployment) što je proces kopiranja koda koji pokreće tvoju novu web aplikaciju na javno dostupno računalo (zvano poslužitelj ili server) tako da i drugi ljudi mogu vidjeti tvoj rad.

Ovaj je dio malo čudan kada se tutorijal radi na Chromebooku jer već koristimo računalo koje je na Internetu (a ne, na primjer, laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Tako da, prijavi se za novi Python Anywhere račun na: [www.pythonanywhere.com](https://www.pythonanywhere.com).