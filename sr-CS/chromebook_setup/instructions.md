Možeš da [preskočiš preko ovog poglavlja](http://tutorial.djangogirls.org/en/installation/#install-python) ako ne koristiš Chromebook. Ako, pak, koristiš, tvoja instalacija će teći nešto drugačije. Možeš da zanemariš ostatak uputstva za instalaciju.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE je alatka koja vam omogućava uređivanje kodova i pristup računaru umreženom na internet, gde možete da instalirate, pišete, i pokrenete softver. Tokom ovog priručnika, Cloud IDE će poslužiti kao Vaš *lokalni računar*. I dalje ćes pokretati naredbe u terminalu, baš kao i Vaše kolege koje koriste OS X, Ubuntu ili Windows, ali će Vaš terminal biti povezan sa pokrenutim računarom negde gde je cloud IDE to podesio za tebe. Evo su uputstva za oblak IDEs (PaizaCloud oblak IDE, AWS Cloud9). Možete da izaberete jedan od Cloud IDE-jeva i da pratite njegove instrukcije.

#### PaizaCloud Cloud IDE

1. Idite na [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Napravite Vaš nalog
3. Kliknite na *Novi server* (eng. New Server)
4. Kliknite na dugme sa nazivom "Terminal"(sa leve strane prozora)

Sada bi trebalo da vidite interfejs sa trakom sa opcijama sa leve strane. Kliknite "Terminal" dugme kako biste otvorili terminal sa komandama:

{% filename %}Terminal{% endfilename %}

    $
    

Terminal na PaizaCloud Cloud IDE je sada spreman za vaše komande. Možete da promenite veličinu prozora kako biste ga učinili malo većim.

#### AWS Cloud9

1. Idite na [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Napravite Vaš nalog
3. Kliknite na *Kreiraj okruženje* (eng. Create Environment)

Sada bi trebalo da vidite interfejs sa opcijama sa strane, veliki glavni prozor sa tekstom i mali prozor u dnu koji izgleda ovako:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Ovaj prostor u dnu je Vaš terminal. Možete da ga koristite kako biste poslali instrukcije Cloud 9 računaru. Možete da promenite veličinu prozora kako biste ga malo uvećali.

### Virutalno okruženje

Virtualno okruženje (eng. virtual environment, virtualenv) je nešto poput privatne kutije u koju možemo da smeštamo koristan kompjuterski kod za projekat na kom radimo. Koristimo ih da bismo razdvojili razne delove koda koji se tiču različitih projekata, tako da nema opasnosti da ćemo pomešati nešto što pripada različitim projektima.

U svom terminalu, u dnu Cloud 9 interfejsa, pokrenite sledeću komandu:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Ako nakon ovoga i dalje ne funkcioniše, pitajte svog instruktora za pomoć.

Zatim, pokrenite:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(Obratite pažnju da smo u poslednjoj liniji koristili tildu i znak jednakosti: `~=`).

### GitHub

Napravi [GitHub](https://github.com) nalog.

### PythonAnywhere

Django Girls priručnik sadrži sekciju o nečemu što se zove Razvijanje (eng. Deployment), što predstavlja proces postavljanja koda koji pokreće Vašu novu veb aplikaciju na javno dostupan računar (server), tako da i drugi ljudi mogu da vide Vaš rad.

Ovaj deo je malo čudan ukoliko se priručnik prati radeći na Chromebook-u jer već koristimo računar koji je na Internetu (nasuprot, na primer, laptopu). Međutim, i dalje je koristan ukoliko posmatramo naš Cloud 9 radni prostor kao mesto za rad koji je "u toku" i Python Aniwhere kao mesto gde će se prikazati napredak naših stvari.

Prema tome, napravite novi Python Anywhere nalog na [www.pythonanywhere.com](https://www.pythonanywhere.com).