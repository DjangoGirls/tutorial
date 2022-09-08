# Čo je Django?

Django (*džängou*) je bezplatný open sourcový webový framework na vytváranie webových aplikácií napísaný v Pythone. Webový framework je súbor komponentov, ktoré ti pomôžu vytvárať stránky rýchlejšie a ľahšie.

Pri tvorení webových stránok potrebuješ vždy sadu podobných komponentov: spôsob, ako riešiť autentifikáciu užívateľov a užívateliek (registráciu, prihlásenie, odhlásenie), kontrolný panel web stránky, formuláre, spôsob, ako nahrávať súbory, atď.

Našťastie si iní ľudia už dávno všimli, že webové vývojárky a vývojári čelia pri tvorbe nového webu podobným problémom, takže sa spojili a vytvorili frameworky (Django je jedným z nich), ktoré ti poskytujú hotové komponenty, ktoré môžeš použiť.

Frameworky sú tu na to, aby si nemusela znovu vynachádzať koleso. Uľahčia ti tvorbu nových web stránok.

## Prečo potrebuješ framework?

Aby sme pochopili, čo vlastne Django je, potrebujeme sa zblízka pozrieť na servery. Prvá vec, čo o nich musíš vedieť, je, že budú obsluhovať tvoju stránku.

Predstav si poštovú schránku (port), na ktorej sa sledujú prichádzajúce listy (žiadosti). To vlastne robí web server. Web server si prečíta list a pošle odpoveď v podobe web stránky. Ale ak chceš niečo poslať, potrebuješ mať nejaký obsah. A Django je to, čo ti ten obsah pomôže vytvoriť.

## Čo sa stane, ak si niekto vyžiada web stránku z tvojho servera?

Keď na webový server príde žiadosť, tá je preposlaná do Djanga, ktoré sa pokúsi zistiť, čoho sa vlastne žiadosť týka. Najprv si zoberie adresu webstránky a zisťuje, čo má urobiť. Túto časť vykonáva Django **urlresolver** (všimni si, že adresa webstránku sa nazýva URL (Uniform Resource Locator), takže názov *urlresolver* dáva zmysel). Nie je to žiadna veda - zoberie zoznam vzorov (patterns) a porovnáva ich s URL. Django overuje vzory od vrchu smerom dolu a ak nájde zhodu, pošle žiadosť príslušnej funkcii (ktorá sa nazýva *view*).

Predstav si poštárku s listom. Kráča ulicou a porovnáva čísla domov s číslom na liste. Ak sa zhoduje, nechá tam list. Takto funguje urlresolver!

Vo funkcii *view* sa dejú všetky zaujímavé veci: môžeme sa pozrieť do databázy a vyhľadať nejaké informácie. Čo ak užívateľka požiada o zmenu v údajoch? Je to, akoby poslala list s obsahom: "Prosím, zmeňte popis mojej práce." *view* overí, či je oprávnená takú zmenu spraviť, potom popis práce zaktualizuje a naspäť pošle správu: "Hotovo!". Následne *view* vygeneruje odpoveď a Django ho pošle do prehliadača patriacemu užívateľke.

Samozrejme, vyššie uvedený popis je trochu zjednodušený, ale zatiaľ ešte nepotrebuješ vedieť všetky technické detaily. Pre všeobecnú predstavu to stačí.

Takže namiesto zložitého študovania detailov jednoducho začneme v Djangu niečo budovať a všetky dôležité veci sa naučíme popri tom!