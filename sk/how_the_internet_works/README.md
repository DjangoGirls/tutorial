# Ako funguje Internet

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

Prvá vec, ktorú potrebuješ vedieť je, že webové stránky sú len kopa súborov uložených na pevnom disku. Podobne ako tvoje filmy, hudba a obrázky. Ale je tu jedna časť, ktorá je špecifická pre webové stránky: obsahujú počítačový kód nazývaný HTML.

Pokiaľ nemáš skúsenosti s programovaní, môže byť pochopenie HTML zo začiatku zložité, ale tvoj webový prehliadač (ako Chrome, Safari, Firefox atď.) ho milujú. Webové prehliadače sú navrhnuté na to, aby rozumeli kódu, nasledovali jeho inštrukcie a prezentovali súbory, ktoré tvoria tvoju webovú stránku presne tak, ako to chceš.

Ako s každým súborom, potrebujeme uložiť HTML súbor niekde na pevnom disku. V prípade Interntu používame špeciálne, výkonné počítače nazývane *servery*. Nemajú obrazovku, myš alebo klávesnicu, pretože ich hlavnou úlohou je ukladať dáta a poskytovať ich. That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

Nakreslili sme ti obrázok! Vyzerá takto:

![Obrázok 1.1](images/internet_1.png)

Vyzerá to ako neporiadok, že? In fact it is a network of connected machines (the above-mentioned *servers*). Stoviek a tisícok strojov! Mnoho, mnoho kilometrov káblov po celom svete! Môžeš navštíviť stránku Submarine Cable Map (http://submarinecablemap.com) aby si videla nakoľko komplikovaná sieť to je. Tu je obrázok zo stránky:

![Obrázok 1.2](images/internet_3.png)

Nie je to fascinujúce? Ale zjavne nie je možné mať kábel medzi každým strojom pripojeným k Internetu. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

Vyzerá to takto:

![Obrázok 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

Tvoj list ide na najbližšiu poštu. Potom ide na ďalšiu, ktorá je o čosi bližšie adresátovi, potom na ďalšiu a ďalšiu až kým nedorazí do svojej destinácie. Jediná unikátna vec je, že ako pošleš mnoho listov (*data paketov*) na rovnaké miesto, môžu ísť cez úplne odlišné pošty (*routy*). Záleží to na tom, ako sú distribuované na každej pošte.

![Obrázok 1.4](images/internet_4.png)

Áno, je to tak jednoduché. Pošleš správu a očakávaš nejakú odpoveď. Samozrejme, namiesto papiera a pera použijes byty dát, ale myšlienka je rovnaká!

Namiesto adries s menom ulice, mesta, PSČ a krajinou používame IP adresy. Tvoj počítač sa najprv opýta DNS (Domain Name System) aby preložil djangogirls.org na IP adresu. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. Taktiež používaš jazyk, ktorému adresát rozumie, že? Rovnako to funguje aj s *data paketmi* ktoré pošleš aby sa ti zobrazila stránka. Používame protokol s názvom HTTP (Hypertext Transfer Protocol).

Takže, v podstate, keď máš webovú stránku, musíš mať *server* (stroj) na ktorom bude žiť. Keď *server* obdrží prichádzajúcu *požiadavku* (v liste), pošle naspäť tvoju webovú stránku (v ďalšom liste).

Since this is a Django tutorial, you might ask what Django does. Keď pošleš odpoveď, nechceš vždy poslať rovnaké veci každému. Je oveľa lepšie ak sú tvoje listy osobné, hlavne pre osobu, ktorá ti práve teraz napísala, že? Django helps you with creating these personalized, interesting letters. :)

Enough talk – time to create!