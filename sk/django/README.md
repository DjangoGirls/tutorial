# Čo je Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. Webový framework je súbor komponentov, ktoré ti pomôžu vytvárať stránky rýchlejšie a ľahšie.

Pri tvorení webových stránok, potrebuješ vždy sadu podobných komponentov: spôsob, ako riešiť autentifikáciu užívateľov (registráciu, prihlásenie, odhlásenie), kontrolný panel web stránky, formuláre, spôsob, ako nahrávať súbory, atď.

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## Prečo potrebuješ framework?

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

Predstav si poštovú schránku (port), na ktorej sa sledujú prichádzajúce listy (žiadosti). To vlastne robí web server. The web server reads the letter and then sends a response with a webpage. Ale ak chceš niečo poslať, potrebuješ mať nejaký obsah. A Django je to, čo ti obsah pomôže vytvoriť.

## Čo sa stane, ak niekto požaduje z tvojho servera web stránku?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Predstav si poštárku s listom. Kráča ulicou a porovnáva čísla domov s číslom na liste. Ak sa zhoduje, nechá tam list. Takto funguje urlresolver!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Čo ak užívateľ požiada o zmenu v údajoch? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

Samozrejme, vyššie uvedený popis je trochu zjednodušený, ale zatiaľ ešte nepotrebuješ vedieť všetky technické detaily. Pre všeobecnú predstavu to však stačí.

Takže namiesto zložitého študovania detailov, jednoducho začneme v Djangu niečo vytvárať a všetky dôležité veci sa naučíme popri tom!