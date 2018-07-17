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
    

Ova oblast na dnu je tvoj *terminal*: tu ćeš dati naredbe računaru koji je Cloud 9 pripremio za tebe. Možeš da podesiš veličinu prozora kako ti odgovara.

### Virutalno okruženje

Virtualno okruženje (eng. virtual environment, virutalenv) je nešto poput privatne kutije u koju možemo smestiti sav koristan kod za projekt na kojem radimo. Koristimo ih da bismo razdvojili razne delove koda koji se tiču različitih projekata. Tako nema opasnosti da ćemo pomešati nešto što pripada različitim projektima.

U svom terminala na dnu Cloud 9 interfejsa, zadaj sledeće:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Ako nakon ovoga i dalje ne funkcioniše, pitaj svog instruktora/svoju instruktorku za pomoć.

Nakon toga, pokreni:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(Obrati pažnju da smo u poslednjoj liniji koristili tildu praćenu znakom jednakosti: ~=).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

Django Girls priručnik sadrži deo o nečemu što se zove Postavljanje (eng. Deployment). To je proces kopiranja koda koji pokreće tvoju novu web aplikaciju na javno dostupnom računaru (zvanom server), tako da i drugi ljudi mogu vidjti tvoj rad.

Ovaj deo je malo čudan ukoliko se priručnik prati radeći na Chromebook-u jer se koristi računar koji je na Internetu (nasuprot, na primer, laptopu). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).