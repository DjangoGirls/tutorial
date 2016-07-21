# Ako funguje Internet

> Táto kapitola je inšpirovaná prednáškou "Ako funguje Internet" od Jessicy McKellar (http://web.mit.edu/jesstess/www/).

Stavíme sa, že Internet používaš každý deň. Ale vieš, čo sa deje, keď napíšeš adresu, ako https://djangogirls.org do prehliadača a stlačíš `enter`?

Prvá vec, ktorú potrebuješ vedieť je, že webové stránky sú len kopa súborov uložených na pevnom disku. Podobne ako tvoje filmy, hudba a obrázky. Ale je tu jedna časť, ktorá je špecifická pre webové stránky: obsahujú počítačový kód nazývaný HTML.

Pokiaľ nemáš skúsenosti s programovaní, môže byť pochopenie HTML zo začiatku zložité, ale tvoj webový prehliadač (ako Chrome, Safari, Firefox atď.) ho milujú. Webové prehliadače sú navrhnuté na to, aby rozumeli kódu, nasledovali jeho inštrukcie a prezentovali súbory, ktoré tvoria tvoju webovú stránku presne tak, ako to chceš.

Ako s každým súborom, potrebujeme uložiť HTML súbor niekde na pevnom disku. V prípade Interntu používame špeciálne, výkonné počítače nazývane *servery*. Nemajú obrazovku, myš alebo klávesnicu, pretože ich hlavnou úlohou je ukladať dáta a poskytovať ich. Preto ich voláme *servery* -- pretože *poskytujú* (anglicky serve) tvoje dáta.

OK, avšak chceš vedieť, ako vyzerá Internet, že?

Nakreslili sme ti obrázok! Vyzerá takto:

![Obrázok 1.1][1]

 [1]: images/internet_1.png

Vyzerá to ako neporiadok, že? V skutočnosti je to sieť prepojených strojov (nedávno spomenutých *serverov*). Stoviek a tisícok strojov! Mnoho, mnoho kilometrov káblov po celom svete! Môžeš navštíviť stránku Submarine Cable Map (http://submarinecablemap.com) aby si videla nakoľko komplikovaná sieť to je. Tu je obrázok zo stránky:

![Obrázok 1.2][2]

 [2]: images/internet_3.png

Nie je to fascinujúce? Ale zjavne nie je možné mať kábel medzi každým strojom pripojeným k Internetu. Takže na to, aby sme boli schopní kontaktovať stroj (napríklad ten na ktorom je uložená stránka https://djangogirls.org) musíme poslať žiadosť cez mnoho, mnoho rozdielnych strojov.

Vyzerá to takto:

![Obrázok 1.3][3]

 [3]: images/internet_2.png

Predstav si, že keď napíšeš https://djangogirls.org, pošleš list, v ktorom stojí: "Drahé Django Girls, chcem vidieť stránku djangogirls.org. Prosím pošli mi ju!"

Tvoj list ide na najbližšiu poštu. Potom ide na ďalšiu, ktorá je o čosi bližšie adresátovi, potom na ďalšiu a ďalšiu až kým nedorazí do svojej destinácie. Jediná unikátna vec je, že ako pošleš mnoho listov (*data paketov*) na rovnaké miesto, môžu ísť cez úplne odlišné pošty (*routy*). Záleží to na tom, ako sú distribuované na každej pošte.

![Obrázok 1.4][4]

 [4]: images/internet_4.png

Áno, je to tak jednoduché. Pošleš správu a očakávaš nejakú odpoveď. Samozrejme, namiesto papiera a pera použijes byty dát, ale myšlienka je rovnaká!

Namiesto adries s menom ulice, mesta, PSČ a krajinou používame IP adresy. Tvoj počítač sa najprv opýta DNS (Domain Name System) aby preložil djangogirls.org na IP adresu. Funguje to trocha ako staré dobré telefónne zoznamy, kde si môžeš vyhľadať meno osoby ktorú chceš kontaktovať a nájsť jej telefón a adresu.

Keď pošleš list, musí mať určité náležitosti, aby ho bolo možné správne doručiť: adresu, známku atď. Taktiež používaš jazyk, ktorému adresát rozumie, že? Rovnako to funguje aj s *data paketmi* ktoré pošleš aby sa ti zobrazila stránka. Používame protokol s názvom HTTP (Hypertext Transfer Protocol).

Takže, v podstate, keď máš webovú stránku, musíš mať *server* (stroj) na ktorom bude žiť. Keď *server* obdrží prichádzajúcu *požiadavku* (v liste), pošle naspäť tvoju webovú stránku (v ďalšom liste).

Keďže toto je Django tutoriál, spýtaš sa, čo robí Django. Keď pošleš odpoveď, nechceš vždy poslať rovnaké veci každému. Je oveľa lepšie ak sú tvoje listy osobné, hlavne pre osobu, ktorá ti práve teraz napísala, že? Django ti pomáha vytvoriť tieto osobné, zaujímavé listy :).

Dosť bolo rečí, je čas tvoriť!