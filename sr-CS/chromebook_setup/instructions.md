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
    
    Pokreni:
    
    {% filename %}Cloud 9{% endfilename %}
    
        mkdir djangogirls
        cd djangogirls
        python3.6 -mvenv myvenv
        source myvenv/bin/activate
        pip install django~={{ book.django_version }}
        
    
    (imajte na umu da u zadnjem redu koristimo znak priblizno nakon kojeg sledi znak jednakosti: ` ~ = `).
    
    ### GitHub
    
    Napravite [ GitHub ](https://github.com) nalog.
    
    ### PythonAnywhere
    
    Vodič za Django Girls sadrži odeljak koji se naziva Postavljanje, to je postupak preuzimanja koda koji pokreće vašu novu web aplikaciju i premeštanja je na javno dostupan računar (zvan server) kako bi drugi mogli da vide vaš rad.
    
    Ovaj deo je malo čudan kada radite tutorial na Chromebooku jer već koristimo računar koji se nalazi na Internetu (za razliku od recimo laptopa). Međutim, to je još uvek korisno jer možemo smatrati da naš Cloud 9 radni prostor predstavlja mesto za naš "u toku" rad, a Python Anywhere kao mesto da pokažemo naše stvari kako postaju potpunije. 
    
    Tako da, prijavite se za novi Python Anywhere nalog na [ www.pythonanywhere.com ](https://www.pythonanywhere.com).