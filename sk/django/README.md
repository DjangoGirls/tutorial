# Čo je Django?

Django (*džängou*) je bezplatný a open source webový framework na vytváranie webových aplikácií, napísaný v Pythone. Webový framework je súbor komponentov, ktoré ti pomôžu vytvárať stránky rýchlejšie a ľahšie.

Pri tvorení webových stránok, potrebuješ vždy sadu podobných komponentov: spôsob, ako riešiť autentifikáciu užívateľov (registráciu, prihlásenie, odhlásenie), kontrolný panel web stránky, formuláre, spôsob, ako nahrávať súbory, atď.

Našťastie si iní ľudia už dávno všimli, že weboví vývojári čelia pri tvorbe nového webu podobným problémom, takže sa spojili a vytvorili frameworky (Django je jedným z nich) a tie ti poskytujú hotové komponenty, ktoré môžeš používať.

Frameworky sú tu na to, aby si nemusela znovu vynájsť koleso. Pomôžu ti uľahčiť tvorbu nových web stránok.

## Prečo potrebuješ framework?

Aby sme pochopili, čo vlastne Django je, potrebujeme sa zblízka pozrieť na servery. Prvá vec, čo o nich musíš vedieť, je, že budú obsluhovať tvoju stránku.

Predstav si poštovú schránku (port), na ktorej sa sledujú prichádzajúce listy (žiadosti). To vlastne robí web server. Web server prečíta list a pošle odpoveď v podobe web stránky. Ale ak chceš niečo poslať, potrebuješ mať nejaký obsah. A Django je to, čo ti obsah pomôže vytvoriť.

## Čo sa stane, ak niekto požaduje z tvojho servera web stránku?

Keď na webový server príde žiadosť, tá je preposlaná do Djanga, ktoré sa pokúsi zistiť, čoho sa vlastne žiadosť týka. Najprv si zoberie adresu webstránky a zisťuje, čo má urobiť. Túto časť vykonáva Django **urlresolver** (všimni si, že adresa webstránku sa nazýva - Uniform Resource Locator - URL, takže názov *urlresolver* dáva zmysel). Nie je to nič extra inteligentné - zoberie zoznam vzorov a porovnáva ich s URL. Django overuje vzory od vrchu po spodok a ak nájde zhodu, Django pošle žiadosť príslušnej funkcii (ktorá sa nazýva *view* - pohľad).

Predstav si poštárku s listom. Kráča ulicou a porovnáva čísla domov s číslom na liste. Ak sa zhoduje, nechá tam list. Takto funguje urlresolver!

Vo funkcii *view* sa dejú všetky zaujímavé veci: môžeme sa pozrieť do databázy a vyhľadať nejaké informácie. Čo ak užívateľ požiada o zmenu v údajoch? Napríklad listom, v ktorom je žiadosť "Prosím, zmeňte popis mojej práce." *view* overí, či máš oprávnenie na túto zmenu, potom aktualizuje popis tvojej práce a naspäť pošle správu: "Hotovo!". Potom *view* vygeneruje odpoveď a Django ju môže odoslat tvojmu webovému prehliadaču.

Samozrejme, vyššie uvedený popis je trochu zjednodušený, ale zatiaľ ešte nepotrebuješ vedieť všetky technické detaily. Pre všeobecnú predstavu to však stačí.

Takže namiesto zložitého študovania detailov, jednoducho začneme v Djangu niečo vytvárať a všetky dôležité veci sa naučíme popri tom!