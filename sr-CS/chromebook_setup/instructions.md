Možeš da [preskočiš ovo poglavlje](http://tutorial.djangogirls.org/en/installation/#install-python) ako ne koristiš Chromebook. Ako koristiš, tvoja instalacija će biti nešto drugačija. Možeš da zanemariš ostatak uputstva za instalaciju.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE je alatka koja vam omogućava uređivanje kodova i pristup računaru umreženom na internet, gde možete da instalirate, pišete, i pokrenete softver. Tokom ovog priručnika, Cloud IDE će poslužiti kao Vaš *lokalni računar*. I dalje ćes pokretati naredbe u terminalu, baš kao i Vaše kolege koje koriste OS X, Ubuntu ili Windows, ali će Vaš terminal biti povezan sa računarom pokrenutim negde drugde tamo gde je cloud IDE to podesio za tebe. Evo su uputstva za Cloud IDEs (PaizaCloud oblak IDE, AWS Cloud9). Možete da izaberete jedan od Cloud IDE-jeva i da pratite njegove instrukcije.

#### PaizaCloud Cloud IDE

1. Idite na [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Napravite Vaš nalog
3. Kliknite na *New Server* i izaberite Django aplikaciju
4. Kliknite na dugme sa nazivom "Terminal"(sa leve strane prozora)

Sada bi trebalo da vidite interfejs sa trakom sa opcijama sa leve strane. Kliknite "Terminal" dugme kako biste otvorili terminal sa komandama:

{% filename %}Terminal{% endfilename %}

    $
    

Terminal na PaizaCloud Cloud IDE je sada spreman za vaše komande. Možete da promenite veličinu prozora kako biste ga učinili malo većim.

#### AWS Cloud9

U ovu trenutku Cloud 9 zahteva da se prijavite na AWS i unesete informacije o kreditnoj kartici. 

1. Instalirajte Cloud 9 iz  Chrome web prodavnice </ 0</li> 
    
    - Idite na [ c9.io ](https://c9.io) i kliknite * Počnite sa AVS Cloud9 *
    - Prijavite se za AVS nalog (zahteva podatke o kreditnoj kartici, ali možete ga koristiti i besplatno)
    - Na AWS kontrolnoj tabli unesite * Cloud9 * u traku za pretragu i kliknite je
    - Na Cloud 9 kontrolnoj tabli, kliknite * Kreiraj okruženje *
    - Dajte mu ime * django-girls ​​*
    - Dok konfigurišete podesavanja, odaberite * Kreirajte novu instancu za okruženje (EC2) * za "Tip okruženja" i * t2.micro * "Tip instance" (trebalo bi da piše "Slobodni-nivo dostupan."). Osnovna podesavanja za uštedu troškova su u redu i možete zadržati ostale zadane vrednosti.
    - Kliknite na * Sledeći korak *
    - Kliknite na * Kreirajte okruženje *</ol> 
    
    Sada bi trebalo da vidite interfejs sa bočnom trakom, veliki glavni prozor sa nekim tekstom i mali prozor na dnu koji izgleda ovako:
    
    {% filename %}bash{% endfilename %}
    
        yourusername:~/workspace $
        
    
    Ovo donje područje je vaš terminal. Možete koristiti terminal da biste poslali uputstva udaljenom Cloud 9 računaru. Možete da promenite veličinu tog prozora da biste ga malo povećali.
    
    ### Virutelno okruženje
    
    Virtuelno okruženje (koje se takođe naziva virtualenv) je poput privatne kutije u koju možemo ubaciti korisni računarski kod za projekat na kojem radimo. Koristimo ih da sacuvamo različite bitove koda koji su nam potrebni za naše različite projekte razdvojene kako se stvari ne bi pomešale između projekata.
    
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